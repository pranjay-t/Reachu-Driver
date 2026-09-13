import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'socket_stream_manager.dart';
import 'overlay_service.dart';

final appLifecycleProvider = Provider((ref) {
  final observer = AppLifecycleObserver(ref);
  WidgetsBinding.instance.addObserver(observer);
  ref.onDispose(() {
    WidgetsBinding.instance.removeObserver(observer);
  });
  return observer;
});

class AppLifecycleObserver extends WidgetsBindingObserver {
  final Ref _ref;
  AppLifecycleObserver(this._ref);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final client = _ref.read(socketClientProvider);
    if (state == AppLifecycleState.resumed) {
      client.setNativeAppState('Foreground');
      OverlayService.instance.hideOverlay();
    } else if (state == AppLifecycleState.paused) {
      client.setNativeAppState('Background');
      if (client.isOnDuty) {
        OverlayService.instance.showOverlay();
      }
    }
  }
}
