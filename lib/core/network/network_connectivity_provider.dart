import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../socket/socket_manager_provider.dart';
import '../utils/app_logger.dart';

part 'network_connectivity_provider.g.dart';

@immutable
class NetworkConnectivityState {
  final bool isOnline;
  final bool isChecking;
  final List<ConnectivityResult> connectivityResults;
  final bool wasOffline;

  const NetworkConnectivityState({
    this.isOnline = true,
    this.isChecking = false,
    this.connectivityResults = const [ConnectivityResult.wifi, ConnectivityResult.mobile],
    this.wasOffline = false,
  });

  NetworkConnectivityState copyWith({
    bool? isOnline,
    bool? isChecking,
    List<ConnectivityResult>? connectivityResults,
    bool? wasOffline,
  }) {
    return NetworkConnectivityState(
      isOnline: isOnline ?? this.isOnline,
      isChecking: isChecking ?? this.isChecking,
      connectivityResults: connectivityResults ?? this.connectivityResults,
      wasOffline: wasOffline ?? this.wasOffline,
    );
  }
}

@Riverpod(keepAlive: true)
class NetworkConnectivityNotifier extends _$NetworkConnectivityNotifier
    with WidgetsBindingObserver {
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  Timer? _debounceTimer;

  @override
  NetworkConnectivityState build() {
    WidgetsBinding.instance.addObserver(this);
    _initConnectivityListener();

    ref.onDispose(() {
      WidgetsBinding.instance.removeObserver(this);
      _subscription?.cancel();
      _debounceTimer?.cancel();
    });

    return const NetworkConnectivityState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      checkConnectivityNow();
    }
  }

  void _initConnectivityListener() {
    _subscription = Connectivity().onConnectivityChanged.listen((results) {
      _scheduleProbeCheck(results);
    });
    // Run initial verification check
    checkConnectivityNow();
  }

  void _scheduleProbeCheck(List<ConnectivityResult> results) {
    _debounceTimer?.cancel();

    // If interface is immediately known to be none, update state directly
    if (results.contains(ConnectivityResult.none) || results.isEmpty) {
      _updateState(isOnline: false, results: results);
      return;
    }

    // Debounce active probing to prevent rapid UI flickering on network handovers
    _debounceTimer = Timer(const Duration(milliseconds: 750), () {
      _performActiveProbe(results);
    });
  }

  Future<void> checkConnectivityNow() async {
    try {
      final results = await Connectivity().checkConnectivity();
      if (results.contains(ConnectivityResult.none) || results.isEmpty) {
        _updateState(isOnline: false, results: results);
      } else {
        await _performActiveProbe(results);
      }
    } catch (e) {
      AppLogger.e('Error checking connectivity: $e');
    }
  }

  Future<void> _performActiveProbe(List<ConnectivityResult> results) async {
    state = state.copyWith(isChecking: true);

    bool hasInternet = false;
    try {
      // Lookup google DNS / client endpoint for fast lightweight connection test
      final result = await InternetAddress.lookup('clients3.google.com')
          .timeout(const Duration(seconds: 4));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasInternet = true;
      }
    } catch (e) {
      hasInternet = false;
    }

    _updateState(isOnline: hasInternet, results: results);
  }

  void _updateState({
    required bool isOnline,
    required List<ConnectivityResult> results,
  }) {
    final previouslyOffline = !state.isOnline || state.wasOffline;
    final isRestored = previouslyOffline && isOnline;

    if (isRestored) {
      AppLogger.i('🌐 Network connectivity restored!');
      // Trigger socket reconnect when coming back online while on duty
      try {
        final socketStatus = ref.read(socketManagerProvider);
        if (socketStatus.isOnDuty) {
          ref.read(socketManagerProvider.notifier).goOnline(force: true);
        }
      } catch (e) {
        AppLogger.e('Error triggering socket reconnect on network restore: $e');
      }
    }

    state = state.copyWith(
      isOnline: isOnline,
      isChecking: false,
      connectivityResults: results,
      wasOffline: !isOnline || (isRestored ? true : state.wasOffline),
    );
  }

  void clearWasOfflineFlag() {
    state = state.copyWith(wasOffline: false);
  }
}
