import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/localization/locale_provider.dart';
import '../../../core/utils/app_snackbar.dart';
import '../providers/bank_accounts_controller.dart';
import '../providers/payment_controller.dart';
import '../models/payment_models.dart';

class MoneyTransferScreen extends ConsumerStatefulWidget {
  const MoneyTransferScreen({super.key});

  @override
  ConsumerState<MoneyTransferScreen> createState() => _MoneyTransferScreenState();
}

class _MoneyTransferScreenState extends ConsumerState<MoneyTransferScreen> {
  final TextEditingController _amountController = TextEditingController();
  BankAccountData? _selectedAccount;
  bool _isLoading = false;

  void _showConfirmationDialog(BuildContext context, double amount, BankAccountData account) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final isUPI = account.type.toLowerCase() == 'upi';

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: isDark ? AppColors.darkSurface02 : AppColors.lightSurface00,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        title: Text(
          context.l10n.confirmTransfer,
          style: AppTextStyles.titleMedium.copyWith(
            color: primaryTextColor,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    context.l10n.transferAmount,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: isDark ? AppColors.neutral400 : AppColors.neutral500,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "₹ ${amount.toStringAsFixed(2)}",
                    style: AppTextStyles.headlineLarge.copyWith(
                      color: AppColors.primary500,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Divider(color: isDark ? AppColors.neutral800 : AppColors.neutral200),
            SizedBox(height: 12.h),
            _buildDetailRow(context, context.l10n.beneficiary, account.accountHolderName ?? '', isDark),
            SizedBox(height: 8.h),
            _buildDetailRow(
              context,
              isUPI ? "UPI ID" : "Bank Name",
              isUPI ? account.upiId ?? '' : account.bankName ?? '',
              isDark,
            ),
            if (!isUPI) ...[
              SizedBox(height: 8.h),
              _buildDetailRow(context, "Account No", _maskAccountNumber(account.accountNumber ?? ''), isDark),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(
              context.l10n.cancel,
              style: TextStyle(color: isDark ? AppColors.neutral400 : AppColors.neutral500),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.of(ctx).pop();
              _processWithdrawal(amount, account.id);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary500,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
            ),
            child: Text(
              context.l10n.done,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value, bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            color: isDark ? AppColors.neutral400 : AppColors.neutral500,
          ),
        ),
        Text(
          value,
          style: AppTextStyles.bodyMedium.copyWith(
            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Future<void> _processWithdrawal(double amount, String bankAccountId) async {
    setState(() {
      _isLoading = true;
    });

    try {
      await ref.read(paymentControllerProvider.notifier).withdrawMoney(
            amount: amount.toString(),
            bankAccountId: bankAccountId,
          );

      if (mounted) {
        AppSnackbar.showSuccess(
          context: context,
          message: context.l10n.transferSuccess,
        );
        context.pop(); // Return to Payment Screen
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
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final mutedTextColor = isDark ? AppColors.neutral400 : AppColors.neutral500;
    final containerBg = isDark ? AppColors.darkSurface02 : AppColors.lightSurface00;

    final walletAsync = ref.watch(paymentControllerProvider);
    final accountsAsync = ref.watch(bankAccountsControllerProvider);
    final available = (walletAsync.value?.availableBalance ?? 0.0) - (walletAsync.value?.driverDebtBalance ?? 0.0);

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkSurface01 : AppColors.lightSurface01,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: primaryTextColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          context.l10n.moneyTransfer,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),

                    // Available Balance Card
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: containerBg,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: isDark ? AppColors.neutral800 : AppColors.neutral200,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            context.l10n.availableBalance,
                            style: AppTextStyles.labelSmall.copyWith(
                              color: mutedTextColor,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          walletAsync.when(
                            data: (wallet) {
                              final netAvailable = wallet.availableBalance - wallet.driverDebtBalance;
                              return Text(
                                "₹ ${netAvailable.toStringAsFixed(2)}",
                                style: AppTextStyles.headlineLarge.copyWith(
                                  color: primaryTextColor,
                                  fontWeight: FontWeight.w900,
                                ),
                              );
                            },
                            loading: () => Shimmer.fromColors(
                              baseColor: isDark ? AppColors.neutral800 : AppColors.neutral200,
                              highlightColor: isDark ? AppColors.neutral700 : AppColors.neutral100,
                              child: Container(
                                width: 140.w,
                                height: 32.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                            ),
                            error: (error, stack) => Text(
                              context.l10n.errorLoadingWallet,
                              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.errorLight),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // Withdrawal Amount Input
                    Text(
                      context.l10n.withdrawalAmount,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: primaryTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: _amountController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                      ],
                      style: AppTextStyles.bodyLarge.copyWith(color: primaryTextColor),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.currency_rupee_rounded, color: AppColors.primary500),
                        hintText: context.l10n.enterAmount,
                        hintStyle: AppTextStyles.bodyLarge.copyWith(
                          color: isDark ? AppColors.neutral600 : AppColors.neutral400,
                        ),
                        filled: true,
                        fillColor: containerBg,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: isDark ? AppColors.neutral800 : AppColors.neutral200,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: isDark ? AppColors.neutral800 : AppColors.neutral200,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(
                            color: AppColors.primary500,
                            width: 1.5,
                          ),
                        ),
                      ),
                      onChanged: (val) {
                        setState(() {});
                      },
                    ),

                    SizedBox(height: 28.h),

                    // Destination Payment Method Header
                    Text(
                      context.l10n.transferDestination,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: primaryTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12.h),

                    accountsAsync.when(
                      data: (accounts) {
                        if (accounts.isEmpty) {
                          return Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(24.w),
                            decoration: BoxDecoration(
                              color: containerBg,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                color: isDark ? AppColors.neutral800 : AppColors.neutral200,
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  context.l10n.noPaymentMethods,
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    color: primaryTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  context.l10n.addPaymentMethodSubtitle,
                                  style: AppTextStyles.bodySmall.copyWith(color: mutedTextColor),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 16.h),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    context.push('/add_edit_bank_account');
                                  },
                                  icon: const Icon(Icons.add_rounded, color: Colors.white, size: 18),
                                  label: Text(
                                    context.l10n.addAccount,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary500),
                                ),
                              ],
                            ),
                          );
                        }

                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: accounts.length,
                          separatorBuilder: (context, index) => SizedBox(height: 12.h),
                          itemBuilder: (context, index) {
                            final account = accounts[index];
                            final isSelected = _selectedAccount?.id == account.id;
                            final isUPI = account.type.toLowerCase() == 'upi';

                            return InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedAccount = account;
                                });
                              },
                              borderRadius: BorderRadius.circular(16.r),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.primary500.withValues(alpha: 0.08)
                                      : containerBg,
                                  borderRadius: BorderRadius.circular(16.r),
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.primary500
                                        : (isDark ? AppColors.neutral800 : AppColors.neutral200),
                                    width: isSelected ? 2.0 : 1.0,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: isUPI
                                          ? const Color(0xFF0F766E).withValues(alpha: 0.1)
                                          : AppColors.primary500.withValues(alpha: 0.1),
                                      child: Icon(
                                        isUPI ? Icons.alternate_email_rounded : Icons.account_balance_rounded,
                                        color: isUPI ? const Color(0xFF0F766E) : AppColors.primary500,
                                      ),
                                    ),
                                    SizedBox(width: 16.w),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            isUPI ? "UPI ID" : account.bankName ?? "Bank Account",
                                            style: AppTextStyles.bodyMedium.copyWith(
                                              color: primaryTextColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 4.h),
                                          Text(
                                            isUPI
                                                ? account.upiId ?? ''
                                                : _maskAccountNumber(account.accountNumber ?? ''),
                                            style: AppTextStyles.bodySmall.copyWith(color: mutedTextColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (isSelected)
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                                        decoration: BoxDecoration(
                                          color: AppColors.primary500,
                                          borderRadius: BorderRadius.circular(8.r),
                                        ),
                                        child: Text(
                                          context.l10n.selected,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      loading: () => _buildShimmerAccountsList(isDark),
                      error: (error, stack) => Text(
                        context.l10n.errorLoadingAccounts,
                        style: AppTextStyles.bodyMedium.copyWith(color: AppColors.errorLight),
                      ),
                    ),

                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),

            // Transfer Button Section
            _buildTransferButton(context, available, isDark),
          ],
        ),
      ),
    );
  }

  Widget _buildTransferButton(BuildContext context, double available, bool isDark) {
    final amountText = _amountController.text.trim();
    final amount = double.tryParse(amountText) ?? 0.0;
    final isAmountValid = amount > 0 && amount <= available;
    final isAccountSelected = _selectedAccount != null;
    final canProceed = isAmountValid && isAccountSelected;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface01 : AppColors.lightSurface00,
        border: Border(
          top: BorderSide(
            color: isDark ? AppColors.neutral800 : AppColors.neutral200,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (amountText.isNotEmpty && amount > available) ...[
            Text(
              context.l10n.insufficientBalance,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.errorLight,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
          ],
          SizedBox(
            width: double.infinity,
            height: 56.h,
            child: ElevatedButton(
              onPressed: !canProceed || _isLoading
                  ? null
                  : () => _showConfirmationDialog(context, amount, _selectedAccount!),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary500,
                disabledBackgroundColor: isDark ? AppColors.neutral800 : AppColors.neutral300,
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
                      context.l10n.withdrawMoney,
                      style: AppTextStyles.titleMedium.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  String _maskAccountNumber(String number) {
    if (number.length <= 4) return number;
    final masked = '•••• ' * ((number.length - 4) ~/ 4 + 1);
    final lastFour = number.substring(number.length - 4);
    return '$masked$lastFour';
  }

  Widget _buildShimmerAccountsList(bool isDark) {
    return Shimmer.fromColors(
      baseColor: isDark ? AppColors.neutral800 : AppColors.neutral200,
      highlightColor: isDark ? AppColors.neutral700 : AppColors.neutral100,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        separatorBuilder: (context, index) => SizedBox(height: 12.h),
        itemBuilder: (context, index) {
          return Container(
            height: 72.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
          );
        },
      ),
    );
  }
}
