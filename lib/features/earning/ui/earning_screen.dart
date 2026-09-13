import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/localization/locale_provider.dart';
import '../../home/providers/home_controller.dart';
import '../../payment/providers/transactions_controller.dart';

class EarningScreen extends ConsumerWidget {
  const EarningScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final mutedTextColor = isDark ? AppColors.neutral400 : AppColors.neutral500;
    final cardBgColor = isDark ? AppColors.darkSurface02 : AppColors.lightSurface00;

    final homeDataAsync = ref.watch(homeControllerProvider);
    final transactionsAsync = ref.watch(transactionsControllerProvider);

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkSurface01 : AppColors.lightSurface01,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          context.l10n.earning,
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
            await ref.read(homeControllerProvider.notifier).refreshHome();
            await ref.read(transactionsControllerProvider.notifier).refresh();
          },
          color: AppColors.primary500,
          backgroundColor: isDark ? AppColors.darkSurface02 : AppColors.lightSurface00,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),

                // ── Premium Earnings Card ──
                homeDataAsync.when(
                  data: (homeData) {
                    final stats = homeData.todayStats;
                    return GestureDetector(
                      onTap: () => context.push('/payment'),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              AppColors.primary500,
                              AppColors.primary600,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.trending_up_rounded,
                                      color: Colors.white.withValues(alpha: 0.9),
                                      size: 22.sp,
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      context.l10n.earning.toUpperCase(),
                                      style: AppTextStyles.bodyMedium.copyWith(
                                        color: Colors.white.withValues(alpha: 0.9),
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.stars_rounded,
                                  color: Colors.white.withValues(alpha: 0.6),
                                  size: 24.sp,
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              context.l10n.todaysTotalEarnings,
                              style: AppTextStyles.bodySmall.copyWith(
                                color: Colors.white.withValues(alpha: 0.7),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              '₹ ${stats.earnings.total.toStringAsFixed(2)}',
                              style: AppTextStyles.headlineMedium.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 32.sp,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      context.l10n.cashCollected.toUpperCase(),
                                      style: AppTextStyles.labelSmall.copyWith(
                                        color: Colors.white.withValues(alpha: 0.7),
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.8,
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    Text(
                                      '₹ ${stats.earnings.cash.toStringAsFixed(2)}',
                                      style: AppTextStyles.bodyMedium.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      context.l10n.onlinePayment.toUpperCase(),
                                      style: AppTextStyles.labelSmall.copyWith(
                                        color: Colors.white.withValues(alpha: 0.7),
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.8,
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    Text(
                                      '₹ ${stats.earnings.online.toStringAsFixed(2)}',
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
                    ).animate().scale(duration: 350.ms);
                  },
                  loading: () => Shimmer.fromColors(
                    baseColor: isDark ? AppColors.neutral800 : AppColors.neutral200,
                    highlightColor: isDark ? AppColors.neutral700 : AppColors.neutral100,
                    child: Container(
                      width: double.infinity,
                      height: 180.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                    ),
                  ),
                  error: (error, stack) => Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      color: cardBgColor,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Center(
                      child: Text(
                        context.l10n.failedToLoadEarnings,
                        style: AppTextStyles.bodyMedium.copyWith(color: AppColors.errorLight),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 24.h),

                // ── Ride Summary Cards ──
                homeDataAsync.maybeWhen(
                  data: (homeData) {
                    final stats = homeData.todayStats;
                    return Row(
                      children: [
                        Expanded(
                          child: _buildSummaryItem(
                            theme: Theme.of(context),
                            isDark: isDark,
                            title: context.l10n.totalRides,
                            value: '${stats.rides.total}',
                            icon: Icons.local_taxi_rounded,
                            iconColor: AppColors.primary500,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: _buildSummaryItem(
                            theme: Theme.of(context),
                            isDark: isDark,
                            title: context.l10n.completed,
                            value: '${stats.rides.completed}',
                            icon: Icons.check_circle_rounded,
                            iconColor: AppColors.successLight,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: _buildSummaryItem(
                            theme: Theme.of(context),
                            isDark: isDark,
                            title: context.l10n.cancelled,
                            value: '${stats.rides.cancelled}',
                            icon: Icons.cancel_rounded,
                            iconColor: AppColors.errorLight,
                          ),
                        ),
                      ],
                    ).animate().slideY(begin: 0.1, end: 0, duration: 400.ms);
                  },
                  orElse: () => const SizedBox.shrink(),
                ),

                SizedBox(height: 32.h),

                // ── Recent Earnings Header ──
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
                        if (state.transactions.isEmpty) return const SizedBox.shrink();
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

                // ── Transactions List Section ──
                transactionsAsync.when(
                  data: (txnState) {
                    final list = txnState.transactions;
                    if (list.isEmpty) {
                      return Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 32.h),
                        decoration: BoxDecoration(
                          color: cardBgColor,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: isDark ? AppColors.neutral800 : AppColors.neutral200,
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
                              context.l10n.noTransactionsRecorded,
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
                          color: isDark ? AppColors.neutral800 : AppColors.neutral200,
                        ),
                      ),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: list.length,
                        separatorBuilder: (context, index) => Divider(
                          height: 1,
                          color: isDark ? AppColors.neutral800 : AppColors.neutral200,
                        ),
                        itemBuilder: (context, index) {
                          final txn = list[index];
                          final isCredit = txn.type.toLowerCase() == 'credit';
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: isCredit
                                  ? Colors.green.withValues(alpha: 0.1)
                                  : AppColors.primary500.withValues(alpha: 0.1),
                              child: Icon(
                                isCredit
                                    ? Icons.account_balance_wallet_outlined
                                    : Icons.local_shipping_outlined,
                                color: isCredit ? Colors.green : AppColors.primary500,
                                size: 20.sp,
                              ),
                            ),
                            title: Text(
                              txn.title,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: primaryTextColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              txn.description,
                              style: AppTextStyles.bodySmall.copyWith(color: mutedTextColor),
                            ),
                            trailing: Text(
                              '${isCredit ? "+" : "-"} ₹ ${txn.amount.toStringAsFixed(2)}',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: isCredit ? Colors.green : primaryTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  loading: () => _buildShimmerTransactionsList(isDark),
                  error: (error, stack) => Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    decoration: BoxDecoration(
                      color: cardBgColor,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: isDark ? AppColors.neutral800 : AppColors.neutral200,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          context.l10n.failedToLoadTransactions,
                          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.errorLight),
                        ),
                        SizedBox(height: 8.h),
                        ElevatedButton(
                          onPressed: () => ref.read(transactionsControllerProvider.notifier).refresh(),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                            backgroundColor: AppColors.primary500,
                          ),
                          child: Text(context.l10n.retry, style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 100.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryItem({
    required ThemeData theme,
    required bool isDark,
    required String title,
    required String value,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface02 : AppColors.lightSurface02,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isDark ? AppColors.darkDivider : AppColors.lightDivider,
        ),
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 24.sp),
          SizedBox(height: 8.h),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
              fontSize: 9.sp,
            ),
          ),
        ],
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
}
