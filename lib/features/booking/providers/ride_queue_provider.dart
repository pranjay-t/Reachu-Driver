import 'dart:async';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/socket/socket_stream_manager.dart';
import '../../../core/utils/app_logger.dart';
import '../../../core/firebase/notification_service.dart';
import '../../../core/utils/ride_sound_service.dart';
import '../models/ride_request_model.dart';

part 'ride_queue_provider.g.dart';

class RideRequestItem {
  final String orderId;
  final RideRequestModel rideModel;
  final int totalSeconds;
  final int remainingSeconds;
  final double progress;

  RideRequestItem({
    required this.orderId,
    required this.rideModel,
    required this.totalSeconds,
    required this.remainingSeconds,
    required this.progress,
  });

  RideRequestItem copyWith({
    int? remainingSeconds,
    double? progress,
  }) {
    return RideRequestItem(
      orderId: orderId,
      rideModel: rideModel,
      totalSeconds: totalSeconds,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      progress: progress ?? this.progress,
    );
  }
}

@riverpod
class RideQueue extends _$RideQueue {
  Timer? _timer;
  StreamSubscription? _newRideSub;
  StreamSubscription? _cancelRideSub;

  @override
  List<RideRequestItem> build() {
    // Listen to socket incoming streams
    _subscribeToSocketStreams();

    // Check if there is a pending ride request in SharedPreferences (e.g. from killed state)
    // and load it into the queue immediately so the screen is not empty.
    SharedPreferences.getInstance().then((prefs) {
      prefs.reload().then((_) {
        final hasPending = prefs.getBool('pending_ride_from_killed') ?? false;
        if (!hasPending) return;

        final lastRideJson = prefs.getString('last_ride_request');
        if (lastRideJson != null && lastRideJson.isNotEmpty) {
          final pendingTs = prefs.getInt('last_ride_request_ts') ?? 0;
          final ageMs = DateTime.now().millisecondsSinceEpoch - pendingTs;
          // Restrict to requests received within the last 2 minutes
          if (pendingTs > 0 && ageMs < 120000) {
            try {
              final parsed = jsonDecode(lastRideJson) as Map<String, dynamic>;
              addOrUpdateRide(parsed);
              // Clear flag immediately so this block cannot fire twice
              prefs.setBool('pending_ride_from_killed', false);
            } catch (e) {
              AppLogger.e('Error loading initial pending ride request: $e');
            }
          }
        }
      });
    });

    ref.onDispose(() {
      _timer?.cancel();
      _newRideSub?.cancel();
      _cancelRideSub?.cancel();
      RideSoundService.instance.stopRideAlert();
    });

    return [];
  }

  void _subscribeToSocketStreams() {
    final client = ref.read(socketClientProvider);

    _newRideSub = client.newRideStream.listen((mappedData) {
      addOrUpdateRide(mappedData);
    });

    _cancelRideSub = client.cancelRideStream.listen((mappedData) {
      final orderId = (mappedData['orderId'] ?? '').toString();
      if (orderId.isNotEmpty) {
        removeRide(orderId, reason: 'cancelled_by_server');
      }
    });
  }

  void addOrUpdateRide(Map<String, dynamic> rideData) {
    try {
      final rideModel = RideRequestModel.fromJson(rideData);
      final orderId = rideModel.rideId;
      final timeout = rideModel.timeout;

      // Check if it already exists
      final idx = state.indexWhere((e) => e.orderId == orderId);
      if (idx >= 0) {
        AppLogger.i('🧾 [RideQueue] Updating existing ride request card: $orderId');
        final list = [...state];
        list[idx] = RideRequestItem(
          orderId: orderId,
          rideModel: rideModel,
          totalSeconds: timeout,
          remainingSeconds: timeout,
          progress: 1.0,
        );
        state = list;
        return;
      }

      AppLogger.i('🧾 [RideQueue] Inserting new ride request card: $orderId');
      final newItem = RideRequestItem(
        orderId: orderId,
        rideModel: rideModel,
        totalSeconds: timeout,
        remainingSeconds: timeout,
        progress: 1.0,
      );

      // Newest comes first
      state = [newItem, ...state];
      _startTimerIfNeeded();

      // Trigger local notification to play custom ride sound
      NotificationService.showRideRequestNotification(
        orderId: orderId,
        title: 'New Ride Request Available!',
        body: 'Tap to view details for ₹${rideModel.totalFare.toStringAsFixed(2)} ride request.',
      );

      // Start in-app looping alarm sound + vibration
      RideSoundService.instance.startRideAlert();
    } catch (e, stack) {
      AppLogger.e('Error parsing RideRequestModel inside addOrUpdateRide: $e', error: e, stackTrace: stack);
    }
  }

  void removeRide(String orderId, {String reason = 'manual'}) {
    final idx = state.indexWhere((e) => e.orderId == orderId);
    if (idx < 0) return;

    AppLogger.i('🧾 [RideQueue] Removing ride card $orderId. Reason: $reason');
    final list = [...state];
    list.removeAt(idx);
    state = list;

    if (state.isEmpty) {
      _timer?.cancel();
      _timer = null;
      RideSoundService.instance.stopRideAlert();
    }
  }

  void clearAll({String reason = 'manual_clear'}) {
    AppLogger.i('🧾 [RideQueue] Clearing all ride cards. Reason: $reason');
    _timer?.cancel();
    _timer = null;
    state = [];
    RideSoundService.instance.stopRideAlert();
  }

  void _startTimerIfNeeded() {
    if (_timer != null) return;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.isEmpty) {
        timer.cancel();
        _timer = null;
        return;
      }

      final List<RideRequestItem> updatedList = [];
      final List<String> expiredIds = [];

      for (final item in state) {
        final remaining = item.remainingSeconds - 1;
        if (remaining <= 0) {
          expiredIds.add(item.orderId);
        } else {
          updatedList.add(item.copyWith(
            remainingSeconds: remaining,
            progress: remaining / item.totalSeconds,
          ));
        }
      }

      state = updatedList;

      // Handle expired items by declining them on socket
      for (final id in expiredIds) {
        AppLogger.w('⏱️ [RideQueue] Ride request $id expired. Auto-declining...');
        ref.read(socketClientProvider).declineRide(id, reason: 'timeout_expired');
      }

      if (state.isEmpty) {
        timer.cancel();
        _timer = null;
      }
    });
  }
}
