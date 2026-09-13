import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/localization/locale_provider.dart';
import '../../../core/utils/app_snackbar.dart';
import '../providers/bank_accounts_controller.dart';
import '../models/payment_models.dart';

class BankAccountsScreen extends ConsumerWidget {
  const BankAccountsScreen({super.key});

  void _showDeleteConfirmation(BuildContext context, WidgetRef ref, BankAccountData account) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: isDark ? AppColors.darkSurface02 : AppColors.lightSurface00,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        title: Text(
          context.l10n.deleteAccount,
          style: AppTextStyles.titleMedium.copyWith(
            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          context.l10n.deleteAccountConfirm,
          style: AppTextStyles.bodyMedium.copyWith(
            color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
          ),
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
              try {
                await ref.read(bankAccountsControllerProvider.notifier).deleteBankAccount(account.id);
                if (context.mounted) {
                  AppSnackbar.showSuccess(
                    context: context,
                    message: context.l10n.accountDeletedSuccess,
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  AppSnackbar.showError(
                    context: context,
                    message: e.toString(),
                  );
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.errorDark,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
            ),
            child: Text(
              context.l10n.deleteAccount,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final mutedTextColor = isDark ? AppColors.neutral400 : AppColors.neutral500;

    final accountsAsync = ref.watch(bankAccountsControllerProvider);

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
          context.l10n.bankAccounts,
          style: AppTextStyles.titleMedium.copyWith(
            color: primaryTextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: accountsAsync.when(
          data: (accounts) {
            if (accounts.isEmpty) {
              return _buildEmptyState(context, isDark, mutedTextColor);
            }

            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              itemCount: accounts.length,
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemBuilder: (context, index) {
                final account = accounts[index];
                final isUPI = account.type.toLowerCase() == 'upi';

                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isUPI
                          ? [
                              const Color(0xFF0D9488),
                              const Color(0xFF0F766E),
                            ]
                          : [
                              AppColors.primary500,
                              const Color(0xFF4338CA),
                            ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: (isUPI ? const Color(0xFF0F766E) : AppColors.primary500)
                            .withValues(alpha: 0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Card Chip Decoration Background
                      Positioned(
                        right: -20.w,
                        bottom: -20.h,
                        child: Icon(
                          isUPI ? Icons.alternate_email_rounded : Icons.account_balance_rounded,
                          size: 150.sp,
                          color: Colors.white.withValues(alpha: 0.05),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      isUPI ? Icons.qr_code_2_rounded : Icons.credit_card_rounded,
                                      color: Colors.white,
                                      size: 24.sp,
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      isUPI ? "UPI ID" : account.bankName ?? "Bank Account",
                                      style: AppTextStyles.titleSmall.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit_rounded, color: Colors.white70),
                                      onPressed: () {
                                        context.push('/add_edit_bank_account?accountId=${account.id}');
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete_rounded, color: Colors.white70),
                                      onPressed: () => _showDeleteConfirmation(context, ref, account),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 24.h),
                            if (isUPI) ...[
                              Text(
                                account.upiId ?? '',
                                style: AppTextStyles.headlineSmall.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.1,
                                ),
                              ),
                            ] else ...[
                              Text(
                                _maskAccountNumber(account.accountNumber ?? ''),
                                style: AppTextStyles.headlineSmall.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0,
                                ),
                              ),
                            ],
                            SizedBox(height: 24.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      context.l10n.accountHolderName.toUpperCase(),
                                      style: AppTextStyles.labelSmall.copyWith(
                                        color: Colors.white60,
                                        fontSize: 9.sp,
                                        letterSpacing: 0.8,
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    Text(
                                      account.accountHolderName ?? '',
                                      style: AppTextStyles.bodyMedium.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                if (!isUPI && account.ifscCode != null)
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        context.l10n.ifscCode.toUpperCase(),
                                        style: AppTextStyles.labelSmall.copyWith(
                                          color: Colors.white60,
                                          fontSize: 9.sp,
                                          letterSpacing: 0.8,
                                        ),
                                      ),
                                      SizedBox(height: 2.h),
                                      Text(
                                        account.ifscCode!,
                                        style: AppTextStyles.bodyMedium.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ).animate().fade(duration: 350.ms, delay: (index * 80).ms).slideY(begin: 0.12, end: 0, delay: (index * 80).ms);
              },
            );
          },
          loading: () => _buildShimmerLoadingList(isDark),
          error: (error, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.l10n.failedToLoadAccounts,
                  style: AppTextStyles.bodyLarge.copyWith(color: AppColors.errorLight),
                ),
                SizedBox(height: 12.h),
                ElevatedButton(
                  onPressed: () => ref.read(bankAccountsControllerProvider.notifier).refreshAccounts(),
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary500),
                  child: Text(context.l10n.retry, style: const TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface01 : AppColors.lightSurface00,
          border: Border(
            top: BorderSide(
              color: isDark ? AppColors.neutral800 : AppColors.neutral200,
            ),
          ),
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            width: double.infinity,
            height: 56.h,
            child: ElevatedButton.icon(
              onPressed: () {
                context.push('/add_edit_bank_account');
              },
              icon: const Icon(Icons.add_rounded, color: Colors.white),
              label: Text(
                context.l10n.addAccount,
                style: AppTextStyles.titleMedium.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary500,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                elevation: 0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, bool isDark, Color mutedTextColor) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(24.r),
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.primary500.withValues(alpha: 0.1)
                    : AppColors.primary500.withValues(alpha: 0.05),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.account_balance_rounded,
                color: AppColors.primary500,
                size: 64.sp,
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              context.l10n.noPaymentMethods,
              style: AppTextStyles.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              context.l10n.addPaymentMethodSubtitle,
              style: AppTextStyles.bodyMedium.copyWith(
                color: mutedTextColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerLoadingList(bool isDark) {
    return Shimmer.fromColors(
      baseColor: isDark ? AppColors.neutral800 : AppColors.neutral200,
      highlightColor: isDark ? AppColors.neutral700 : AppColors.neutral100,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        itemCount: 3,
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemBuilder: (context, index) {
          return Container(
            height: 180.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
          );
        },
      ),
    );
  }

  String _maskAccountNumber(String number) {
    if (number.length <= 4) return number;
    final masked = '•••• ' * ((number.length - 4) ~/ 4 + 1);
    final lastFour = number.substring(number.length - 4);
    return '$masked$lastFour';
  }
}
