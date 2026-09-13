import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reachu_driver/core/utils/app_logger.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../../core/utils/app_snackbar.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/localization/locale_provider.dart';
import '../providers/payment_controller.dart';

class AddMoneyScreen extends ConsumerStatefulWidget {
  const AddMoneyScreen({super.key});

  @override
  ConsumerState<AddMoneyScreen> createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends ConsumerState<AddMoneyScreen> {
  final TextEditingController _amountController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    // Auto-focus the amount field
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _amountController.dispose();
    _focusNode.dispose();
    _razorpay.clear();
    super.dispose();
  }

  void _onChipSelected(String value) {
    setState(() {
      _amountController.text = value;
      // Move cursor to the end
      _amountController.selection = TextSelection.fromPosition(
        TextPosition(offset: _amountController.text.length),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDark
        ? AppColors.darkTextPrimary
        : AppColors.lightTextPrimary;
    final mutedTextColor = isDark ? AppColors.neutral400 : AppColors.neutral500;
    final containerBg = isDark
        ? AppColors.darkSurface02
        : AppColors.lightSurface00;

    final amountText = _amountController.text;
    final isValid =
        amountText.isNotEmpty && (double.tryParse(amountText) ?? 0) > 0;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.darkSurface01
          : AppColors.lightSurface01,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: primaryTextColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          context.l10n.addMoney,
          style: AppTextStyles.titleMedium.copyWith(
            color: primaryTextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40.h),
                    Text(
                      context.l10n.enterAmountToAdd,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: mutedTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // Amount Input Section (Rupee icon + Borderless TextField)
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 16.h,
                        horizontal: 24.w,
                      ),
                      decoration: BoxDecoration(
                        color: containerBg,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: isDark
                              ? AppColors.neutral800
                              : AppColors.neutral200,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '₹',
                            style: AppTextStyles.headlineLarge.copyWith(
                              color: primaryTextColor,
                              fontSize: 40.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: TextField(
                              controller: _amountController,
                              focusNode: _focusNode,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              style: AppTextStyles.headlineLarge.copyWith(
                                color: primaryTextColor,
                                fontSize: 40.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                filled: false,
                                hintText: '0',
                                hintStyle: AppTextStyles.headlineLarge.copyWith(
                                  color: isDark
                                      ? AppColors.neutral700
                                      : AppColors.neutral300,
                                  fontSize: 40.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onChanged: (val) {
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // Quick Selection Chips (500, 1000, 2000)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: ['500', '1000', '2000'].map((amount) {
                        final isSelected = amountText == amount;
                        return InkWell(
                          onTap: () => _onChipSelected(amount),
                          borderRadius: BorderRadius.circular(30.r),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.primary500
                                  : (isDark
                                        ? AppColors.darkSurface02
                                        : AppColors.lightSurface00),
                              borderRadius: BorderRadius.circular(30.r),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.primary500
                                    : (isDark
                                          ? AppColors.neutral800
                                          : AppColors.neutral300),
                                width: 1.5,
                              ),
                            ),
                            child: Text(
                              '₹$amount',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: isSelected
                                    ? Colors.white
                                    : primaryTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),

            // Add Money Button Section
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.darkSurface01
                    : AppColors.lightSurface00,
                border: Border(
                  top: BorderSide(
                    color: isDark ? AppColors.neutral800 : AppColors.neutral200,
                  ),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: !isValid || _isLoading
                      ? null
                      : () => _processPayment(amountText),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary500,
                    disabledBackgroundColor: isDark
                        ? AppColors.neutral800
                        : AppColors.neutral300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    elevation: 0,
                  ),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.5,
                          ),
                        )
                      : Text(
                          context.l10n.addMoney,
                          style: AppTextStyles.titleMedium.copyWith(
                            color: !isValid
                                ? (isDark
                                      ? AppColors.neutral600
                                      : AppColors.neutral400)
                                : Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isLoading = false;

  Future<void> _processPayment(String amountText) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final orderResponse = await ref
          .read(paymentControllerProvider.notifier)
          .createRazorpayOrder(amountText);

      if (!mounted) return;

      final options = {
        'key': orderResponse.data.razorpayKeyId,
        'amount': orderResponse.data.amount * 100, // Razorpay SDK expects paise
        'name': 'Reachu',
        'order_id': orderResponse.data.orderId,
        'description': context.l10n.walletTopUp,
        'currency': orderResponse.data.currency,
        'prefill': {
          'contact': '', // Optional prefill
          'email': '',
        },
        'external': {
          'wallets': ['paytm'],
        },
      };

      try {
        _razorpay.open(options);
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        AppSnackbar.showError(
          context: context,
          message: context.l10n.failedToOpenRazorpay(e.toString()),
        );
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
      AppLogger.e("Failed to create payment order: $e");
      AppSnackbar.showError(
        context: context,
        message: context.l10n.failedToCreatePaymentOrder(e.toString()),
      );
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final orderId = response.orderId ?? '';
      final paymentId = response.paymentId ?? '';
      final signature = response.signature ?? '';

      await ref
          .read(paymentControllerProvider.notifier)
          .verifyPayment(
            paymentId: paymentId,
            orderId: orderId,
            signature: signature,
          );

      if (!mounted) return;

      setState(() {
        _isLoading = false;
      });

      // Show success feedback
      AppSnackbar.showSuccess(
        context: context,
        message: context.l10n.successfullyAddedToreachuCredits(
          _amountController.text,
        ),
      );

      // Return to payment screen
      Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
      AppSnackbar.showError(
        context: context,
        message: context.l10n.paymentVerificationFailed(e.toString()),
      );
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    setState(() {
      _isLoading = false;
    });

    final code = response.code;
    final message = response.message ?? 'Unknown error';
    AppSnackbar.showError(
      context: context,
      message: context.l10n.paymentFailedFormat(code.toString(), message),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    AppSnackbar.showSuccess(
      context: context,
      message: context.l10n.externalWalletSelected(response.walletName ?? ''),
    );
  }
}
