import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/localization/locale_provider.dart';
import '../providers/payment_controller.dart';
import '../providers/transactions_controller.dart';

class PaymentScreen extends ConsumerWidget {
  const PaymentScreen({super.key});

  String _formatDateTime(BuildContext context, String? dateStr) {
    if (dateStr == null || dateStr.trim().isEmpty) return '';
    try {
      final parsedDate = DateTime.parse(dateStr).toLocal();
      final locale = Localizations.localeOf(context).languageCode;
      return DateFormat('dd MMM yyyy • hh:mm a', locale).format(parsedDate);
    } catch (_) {
      return dateStr;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDark
        ? AppColors.darkTextPrimary
        : AppColors.lightTextPrimary;
    final mutedTextColor = isDark ? AppColors.neutral400 : AppColors.neutral500;
    final cardBgColor = isDark
        ? AppColors.darkSurface02
        : AppColors.lightSurface00;

    final walletAsync = ref.watch(paymentControllerProvider);
    final transactionsAsync = ref.watch(transactionsControllerProvider);

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.darkSurface01
          : AppColors.lightSurface01,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          context.l10n.payments,
          style: AppTextStyles.titleMedium.copyWith(
            color: primaryTextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await ref.read(paymentControllerProvider.notifier).refreshWallet();
            await ref.read(transactionsControllerProvider.notifier).refresh();
          },
          color: AppColors.primary500,
          backgroundColor: isDark
              ? AppColors.darkSurface02
              : AppColors.lightSurface00,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),



                // Rapido / Uber Style Driver Balance Card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.primary500,
                        Color(0xFF8B5CF6), // Purple color for premium gradient
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary500.withValues(alpha: 0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: walletAsync.when(
                    data: (wallet) {
                      final netAvailable = wallet.availableBalance - wallet.driverDebtBalance;
                      final isBelowMin = netAvailable < wallet.minimumBalanceForOrder;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header: Title & Status Badge
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.account_balance_wallet_rounded,
                                    color: Colors.white.withValues(alpha: 0.9),
                                    size: 22.sp,
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    context.l10n.reachuCredits,
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      color: Colors.white.withValues(alpha: 0.9),
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                              // Rapido Status Pill Badge
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                  color: isBelowMin
                                      ? const Color(0xFFFF3B30).withValues(alpha: 0.25)
                                      : const Color(0xFF34D399).withValues(alpha: 0.25),
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                    color: isBelowMin
                                        ? const Color(0xFFFFD600)
                                        : const Color(0xFF34D399),
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 6.r,
                                      height: 6.r,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isBelowMin
                                            ? const Color(0xFFFFD600)
                                            : const Color(0xFF34D399),
                                      ),
                                    ),
                                    SizedBox(width: 6.w),
                                    Text(
                                      isBelowMin ? context.l10n.lowBalanceStatus : context.l10n.activeForRides,
                                      style: TextStyle(
                                        color: isBelowMin
                                            ? const Color(0xFFFFD600)
                                            : Colors.white,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 18.h),

                          // Main Headline Amount (Rapido Style: Net Available Balance)
                          Text(
                            context.l10n.availableBalance.toUpperCase(),
                            style: AppTextStyles.labelSmall.copyWith(
                              color: Colors.white.withValues(alpha: 0.75),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                              fontSize: 10.sp,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '₹ ${netAvailable.toStringAsFixed(2)}',
                                style: AppTextStyles.headlineMedium.copyWith(
                                  color: isBelowMin ? const Color(0xFFFFD600) : Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 32.sp,
                                ),
                              ),
                              if (isBelowMin) ...[
                                SizedBox(width: 8.w),
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: const Color(0xFFFFD600),
                                  size: 20.sp,
                                ),
                              ],
                            ],
                          ),

                          SizedBox(height: 20.h),
                          Divider(
                            color: Colors.white.withValues(alpha: 0.2),
                            height: 1,
                          ),
                          SizedBox(height: 16.h),

                          // Breakdown Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildStatColumn(
                                context.l10n.balance,
                                '₹ ${wallet.walletBalance.toStringAsFixed(2)}',
                              ),
                              _buildStatColumn(
                                context.l10n.driverDebt,
                                '₹ ${wallet.driverDebtBalance.toStringAsFixed(2)}',
                              ),
                              _buildStatColumn(
                                context.l10n.minimumLimit,
                                '₹ ${wallet.minimumBalanceForOrder.toStringAsFixed(2)}',
                                alignEnd: true,
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                    loading: () => _buildShimmerStatGrid(isDark),
                    error: (err, stack) => Row(
                      children: [
                        Text(
                          context.l10n.errorLoadingBalance,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        GestureDetector(
                          onTap: () => ref
                              .read(paymentControllerProvider.notifier)
                              .refreshWallet(),
                          child: const Icon(
                            Icons.refresh_rounded,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ).animate().scale(delay: 100.ms, duration: 400.ms).fade(duration: 400.ms),

                SizedBox(height: 24.h),

                // Quick Action Buttons
                Row(
                      children: [
                        Expanded(
                          child: _buildQuickActionButton(
                            context: context,
                            icon: Icons.add_rounded,
                            label: context.l10n.addMoney,
                            onTap: () => context.push('/add_money'),
                            isDark: isDark,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: _buildQuickActionButton(
                            context: context,
                            icon: Icons.send_rounded,
                            label: context.l10n.withdrawMoney,
                            onTap: () => context.push('/money_transfer'),
                            isDark: isDark,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: _buildQuickActionButton(
                            context: context,
                            icon: Icons.account_balance_rounded,
                            label: context.l10n.bankAccounts,
                            onTap: () => context.push('/bank_accounts'),
                            isDark: isDark,
                          ),
                        ),
                      ],
                    )
                    .animate()
                    .fade(delay: 200.ms, duration: 350.ms)
                    .slideY(begin: 0.15, end: 0),

                SizedBox(height: 32.h),

                // Recent Transactions Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.l10n.recentTransactions,
                      style: AppTextStyles.titleSmall.copyWith(
                        color: primaryTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    transactionsAsync.maybeWhen(
                      data: (state) {
                        if (state.transactions.isEmpty) {
                          return const SizedBox.shrink();
                        }
                        return TextButton(
                          onPressed: () {
                            context.push('/transactions');
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            context.l10n.viewMore,
                            style: AppTextStyles.labelMedium.copyWith(
                              color: AppColors.primary500,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),

                // Transactions List Section
                transactionsAsync.when(
                  data: (txnState) {
                    final list = txnState.transactions.take(3).toList();
                    if (list.isEmpty) {
                      return Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 32.h),
                        decoration: BoxDecoration(
                          color: cardBgColor,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: isDark
                                ? AppColors.neutral800
                                : AppColors.neutral200,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.receipt_long_rounded,
                              color: mutedTextColor,
                              size: 40.sp,
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              context.l10n.noTransactionsYet,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: mutedTextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return Container(
                          decoration: BoxDecoration(
                            color: cardBgColor,
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(
                              color: isDark
                                  ? AppColors.neutral800
                                  : AppColors.neutral200,
                            ),
                          ),
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: list.length,
                            separatorBuilder: (context, index) => Divider(
                              height: 1,
                              color: isDark
                                  ? AppColors.neutral800
                                  : AppColors.neutral200,
                            ),
                            itemBuilder: (context, index) {
                              final txn = list[index];
                              final isCredit =
                                  txn.type.toLowerCase() == 'credit';
                              final formattedDate = _formatDateTime(context, txn.createdAt);
                              return ListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                leading: CircleAvatar(
                                  backgroundColor: isCredit
                                      ? Colors.green.withValues(alpha: 0.1)
                                      : AppColors.primary500.withValues(
                                          alpha: 0.1,
                                        ),
                                  child: Icon(
                                    isCredit
                                        ? Icons.account_balance_wallet_outlined
                                        : Icons.local_shipping_outlined,
                                    color: isCredit
                                        ? Colors.green
                                        : AppColors.primary500,
                                    size: 20.sp,
                                  ),
                                ),
                                title: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        txn.title,
                                        style: AppTextStyles.bodyMedium.copyWith(
                                          color: primaryTextColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      '${isCredit ? "+" : "-"} ₹ ${txn.amount.toStringAsFixed(2)}',
                                      style: AppTextStyles.bodyMedium.copyWith(
                                        color: isCredit
                                            ? Colors.green
                                            : primaryTextColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Padding(
                                  padding: EdgeInsets.only(top: 4.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      if (txn.description.isNotEmpty)
                                        Text(
                                          txn.description,
                                          style: AppTextStyles.bodySmall.copyWith(
                                            color: mutedTextColor,
                                            height: 1.3,
                                          ),
                                        ),
                                      if (formattedDate.isNotEmpty) ...[
                                        SizedBox(height: txn.description.isNotEmpty ? 4.h : 0),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.access_time_rounded,
                                              size: 12.sp,
                                              color: mutedTextColor.withValues(alpha: 0.8),
                                            ),
                                            SizedBox(width: 4.w),
                                            Text(
                                              formattedDate,
                                              style: AppTextStyles.labelSmall.copyWith(
                                                color: mutedTextColor.withValues(alpha: 0.85),
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                        .animate()
                        .fade(delay: 300.ms, duration: 400.ms)
                        .slideY(begin: 0.1, end: 0);
                  },
                  loading: () => _buildShimmerTransactionsList(isDark),
                  error: (error, stack) => Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    decoration: BoxDecoration(
                      color: cardBgColor,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: isDark
                            ? AppColors.neutral800
                            : AppColors.neutral200,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          context.l10n.failedToLoadTransactions,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.errorLight,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        ElevatedButton(
                          onPressed: () => ref
                              .read(transactionsControllerProvider.notifier)
                              .refresh(),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                            backgroundColor: AppColors.primary500,
                          ),
                          child: Text(
                            context.l10n.retry,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerTransactionsList(bool isDark) {
    return Shimmer.fromColors(
      baseColor: isDark ? AppColors.neutral800 : AppColors.neutral200,
      highlightColor: isDark ? AppColors.neutral700 : AppColors.neutral100,
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface02 : AppColors.lightSurface00,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) {
            return ListTile(
              leading: const CircleAvatar(backgroundColor: Colors.white),
              title: Container(
                height: 14.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              subtitle: Container(
                height: 10.h,
                width: 150.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              trailing: Container(
                height: 14.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildStatColumn(
    String label,
    String value, {
    bool alignEnd = false,
    bool isAlert = false,
  }) {
    final alertTextColor = const Color(0xFFFFD600);
    final content = Column(
      crossAxisAlignment: alignEnd
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: AppTextStyles.labelSmall.copyWith(
                color: isAlert
                    ? alertTextColor
                    : Colors.white.withValues(alpha: 0.7),
                fontSize: 9.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.8,
              ),
            ),
            if (isAlert) ...[
              SizedBox(width: 4.w),
              Icon(
                Icons.warning_amber_rounded,
                color: alertTextColor,
                size: 12.sp,
              ),
            ],
          ],
        ),
        SizedBox(height: 2.h),
        Text(
          value,
          style: AppTextStyles.bodyMedium.copyWith(
            color: isAlert ? alertTextColor : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );

    if (isAlert) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: alertTextColor.withValues(alpha: 0.7),
            width: 1.2,
          ),
        ),
        child: content,
      );
    }

    return content;
  }

  Widget _buildShimmerStatGrid(bool isDark) {
    return Shimmer.fromColors(
      baseColor: Colors.white.withValues(alpha: 0.3),
      highlightColor: Colors.white.withValues(alpha: 0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildShimmerStatColumn(alignEnd: false),
          _buildShimmerStatColumn(alignEnd: false),
          _buildShimmerStatColumn(alignEnd: true),
        ],
      ),
    );
  }

  Widget _buildShimmerStatColumn({required bool alignEnd}) {
    return Column(
      crossAxisAlignment: alignEnd
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Container(
          width: 80.w,
          height: 10.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        SizedBox(height: 6.h),
        Container(
          width: 60.w,
          height: 14.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    final cardBgColor = isDark
        ? AppColors.darkSurface02
        : AppColors.lightSurface00;
    final primaryTextColor = isDark
        ? AppColors.darkTextPrimary
        : AppColors.lightTextPrimary;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: cardBgColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isDark ? AppColors.neutral800 : AppColors.neutral200,
          ),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.primary500, size: 24.sp),
            SizedBox(height: 8.h),
            Text(
              label,
              style: AppTextStyles.bodySmall.copyWith(
                color: primaryTextColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
