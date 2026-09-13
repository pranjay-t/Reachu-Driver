import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:reachu_driver/core/utils/app_logger.dart';

class OverlayBubble extends StatefulWidget {
  const OverlayBubble({super.key});

  @override
  State<OverlayBubble> createState() => _OverlayBubbleState();
}

class _OverlayBubbleState extends State<OverlayBubble> {
  StreamSubscription? _overlayListenerSub;
  static Stream<dynamic>? _broadcastOverlayStream;

  @override
  void initState() {
    super.initState();
    try {
      _broadcastOverlayStream ??=
          FlutterOverlayWindow.overlayListener.asBroadcastStream();
      _overlayListenerSub = _broadcastOverlayStream!.listen(
        (event) {
          if (event == 'close_overlay') {
            FlutterOverlayWindow.closeOverlay();
          }
        },
        onError: (e) {
          AppLogger.e('🔥 [OVERLAY_BUBBLE] Listener error: $e');
        },
      );
    } catch (e) {
      AppLogger.e('🔥 [OVERLAY_BUBBLE] Failed to listen overlay: $e');
    }
  }

  @override
  void dispose() {
    _overlayListenerSub?.cancel();
    _overlayListenerSub = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0,
      child: Center(
        child: GestureDetector(
          onTap: () async {
            AppLogger.d('🔥 [OVERLAY_BUBBLE] Bubble Tapped!');
            final intent = AndroidIntent(
              action: 'android.intent.action.MAIN',
              category: 'android.intent.category.LAUNCHER',
              package: 'com.reachu.driver',
              componentName: 'com.reachu.driver.MainActivity',
              flags: <int>[
                Flag.FLAG_ACTIVITY_NEW_TASK,
                Flag.FLAG_ACTIVITY_REORDER_TO_FRONT,
                Flag.FLAG_ACTIVITY_SINGLE_TOP,
              ],
            );
            AppLogger.d(
              '🔥 [OVERLAY_BUBBLE] Launching AndroidIntent natively...',
            );
            await intent.launch();
            await Future.delayed(const Duration(milliseconds: 300));
            await FlutterOverlayWindow.closeOverlay();
          },
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/reachu_app_logo.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
