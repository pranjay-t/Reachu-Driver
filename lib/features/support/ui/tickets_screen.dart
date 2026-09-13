import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:intl/intl.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/localization/locale_provider.dart';
import '../providers/support_controller.dart';

class TicketsScreen extends ConsumerStatefulWidget {
  const TicketsScreen({super.key});

  @override
  ConsumerState<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends ConsumerState<TicketsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200.h) {
      ref.read(supportTicketsProvider.notifier).loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String _getFriendlyCategory(BuildContext context, String category) {
    switch (category) {
      case "rideIssue":
        return context.l10n.ticketCategoryRideIssue;
      case "payment":
        return context.l10n.ticketCategoryPayment;
      case "account":
        return context.l10n.ticketCategoryAccount;
      case "driverIssue":
        return context.l10n.ticketCategoryDriverIssue;
      case "other":
        return context.l10n.ticketCategoryOther;
      default:
        return category;
    }
  }

  Color _getCategoryColor(String category, String status, bool isDark) {
    final normStatus = status
        .toLowerCase()
        .replaceAll('-', '')
        .replaceAll('_', '')
        .replaceAll(' ', '');
    if (normStatus == 'closed') {
      return isDark ? AppColors.neutral500 : AppColors.neutral500;
    }

    switch (category) {
      case "rideIssue":
        return isDark ? AppColors.infoLight : AppColors.infoDark;
      case "payment":
        return isDark ? AppColors.successLight : AppColors.successDark;
      case "account":
        return isDark ? AppColors.warningLight : AppColors.warningDark;
      case "driverIssue":
        return isDark ? const Color(0xFFC084FC) : const Color(0xFF9333EA);
      case "other":
      default:
        return isDark ? AppColors.primary400 : AppColors.primary600;
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case "rideIssue":
        return Icons.directions_car_rounded;
      case "payment":
        return Icons.account_balance_wallet_rounded;
      case "account":
        return Icons.person_rounded;
      case "driverIssue":
        return Icons.assignment_ind_rounded;
      case "other":
      default:
        return Icons.help_outline_rounded;
    }
  }

  Widget _buildCategoryBadge(BuildContext context, String category, String status, bool isDark) {
    final categoryColor = _getCategoryColor(category, status, isDark);
    final friendlyName = _getFriendlyCategory(context, category);
    final iconData = _getCategoryIcon(category);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: categoryColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: categoryColor.withValues(alpha: 0.15),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, size: 12.sp, color: categoryColor),
          SizedBox(width: 4.w),
          Text(
            friendlyName,
            style: AppTextStyles.bodySmall.copyWith(
              color: categoryColor,
              fontWeight: FontWeight.w600,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context, String status) {
    Color bgColor;
    Color textColor;
    String label = status.toUpperCase();

    final normStatus = status
        .toLowerCase()
        .replaceAll('-', '')
        .replaceAll('_', '')
        .replaceAll(' ', '');
    switch (normStatus) {
      case 'open':
        bgColor = AppColors.primary500.withValues(alpha: 0.08);
        textColor = AppColors.primary500;
        label = context.l10n.ticketStatusOpen.toUpperCase();
        break;
      case 'inprogress':
        bgColor = AppColors.warningLight.withValues(alpha: 0.08);
        textColor = AppColors.warningDark;
        label = context.l10n.ticketStatusInProgress.toUpperCase();
        break;
      case 'resolved':
        bgColor = AppColors.successLight.withValues(alpha: 0.08);
        textColor = AppColors.successDark;
        label = context.l10n.ticketStatusResolved.toUpperCase();
        break;
      case 'closed':
        bgColor = AppColors.neutral500.withValues(alpha: 0.08);
        textColor = AppColors.neutral500;
        label = context.l10n.ticketStatusClosed.toUpperCase();
        break;
      default:
        bgColor = AppColors.neutral500.withValues(alpha: 0.08);
        textColor = AppColors.neutral500;
        label = status.toUpperCase();
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: textColor.withValues(alpha: 0.15), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6.w,
            height: 6.w,
            decoration: BoxDecoration(color: textColor, shape: BoxShape.circle),
          ),
          SizedBox(width: 6.w),
          Text(
            label,
            style: AppTextStyles.bodySmall.copyWith(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDark
        ? AppColors.darkTextPrimary
        : AppColors.lightTextPrimary;
    final secondaryTextColor = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;
    final cardBgColor = isDark
        ? AppColors.darkSurface02
        : AppColors.lightSurface00;
    final dividerColor = isDark ? AppColors.neutral800 : AppColors.neutral200;

    final ticketsState = ref.watch(supportTicketsProvider);

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.darkSurface01
          : AppColors.lightSurface01,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: primaryTextColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          context.l10n.mySupportTickets,
          style: AppTextStyles.titleMedium.copyWith(
            color: primaryTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/support/raise_ticket'),
        backgroundColor: AppColors.primary500,
        icon: const Icon(Icons.add_rounded, color: Colors.white),
        label: Text(
          context.l10n.newTicket,
          style: AppTextStyles.bodyMedium.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => ref.refresh(supportTicketsProvider.future),
          color: AppColors.primary500,
          child: ticketsState.when(
            data: (tickets) {
              if (tickets.isEmpty) {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Container(
                    height: 500.h,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.receipt_long_rounded,
                          size: 72.sp,
                          color: secondaryTextColor.withValues(alpha: 0.3),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          context.l10n.noSupportTicketsRaised,
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: primaryTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          context.l10n.tapNewTicketSubtitle,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return ListView.separated(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 80.h),
                itemCount: tickets.length,
                separatorBuilder: (context, index) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  final ticket = tickets[index];
                  final formattedDate = DateFormat(
                    'dd MMM yyyy, hh:mm a',
                    Localizations.localeOf(context).languageCode,
                  ).format(ticket.createdAt.toLocal());

                  return Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () =>
                              context.push('/support/chat/${ticket.id}'),
                          borderRadius: BorderRadius.circular(20.r),
                          child: Container(
                            padding: EdgeInsets.all(16.w),
                            decoration: BoxDecoration(
                              color: cardBgColor,
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(color: dividerColor),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ticket.ticketNumber,
                                      style: AppTextStyles.bodySmall.copyWith(
                                        color:
                                            ticket.status
                                                    .toLowerCase()
                                                    .replaceAll('-', '')
                                                    .replaceAll('_', '')
                                                    .replaceAll(' ', '') ==
                                                'closed'
                                            ? secondaryTextColor
                                            : AppColors.primary500,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    _buildStatusBadge(context, ticket.status),
                                  ],
                                ),
                                SizedBox(height: 12.h),
                                Text(
                                  ticket.subject,
                                  style: AppTextStyles.bodyLarge.copyWith(
                                    color: primaryTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 8.h),
                                Row(
                                  children: [
                                    _buildCategoryBadge(
                                      context,
                                      ticket.category,
                                      ticket.status,
                                      isDark,
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.access_time_rounded,
                                      size: 14.sp,
                                      color: secondaryTextColor,
                                    ),
                                    SizedBox(width: 6.w),
                                    Text(
                                      formattedDate,
                                      style: AppTextStyles.bodySmall.copyWith(
                                        color: secondaryTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .animate()
                      .fade(duration: 250.ms)
                      .slideY(begin: 0.05, end: 0);
                },
              );
            },
            loading: () =>
                _buildShimmerTicketsList(isDark, cardBgColor, dividerColor),
            error: (err, stack) => SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                height: 500.h,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline_rounded,
                      size: 64.sp,
                      color: AppColors.errorLight,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      context.l10n.failedToLoadTickets,
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: primaryTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      err.toString(),
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerTicketsList(
    bool isDark,
    Color cardBgColor,
    Color dividerColor,
  ) {
    return Shimmer.fromColors(
      baseColor: isDark ? AppColors.neutral800 : AppColors.neutral200,
      highlightColor: isDark ? AppColors.neutral700 : AppColors.neutral100,
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 80.h),
        itemCount: 6,
        separatorBuilder: (context, index) => SizedBox(height: 12.h),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: cardBgColor,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: dividerColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 12.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    Container(
                      height: 20.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Container(
                  height: 16.h,
                  width: 250.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 12.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    Container(
                      height: 12.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
