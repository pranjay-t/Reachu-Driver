import 'dart:async';
import 'dart:ui' show ImageFilter;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reachu_driver/app/theme/app_colors.dart';
import 'package:reachu_driver/app/theme/app_dimensions.dart';
import 'package:reachu_driver/app/router/app_router.dart';
import 'app_logger.dart';

enum SnackBarType { success, error, info, warning }

/// Both names refer to the same consolidated class for backward compatibility.
typedef AppSnackBar = AppSnackbar;

/// A utility class for showing user-friendly premium messages.
class AppSnackbar {
  AppSnackbar._();

  static OverlayEntry? _currentOverlay;

  static void show(
    BuildContext? context, {
    required String message,
    SnackBarType type = SnackBarType.info,
    String? title,
    Duration duration = const Duration(seconds: 4),
  }) {
    // Dismiss any active overlay snackbar first
    dismiss();

    final activeContext = context ?? rootNavigatorKey.currentContext;
    if (activeContext == null) {
      // Direct fallback to native toast if context is not ready
      _showFallbackToast(message, type);
      return;
    }

    try {
      final overlayState = Navigator.of(activeContext).overlay;
      if (overlayState == null) {
        _showFallbackToast(message, type);
        return;
      }

      _currentOverlay = OverlayEntry(
        builder: (context) {
          return Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _OverlaySnackBarWidget(
              message: message,
              type: type,
              title: title,
              duration: duration,
              onDismiss: dismiss,
            ),
          );
        },
      );

      overlayState.insert(_currentOverlay!);
    } catch (_) {
      _showFallbackToast(message, type);
    }
  }

  static void dismiss() {
    if (_currentOverlay != null) {
      try {
        _currentOverlay!.remove();
      } catch (_) {}
      _currentOverlay = null;
    }
  }

  static void showError({BuildContext? context, required String message}) {
    try {
      show(context, message: message, type: SnackBarType.error);
    } catch (e, stack) {
      AppLogger.e(
        'Error showing custom snackbar, falling back to native toast',
        error: e,
        stackTrace: stack,
      );
      _showFallbackToast(message, SnackBarType.error);
    }
  }

  static void showSuccess({BuildContext? context, required String message}) {
    try {
      show(context, message: message, type: SnackBarType.success);
    } catch (e, stack) {
      AppLogger.e(
        'Error showing custom snackbar, falling back to native toast',
        error: e,
        stackTrace: stack,
      );
      _showFallbackToast(message, SnackBarType.success);
    }
  }

  static void _showFallbackToast(String message, SnackBarType type) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      backgroundColor: type == SnackBarType.success
          ? AppColors.successDark
          : type == SnackBarType.error
          ? AppColors.errorDark
          : Colors.black,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }
}

class _OverlaySnackBarWidget extends StatefulWidget {
  final String message;
  final SnackBarType type;
  final String? title;
  final Duration duration;
  final VoidCallback onDismiss;

  const _OverlaySnackBarWidget({
    required this.message,
    required this.type,
    required this.title,
    required this.duration,
    required this.onDismiss,
  });

  @override
  State<_OverlaySnackBarWidget> createState() => _OverlaySnackBarWidgetState();
}

class _OverlaySnackBarWidgetState extends State<_OverlaySnackBarWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;
  Timer? _autoDismissTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();

    // Start auto-dismiss timer
    _autoDismissTimer = Timer(widget.duration, () {
      _handleDismiss();
    });
  }

  @override
  void dispose() {
    _autoDismissTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _handleDismiss() async {
    if (mounted) {
      await _controller.reverse();
      widget.onDismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    Color statusColor;
    switch (widget.type) {
      case SnackBarType.success:
        statusColor = isDark ? AppColors.successLight : AppColors.successDark;
        break;
      case SnackBarType.error:
        statusColor = isDark ? AppColors.errorLight : AppColors.errorDark;
        break;
      case SnackBarType.warning:
        statusColor = isDark ? AppColors.warningLight : AppColors.warningDark;
        break;
      case SnackBarType.info:
        statusColor = theme.colorScheme.primary;
        break;
    }

    // Blend base surface color with 5% (light) / 8% (dark) status tint for premium look
    final baseSurfaceColor =
        theme.cardTheme.color ??
        (isDark ? AppColors.darkSurface02 : AppColors.lightSurface00);
    final backgroundColor = Color.alphaBlend(
      statusColor.withValues(alpha: isDark ? 0.08 : 0.05),
      baseSurfaceColor,
    ).withValues(alpha: 0.85);

    // Border: blend statusColor at 30% opacity with standard theme border for a subtle colored outline
    final baseBorderColor =
        theme.dividerTheme.color ??
        (isDark ? AppColors.neutral800 : AppColors.neutral200);
    final borderColor = Color.alphaBlend(
      statusColor.withValues(alpha: 0.3),
      baseBorderColor,
    );

    // Capsule border radius for a modern floating pill look
    final borderRadius = BorderRadius.circular(AppDimensions.radiusFull);

    // Combined double shadow: ambient colored glow indicating status + tight physical dark shadow
    final snackBarShadow = [
      BoxShadow(
        color: Colors.black.withValues(alpha: isDark ? 0.35 : 0.08),
        blurRadius: 12,
        offset: const Offset(0, 4),
      ),
      BoxShadow(
        color: statusColor.withValues(alpha: isDark ? 0.16 : 0.08),
        blurRadius: 24,
        offset: const Offset(0, 8),
        spreadRadius: 1,
      ),
    ];

    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.space24,
            vertical: AppDimensions.space12,
          ),
          child: SlideTransition(
            position: _offsetAnimation,
            child: Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.up,
              onDismissed: (_) => widget.onDismiss(),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.85,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    boxShadow: snackBarShadow,
                  ),
                  child: ClipRRect(
                    borderRadius: borderRadius,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: borderRadius,
                          border: Border.all(color: borderColor, width: 1.2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDimensions.space24,
                            vertical: AppDimensions.space12,
                          ),
                          child: Text(
                            widget.message,
                            textAlign: TextAlign.center,
                            style:
                                theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.1,
                                ) ??
                                TextStyle(
                                  color: theme.colorScheme.onSurface,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
