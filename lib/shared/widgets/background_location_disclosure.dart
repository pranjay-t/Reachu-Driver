import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../core/localization/locale_provider.dart';

/// Google Play Policy–compliant background location disclosure.
///
/// MUST be shown before any background location permission is requested.
/// Google requires a "prominent in-app disclosure" that:
///   1. Clearly states the app collects location in the background.
///   2. Explains WHY (for ride dispatch & passenger tracking).
///   3. Is shown BEFORE the permission system prompt.
///
/// This widget shows the disclosure once per install. After the user
/// acknowledges it, it proceeds to request the location permission.
class BackgroundLocationDisclosure {
  static const String _disclosureShownKey = 'bg_location_disclosure_shown';

  /// Shows the disclosure dialog if it hasn't been shown before.
  /// Then requests [Permission.locationAlways].
  ///
  /// Returns `true` if background location is granted after the flow,
  /// `false` otherwise.
  static Future<bool> showIfNeededAndRequest(BuildContext context) async {
    if (!Platform.isAndroid) {
      // iOS has its own flow; skip disclosure
      final status = await Permission.locationAlways.request();
      return status.isGranted;
    }

    final prefs = await SharedPreferences.getInstance();
    final alreadyShown = prefs.getBool(_disclosureShownKey) ?? false;

    if (!alreadyShown) {
      if (!context.mounted) return false;
      final userAcknowledged = await _showDisclosureDialog(context);
      if (!userAcknowledged) return false; // User declined disclosure

      await prefs.setBool(_disclosureShownKey, true);
    }

    // 1. Request foreground location first (required on Android 11+ before requesting background location)
    final foregroundStatus = await Permission.location.request();
    if (!foregroundStatus.isGranted) {
      return false;
    }

    // 2. Now request the background location permission (always)
    final status = await Permission.locationAlways.request();
    return status.isGranted;
  }

  /// Returns true if background location is already granted (no dialog needed).
  static Future<bool> isAlreadyGranted() async {
    return Permission.locationAlways.isGranted;
  }

  /// Shows the mandatory in-app disclosure dialog.
  /// Returns `true` if user pressed "I Understand", `false` if dismissed.
  static Future<bool> _showDisclosureDialog(BuildContext context) async {
    final double w = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      builder: (ctx) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child:
              Container(
                    width: w * 0.92,
                    padding: EdgeInsets.all(w * 0.06),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.darkSurface02 : Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 24,
                          spreadRadius: 4,
                          offset: const Offset(0, 8),
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
                                      width: w * 0.18,
                                      height: w * 0.18,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            AppColors.primary500,
                                            AppColors.primary800,
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          w * 0.05,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.my_location_rounded,
                                        color: Colors.white,
                                        size: 36,
                                      ),
                                    )
                                    .animate()
                                    .scale(
                                      begin: const Offset(0.7, 0.7),
                                      end: const Offset(1.0, 1.0),
                                      duration: 500.ms,
                                      curve: Curves.easeOutBack,
                                    )
                                    .fadeIn(duration: 400.ms),

                                SizedBox(height: w * 0.04),

                                // Title
                                Text(
                                  context.l10n.locationUsedInBackground,
                                  style: AppTextStyles.titleLarge.copyWith(
                                    color: isDark
                                        ? AppColors.darkTextPrimary
                                        : const Color(0xFF1A1A2E),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                                SizedBox(height: w * 0.03),

                                // Mandatory disclosure text (Google Play required)
                                Container(
                                  padding: EdgeInsets.all(w * 0.04),
                                  decoration: BoxDecoration(
                                    color: isDark
                                        ? AppColors.darkSurface03
                                        : const Color(0xFFF0F4FF),
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: AppColors.primary500.withValues(
                                        alpha: 0.2,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    context.l10n.backgroundLocationDisclosureBody,
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      color: isDark
                                          ? AppColors.darkTextSecondary
                                          : const Color(0xFF37474F),
                                      height: 1.4,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),

                                SizedBox(height: w * 0.03),

                                // Note
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.info_outline_rounded,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        context.l10n.changeInAppSettingsNote,
                                        style: AppTextStyles.bodySmall.copyWith(
                                          color: Colors.grey.shade600,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: w * 0.05),

                        // Buttons
                        Column(
                          children: [
                            // Primary — accept
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () => Navigator.of(ctx).pop(true),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary500,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                    vertical: w * 0.038,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  elevation: 0,
                                ),
                                child: Text(
                                  context.l10n.iUnderstandContinue,
                                  style: AppTextStyles.titleSmall.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: w * 0.025),

                            // Secondary — decline
                            SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () => Navigator.of(ctx).pop(false),
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    vertical: w * 0.03,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                child: Text(
                                  context.l10n.notNow,
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                  .animate()
                  .scale(
                    begin: const Offset(0.85, 0.85),
                    end: const Offset(1.0, 1.0),
                    duration: 400.ms,
                    curve: Curves.easeOutBack,
                  )
                  .fadeIn(duration: 300.ms),
        );
      },
    );

    return result ?? false;
  }
}
