import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/localization/locale_provider.dart';
import '../providers/transactions_controller.dart';

class TransactionsScreen extends ConsumerStatefulWidget {
  const TransactionsScreen({super.key});

  @override
  ConsumerState<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends ConsumerState<TransactionsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      ref.read(transactionsControllerProvider.notifier).fetchNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final mutedTextColor = isDark ? AppColors.neutral400 : AppColors.neutral500;
    final cardBgColor = isDark ? AppColors.darkSurface02 : AppColors.lightSurface00;

    final stateAsync = ref.watch(transactionsControllerProvider);

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
          context.l10n.transactions,
          style: AppTextStyles.titleMedium.copyWith(
            color: primaryTextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => ref.read(transactionsControllerProvider.notifier).refresh(),
          color: AppColors.primary500,
          backgroundColor: isDark ? AppColors.darkSurface02 : AppColors.lightSurface00,
          child: stateAsync.when(
            data: (state) {
              if (state.transactions.isEmpty) {
                return ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.receipt_long_rounded,
                            color: mutedTextColor,
                            size: 64.sp,
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            context.l10n.noTransactionsFound,
                            style: AppTextStyles.bodyLarge.copyWith(
                              color: mutedTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }

              return ListView.separated(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                itemCount: state.transactions.length + (state.hasMore ? 1 : 0),
                separatorBuilder: (context, index) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  if (index == state.transactions.length) {
                    return Shimmer.fromColors(
                      baseColor: isDark ? AppColors.neutral800 : AppColors.neutral200,
                      highlightColor: isDark ? AppColors.neutral700 : AppColors.neutral100,
                      child: Container(
                        height: 72.h,
                        decoration: BoxDecoration(
                          color: isDark ? AppColors.darkSurface02 : AppColors.lightSurface00,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                    );
                  }

                  final txn = state.transactions[index];
                  final isCredit = txn.type.toLowerCase() == 'credit';

                  return Container(
                    decoration: BoxDecoration(
                      color: cardBgColor,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: isDark ? AppColors.neutral800 : AppColors.neutral200,
                      ),
                    ),
                    child: ListTile(
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
                    ),
                  ).animate().fade(duration: 350.ms, delay: (index.clamp(0, 8) * 50).ms).slideY(begin: 0.1, end: 0, delay: (index.clamp(0, 8) * 50).ms);
                },
              );
            },
            loading: () => _buildShimmerLoadingList(isDark),
            error: (error, stack) => ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                Center(
                  child: Column(
                    children: [
                      Text(
                        context.l10n.failedToLoadTransactions,
                        style: AppTextStyles.bodyLarge.copyWith(color: AppColors.errorLight),
                      ),
                      SizedBox(height: 12.h),
                      ElevatedButton(
                        onPressed: () => ref.read(transactionsControllerProvider.notifier).refresh(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary500,
                        ),
                        child: Text(context.l10n.retry, style: const TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
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
        itemCount: 8,
        separatorBuilder: (context, index) => SizedBox(height: 12.h),
        itemBuilder: (context, index) {
          return Container(
            height: 72.h,
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkSurface02 : AppColors.lightSurface00,
              borderRadius: BorderRadius.circular(16.r),
            ),
          );
        },
      ),
    );
  }
}
