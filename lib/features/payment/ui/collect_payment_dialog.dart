import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/localization/locale_provider.dart';
import '../../../core/utils/app_snackbar.dart';
import '../providers/payment_controller.dart';

class CollectPaymentDialog extends ConsumerStatefulWidget {
  final String orderId;
  final double amount;

  const CollectPaymentDialog({
    super.key,
    required this.orderId,
    required this.amount,
  });

  static Future<void> show(BuildContext context, String orderId, double amount) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CollectPaymentDialog(orderId: orderId, amount: amount),
    );
  }

  @override
  ConsumerState<CollectPaymentDialog> createState() => _CollectPaymentDialogState();
}

class _CollectPaymentDialogState extends ConsumerState<CollectPaymentDialog> {
  bool _isCollectingCash = false;
  bool _showQrCode = false;

  Future<void> _collectCash() async {
    setState(() {
      _isCollectingCash = true;
    });

    try {
      await ref.read(paymentControllerProvider.notifier).collectCashPayment(
            orderId: widget.orderId,
          );

      if (mounted) {
        AppSnackbar.showSuccess(
          context: context,
          message: context.l10n.cashCollectedSuccess,
        );
        Navigator.of(context).pop(); // Close bottom sheet
      }
    } catch (e) {
      if (mounted) {
        AppSnackbar.showError(
          context: context,
          message: e.toString(),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isCollectingCash = false;
        });
      }
    }
  }

  String _generateUpiQrUrl() {
    final upiUrl = 'upi://pay?pa=reachu.driver@upi&pn=Reachu%Driver&am=${widget.amount}&cu=INR&tn=Ride_${widget.orderId}';
    final encoded = Uri.encodeComponent(upiUrl);
    return 'https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=$encoded';
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final mutedTextColor = isDark ? AppColors.neutral400 : AppColors.neutral500;
    final cardBgColor = isDark ? AppColors.darkSurface02 : AppColors.lightSurface00;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface01 : AppColors.lightSurface01,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle Bar for Bottom Sheet
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: isDark ? AppColors.neutral700 : AppColors.neutral300,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: 24.h),

            Text(
              context.l10n.collectPayment,
              style: AppTextStyles.titleLarge.copyWith(
                color: primaryTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              context.l10n.orderNumber(widget.orderId.substring(widget.orderId.length - 6).toUpperCase()),
              style: AppTextStyles.bodyMedium.copyWith(color: mutedTextColor),
            ),
            SizedBox(height: 16.h),

            // Amount Display Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20.h),
              decoration: BoxDecoration(
                color: cardBgColor,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: isDark ? AppColors.neutral800 : AppColors.neutral200,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    context.l10n.totalFare,
                    style: AppTextStyles.labelSmall.copyWith(
                      color: mutedTextColor,
                      letterSpacing: 1.0,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "₹ ${widget.amount.toStringAsFixed(2)}",
                    style: AppTextStyles.headlineLarge.copyWith(
                      color: AppColors.primary500,
                      fontWeight: FontWeight.w900,
                      fontSize: 32.sp,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            if (_showQrCode) ...[
              // QR Code Card
              Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: CachedNetworkImage(
                  imageUrl: _generateUpiQrUrl(),
                  width: 200.w,
                  height: 200.w,
                  placeholder: (context, url) => SizedBox(
                    width: 200.w,
                    height: 200.w,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(color: AppColors.primary500),
                          SizedBox(height: 12.h),
                          Text(
                            context.l10n.generatingQr,
                            style: AppTextStyles.bodySmall.copyWith(color: AppColors.neutral500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error_outline_rounded,
                    color: AppColors.errorLight,
                    size: 48.sp,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                context.l10n.customerScanQr,
                style: AppTextStyles.bodySmall.copyWith(color: mutedTextColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
            ],

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 56.h,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        setState(() {
                          _showQrCode = !_showQrCode;
                        });
                      },
                      icon: Icon(
                        _showQrCode ? Icons.close_rounded : Icons.qr_code_2_rounded,
                        color: AppColors.primary500,
                      ),
                      label: Text(
                        _showQrCode ? context.l10n.hideQrCode : context.l10n.displayQrCode,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.primary500,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.primary500, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: SizedBox(
                    height: 56.h,
                    child: ElevatedButton.icon(
                      onPressed: _isCollectingCash ? null : _collectCash,
                      icon: _isCollectingCash
                          ? const SizedBox.shrink()
                          : const Icon(Icons.money_rounded, color: Colors.white),
                      label: _isCollectingCash
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.5,
                              ),
                            )
                          : Text(
                              context.l10n.collectCash,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.successDark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        elevation: 0,
                      ),
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
