import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../core/localization/locale_provider.dart';
import 'background_location_disclosure.dart';

/// A comprehensive permission gate that blocks drivers from going online
/// until ALL required permissions are granted.
///
/// Checks:
/// 1. Location (Always / Background)
/// 2. Battery Optimization Exemption (Doze whitelist)
/// 3. Notifications
/// 4. Overlay / Draw Over Apps (System Alert Window)
///
/// Returns `true` if ALL permissions are granted, `false` otherwise.
class PermissionGatePopup {
  static bool _isShowing = false;

  /// Checks if all required permissions are granted silently.
  static Future<bool> _checkAllGranted() async {
    final results = await Future.wait([
      Permission.locationAlways.isGranted,
      Permission.ignoreBatteryOptimizations.isGranted,
      Permission.notification.isGranted,
      Permission.systemAlertWindow.isGranted,
    ]);
    return results[0] && results[1] && results[2] && results[3];
  }

  /// Checks all required permissions. Returns `true` if everything is granted.
  /// If any permission is missing, shows a premium interactive popup and returns `true` or `false`
  /// depending on whether they ended up granting all permissions.
  static Future<bool> checkAndShow(BuildContext context) async {
    if (!Platform.isAndroid) return true; // Only enforce on Android

    final allGranted = await _checkAllGranted();
    if (allGranted) return true;

    if (_isShowing) return false;
    _isShowing = true;

    if (!context.mounted) return false;

    final result = await showDialog<bool>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.4),
      barrierDismissible: false,
      builder: (ctx) => const _PermissionGateDialog(),
    );

    _isShowing = false;
    return result ?? false;
  }
}

class _PermissionGateDialog extends StatefulWidget {
  const _PermissionGateDialog();

  @override
  State<_PermissionGateDialog> createState() => _PermissionGateDialogState();
}

class _PermissionGateDialogState extends State<_PermissionGateDialog>
    with WidgetsBindingObserver {
  bool _isLocationAlways = false;
  bool _isBatteryExempt = false;
  bool _isNotification = false;
  bool _isOverlay = false;
  bool _isLoading = true;
  bool _didPop = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkPermissions();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkPermissions();
    }
  }

  Future<void> _checkPermissions() async {
    final results = await Future.wait([
      Permission.locationAlways.isGranted,
      Permission.ignoreBatteryOptimizations.isGranted,
      Permission.notification.isGranted,
      Permission.systemAlertWindow.isGranted,
    ]);

    if (!mounted) return;

    setState(() {
      _isLocationAlways = results[0];
      _isBatteryExempt = results[1];
      _isNotification = results[2];
      _isOverlay = results[3];
      _isLoading = false;
    });

    final allGranted = results[0] && results[1] && results[2] && results[3];
    if (allGranted && !_didPop && mounted) {
      _didPop = true;
      Navigator.of(context).pop(true);
    }
  }

  Future<void> _handlePermissionRequest(Permission permission) async {
    if (permission == Permission.locationAlways) {
      final granted = await BackgroundLocationDisclosure.showIfNeededAndRequest(context);
      if (granted) {
        await _checkPermissions();
      }
    } else if (permission == Permission.ignoreBatteryOptimizations) {
      final status = await Permission.ignoreBatteryOptimizations.request();
      if (status.isGranted) {
        await _checkPermissions();
      }
    } else if (permission == Permission.notification) {
      final status = await Permission.notification.request();
      if (status.isGranted) {
        await _checkPermissions();
      }
    } else if (permission == Permission.systemAlertWindow) {
      await Permission.systemAlertWindow.request();
      // On Android, requesting systemAlertWindow opens the specific system settings page.
      // So the app will go to background. When they return, didChangeAppLifecycleState will catch it.
      await _checkPermissions();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SizedBox.shrink();
    }

    final double w = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        width: w * 0.9,
        padding: EdgeInsets.symmetric(
          vertical: w * 0.06,
          horizontal: w * 0.05,
        ),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface02 : Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 20,
              spreadRadius: 5,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Icon
                    Container(
                      padding: EdgeInsets.all(w * 0.04),
                      decoration: BoxDecoration(
                        color: AppColors.errorLight.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.security_rounded,
                        color: AppColors.errorLight,
                        size: 40,
                      ).animate(
                        onPlay: (controller) => controller.repeat(reverse: true),
                      ).scale(
                        begin: const Offset(0.9, 0.9),
                        end: const Offset(1.1, 1.1),
                        duration: 1000.ms,
                        curve: Curves.easeInOut,
                      ),
                    ),
                    SizedBox(height: w * 0.04),

                    // Title
                    Text(
                      context.l10n.permissionsRequired,
                      style: AppTextStyles.titleLarge.copyWith(
                        color: isDark ? AppColors.darkTextPrimary : const Color(0xFF1A1A2E),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: w * 0.02),

                    // Subtitle
                    Text(
                      context.l10n.enableAllPermissionsSubtitle,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: w * 0.05),

                    // Checklist
                    _buildInteractiveRow(
                      context,
                      w,
                      context.l10n.locationAlwaysTitle,
                      context.l10n.locationAlwaysSubtitle,
                      _isLocationAlways,
                      Icons.location_on_rounded,
                      Permission.locationAlways,
                      isDark,
                    ),
                    _buildInteractiveRow(
                      context,
                      w,
                      context.l10n.batteryUnrestrictedTitle,
                      context.l10n.batteryUnrestrictedSubtitle,
                      _isBatteryExempt,
                      Icons.battery_alert_rounded,
                      Permission.ignoreBatteryOptimizations,
                      isDark,
                    ),
                    _buildInteractiveRow(
                      context,
                      w,
                      context.l10n.notificationsTitle,
                      context.l10n.notificationsSubtitle,
                      _isNotification,
                      Icons.notifications_active_rounded,
                      Permission.notification,
                      isDark,
                    ),
                    _buildInteractiveRow(
                      context,
                      w,
                      context.l10n.displayOverAppsTitle,
                      context.l10n.displayOverAppsSubtitle,
                      _isOverlay,
                      Icons.layers_rounded,
                      Permission.systemAlertWindow,
                      isDark,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: w * 0.05),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDark ? AppColors.darkSurface03 : Colors.grey.shade200,
                      foregroundColor: isDark ? AppColors.darkTextPrimary : Colors.black87,
                      padding: EdgeInsets.symmetric(vertical: w * 0.035),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      if (!_didPop) {
                        _didPop = true;
                        Navigator.of(context).pop(false);
                      }
                    },
                    child: Text(
                      context.l10n.cancel,
                      style: AppTextStyles.titleSmall.copyWith(
                        color: isDark ? AppColors.darkTextPrimary : Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: w * 0.03),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary500,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: w * 0.035),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () async {
                      await openAppSettings();
                    },
                    child: Text(
                      context.l10n.openSettings,
                      style: AppTextStyles.titleSmall.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ).animate()
       .scale(duration: 400.ms, curve: Curves.easeOutBack)
       .fadeIn(duration: 300.ms),
    );
  }

  Widget _buildInteractiveRow(
    BuildContext context,
    double w,
    String title,
    String subtitle,
    bool isGranted,
    IconData icon,
    Permission permission,
    bool isDark,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: w * 0.01),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isGranted ? null : () => _handlePermissionRequest(permission),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: EdgeInsets.all(w * 0.025),
            decoration: BoxDecoration(
              color: isGranted 
                  ? Colors.green.withValues(alpha: 0.05) 
                  : Colors.red.withValues(alpha: 0.02),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isGranted
                    ? Colors.green.withValues(alpha: 0.15)
                    : Colors.red.withValues(alpha: 0.1),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                // Status icon
                Container(
                  width: w * 0.09,
                  height: w * 0.09,
                  decoration: BoxDecoration(
                    color: isGranted
                        ? Colors.green.withValues(alpha: 0.1)
                        : Colors.red.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    isGranted
                        ? Icons.check_circle_rounded
                        : Icons.cancel_rounded,
                    color: isGranted ? Colors.green : Colors.red,
                    size: w * 0.055,
                  ),
                ),
                SizedBox(width: w * 0.03),
                // Text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isGranted
                              ? (isDark ? AppColors.darkTextPrimary : Colors.black87)
                              : Colors.red.shade700,
                        ),
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        subtitle,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                if (!isGranted)
                  Icon(
                    Icons.chevron_right_rounded,
                    color: Colors.grey.shade400,
                    size: w * 0.05,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
