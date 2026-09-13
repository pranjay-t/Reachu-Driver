import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../../core/localization/locale_provider.dart';

class LowBalancePopup extends StatelessWidget {
  final double driverWalletLimit;
  final VoidCallback? onAddMoney;
  final VoidCallback? onDismiss;

  const LowBalancePopup({
    super.key,
    required this.driverWalletLimit,
    this.onAddMoney,
    this.onDismiss,
  });

  static Future<void> show(
    BuildContext context, {
    required double driverWalletLimit,
    VoidCallback? onAddMoney,
    VoidCallback? onDismiss,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.75),
      builder: (ctx) => LowBalancePopup(
        driverWalletLimit: driverWalletLimit,
        onAddMoney: onAddMoney,
        onDismiss: onDismiss,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final dialogBgColor = isDark ? AppColors.darkSurface02 : Colors.white;
    final primaryTextColor = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final secondaryTextColor = isDark ? AppColors.neutral400 : AppColors.neutral600;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28.r),
      ),
      elevation: 16,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
      child: Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: dialogBgColor,
          borderRadius: BorderRadius.circular(28.r),
          border: Border.all(
            color: isDark
                ? AppColors.neutral800
                : AppColors.neutral200,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Glowing Warning Icon Header
            Container(
              width: 72.w,
              height: 72.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFF5252),
                    Color(0xFFFF7961),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF5252).withValues(alpha: 0.35),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Icon(
                Icons.account_balance_wallet_rounded,
                color: Colors.white,
                size: 36.sp,
              ),
            ).animate().scale(duration: 400.ms, curve: Curves.easeOutBack),

            SizedBox(height: 20.h),

            // Title
            Text(
              context.l10n.lowWalletBalance,
              style: AppTextStyles.titleMedium.copyWith(
                color: primaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 10.h),

            // Subtitle Description
            Text(
              context.l10n.lowWalletBalanceSubtitle(driverWalletLimit.toStringAsFixed(2)),
              style: AppTextStyles.bodySmall.copyWith(
                color: secondaryTextColor,
                height: 1.4,
                fontSize: 13.sp,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 18.h),

            // Wallet Limit Info Card
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.errorSurface.withValues(alpha: isDark ? 0.15 : 0.08),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: AppColors.errorLight.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.warning_amber_rounded,
                          color: AppColors.errorLight,
                          size: 18.sp,
                        ),
                        SizedBox(width: 6.w),
                        Expanded(
                          child: Text(
                            context.l10n.minimumRequiredBalance,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: secondaryTextColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 11.sp,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    '₹ ${driverWalletLimit.toStringAsFixed(2)}',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.errorLight,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onDismiss?.call();
                    },
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      side: BorderSide(
                        color: isDark ? AppColors.neutral700 : AppColors.neutral300,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                    ),
                    child: Text(
                      context.l10n.dismiss,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: secondaryTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (onAddMoney != null) {
                        onAddMoney!();
                      } else {
                        context.push('/add_money');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary500,
                      elevation: 4,
                      shadowColor: AppColors.primary500.withValues(alpha: 0.4),
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_rounded,
                          color: Colors.white,
                          size: 18.sp,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          context.l10n.addMoney,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
