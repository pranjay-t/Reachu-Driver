import 'dart:async';
import 'dart:convert';
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

    // Check and load pending ride request from SharedPreferences on provider creation
    loadPendingRideFromPrefs();

    ref.onDispose(() {
      _timer?.cancel();
      _newRideSub?.cancel();
      _cancelRideSub?.cancel();
      RideSoundService.instance.stopRideAlert();
    });

    return [];
  }

  /// Reloads SharedPreferences to check if a pending ride request arrived in background/killed state.
  /// Automatically discards stale or expired orders.
  Future<void> loadPendingRideFromPrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.reload();

      final lastRideJson = prefs.getString('last_ride_request');
      if (lastRideJson == null || lastRideJson.isEmpty) return;

      final rawTs = prefs.get('last_ride_request_ts');
      final pendingTs = (rawTs is num)
          ? rawTs.toInt()
          : (int.tryParse(rawTs?.toString() ?? '') ?? 0);
      final now = DateTime.now().millisecondsSinceEpoch;
      final ageMs = pendingTs > 0 ? (now - pendingTs) : 0;

      final parsed = jsonDecode(lastRideJson) as Map<String, dynamic>;
      final rideModel = RideRequestModel.fromJson(parsed);
      final timeoutSec = rideModel.timeout > 0 ? rideModel.timeout : 50;

      if (pendingTs > 0 && ageMs >= (timeoutSec * 1000)) {
        AppLogger.w(
          '⏱️ [RideQueue] Stored ride request ${rideModel.rideId} is expired ($ageMs ms old). Discarding.',
        );
        await _clearStoredRidePrefs(prefs);
        return;
      }

      final remainingSeconds = timeoutSec - (ageMs ~/ 1000);
      if (remainingSeconds <= 0) {
        AppLogger.w('⏱️ [RideQueue] Remaining seconds <= 0. Discarding.');
        await _clearStoredRidePrefs(prefs);
        return;
      }

      AppLogger.i(
        '🧾 [RideQueue] Loading pending background ride: orderId=${rideModel.rideId}, remaining=$remainingSeconds/$timeoutSec s',
      );
      addOrUpdateRide(parsed, remainingSeconds: remainingSeconds);

      // Clear the killed state flag so this order isn't reprocessed
      await prefs.setBool('pending_ride_from_killed', false);
    } catch (e, stack) {
      AppLogger.e('Error loading pending ride from prefs: $e', error: e, stackTrace: stack);
    }
  }

  Future<void> _clearStoredRidePrefs(SharedPreferences prefs) async {
    await prefs.remove('last_ride_request');
    await prefs.remove('last_ride_request_ts');
    await prefs.setBool('pending_ride_from_killed', false);
    await prefs.remove('pending_open_requests');
    await prefs.remove('pending_accept_order_id');
    await prefs.remove('pending_decline_order_id');
  }

  void _subscribeToSocketStreams() {
    final client = ref.read(socketClientProvider);

    _newRideSub = client.newRideStream.listen((mappedData) {
      addOrUpdateRide(mappedData);
    });

    _cancelRideSub = client.cancelRideStream.listen((mappedData) {
      final orderId = (mappedData['orderId'] ??
              mappedData['rideId'] ??
              mappedData['id'] ??
              mappedData['_id'] ??
              '')
          .toString();
      if (orderId.isNotEmpty) {
        removeRide(orderId, reason: 'cancelled_by_server');
      }
    });
  }

  void addOrUpdateRide(Map<String, dynamic> rideData, {int? remainingSeconds}) {
    try {
      final rideModel = RideRequestModel.fromJson(rideData);
      final orderId = rideModel.rideId;
      final timeout = rideModel.timeout > 0 ? rideModel.timeout : 50;
      final actualRemaining = remainingSeconds ?? timeout;

      if (actualRemaining <= 0) return;

      // Check if it already exists
      final idx = state.indexWhere((e) => e.orderId == orderId);
      if (idx >= 0) {
        AppLogger.i('🧾 [RideQueue] Updating existing ride request card: $orderId');
        final list = [...state];
        list[idx] = RideRequestItem(
          orderId: orderId,
          rideModel: rideModel,
          totalSeconds: timeout,
          remainingSeconds: actualRemaining,
          progress: actualRemaining / timeout,
        );
        state = list;
        return;
      }

      AppLogger.i(
        '🧾 [RideQueue] Inserting new ride request card: $orderId (remaining: $actualRemaining s)',
      );
      final newItem = RideRequestItem(
        orderId: orderId,
        rideModel: rideModel,
        totalSeconds: timeout,
        remainingSeconds: actualRemaining,
        progress: actualRemaining / timeout,
      );

      // Newest comes first
      state = [newItem, ...state];
      _startTimerIfNeeded();

      // Trigger local notification to play custom order sound
      NotificationService.showOrderRequestNotification(
        orderId: orderId,
        title: 'New Order Request Available!',
        body: 'Tap to view details for ₹${rideModel.totalFare.toStringAsFixed(2)} order request.',
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
