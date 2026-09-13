import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/localization/locale_provider.dart';
import '../providers/support_controller.dart';
import '../../account/providers/company_controller.dart';

class SupportScreen extends ConsumerStatefulWidget {
  const SupportScreen({super.key});

  @override
  ConsumerState<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends ConsumerState<SupportScreen> {
  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        debugPrint('Could not launch $urlString');
      }
    } catch (e) {
      debugPrint('Error launching url: $e');
    }
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
    final companyState = ref.watch(companyControllerProvider);
    final company = companyState.asData?.value;

    final rawPhone = company?.contactNumber.trim() ?? '';
    final phoneNum = rawPhone.isNotEmpty ? rawPhone : "9814037044";
    final phoneDisplay = phoneNum.length == 10 ? "+91 $phoneNum" : phoneNum;

    final rawWa = company?.whatsappNumber.trim() ?? '';
    final whatsappNum = rawWa.isNotEmpty ? rawWa : phoneNum;
    final cleanWa = whatsappNum.replaceAll(RegExp(r'[^0-9]'), '');
    final waUrl = 'https://wa.me/${cleanWa.startsWith('91') ? cleanWa : '91$cleanWa'}';

    final rawEmail = company?.supportEmail.trim() ?? '';
    final supportEmail = rawEmail.isNotEmpty ? rawEmail : "reachuinfo@gmail.com";

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.darkSurface01
          : AppColors.lightSurface01,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          context.l10n.support,
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
            ref.invalidate(companyControllerProvider);
            ref.invalidate(supportTicketsProvider);
          },
          color: AppColors.primary500,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),

                // ── Premium Welcome Card ──
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.primary500,
                        Color(0xFF0EA5E9), // Sky blue
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary500.withValues(alpha: 0.25),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.support_agent_rounded,
                            color: Colors.white,
                            size: 32.sp,
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            context.l10n.partnerSupport,
                            style: AppTextStyles.titleMedium.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        context.l10n.partnerSupportSubtitle,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: Colors.white.withValues(alpha: 0.9),
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ).animate().fade(duration: 300.ms).slideY(begin: -0.05, end: 0),

                SizedBox(height: 24.h),

                // ── Premium Navigation Cards (FAQs & Raise Ticket) ──
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: _buildNavigationCard(
                          icon: Icons.help_outline_rounded,
                          title: context.l10n.faqsAndHelp,
                          subtitle: context.l10n.findQuickAnswers,
                          color: AppColors.primary500,
                          onTap: () => context.push('/support/faqs'),
                          cardBgColor: cardBgColor,
                          isDark: isDark,
                          dividerColor: dividerColor,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: _buildNavigationCard(
                          icon: Icons.add_comment_rounded,
                          title: context.l10n.raiseSupportTicket,
                          subtitle: context.l10n.contactSupportAgent,
                          color: const Color(0xFF0EA5E9),
                          onTap: () => context.push('/support/raise_ticket'),
                          cardBgColor: cardBgColor,
                          isDark: isDark,
                          dividerColor: dividerColor,
                        ),
                      ),
                    ],
                  ),
                ).animate().fade(delay: 50.ms, duration: 300.ms),

                SizedBox(height: 24.h),

                // ── Recent Tickets Section ──
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.l10n.recentTickets,
                      style: AppTextStyles.titleSmall.copyWith(
                        color: primaryTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () => context.push('/support/tickets'),
                      child: Row(
                        children: [
                          Text(
                            context.l10n.viewMore,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.primary500,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: AppColors.primary500,
                            size: 20.sp,
                          ),
                        ],
                      ),
                    ),
                  ],
                ).animate().fade(delay: 100.ms, duration: 300.ms),
                SizedBox(height: 8.h),

                ticketsState
                    .when(
                      data: (tickets) {
                        if (tickets.isEmpty) {
                          return Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 24.h,
                              horizontal: 16.w,
                            ),
                            decoration: BoxDecoration(
                              color: cardBgColor,
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(color: dividerColor),
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.confirmation_number_outlined,
                                  color: secondaryTextColor.withValues(
                                    alpha: 0.5,
                                  ),
                                  size: 40.sp,
                                ),
                                SizedBox(height: 12.h),
                                Text(
                                  context.l10n.noActiveTickets,
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    color: primaryTextColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  context.l10n.submitTicketDescription,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: secondaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        // Display only up to 3 recent tickets
                        final recentTickets = tickets.take(3).toList();

                        return Column(
                          children: recentTickets.map((ticket) {
                            final formattedDate = DateFormat(
                              'dd MMM, hh:mm a',
                            ).format(ticket.createdAt.toLocal());
                            return Container(
                              margin: EdgeInsets.only(bottom: 12.h),
                              decoration: BoxDecoration(
                                color: cardBgColor,
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(color: dividerColor),
                              ),
                              child: ListTile(
                                onTap: () =>
                                    context.push('/support/chat/${ticket.id}'),
                                title: Row(
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
                                    const Spacer(),
                                    _buildStatusBadge(context, ticket.status),
                                  ],
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 6.h),
                                    Text(
                                      ticket.subject,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles.bodyMedium.copyWith(
                                        color: primaryTextColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 6.h),
                                    Row(
                                      children: [
                                        _buildCategoryBadge(
                                          context,
                                          ticket.category,
                                          ticket.status,
                                          isDark,
                                        ),
                                        const Spacer(),
                                        Text(
                                          formattedDate,
                                          style: AppTextStyles.bodySmall
                                              .copyWith(
                                                color: secondaryTextColor,
                                                fontSize: 10.sp,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      },
                      loading: () => _buildShimmerRecentTickets(
                        isDark,
                        cardBgColor,
                        dividerColor,
                      ),
                      error: (err, stack) => Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: cardBgColor,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color: dividerColor),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.error_outline_rounded,
                              color: AppColors.errorLight,
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Text(
                                context.l10n.failedToLoadTickets,
                                style: AppTextStyles.bodySmall.copyWith(
                                  color: secondaryTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .animate()
                    .fade(delay: 150.ms, duration: 300.ms),

                SizedBox(height: 24.h),

                // ── Quick Support Channels ──
                Text(
                  context.l10n.contactSupport,
                  style: AppTextStyles.titleSmall.copyWith(
                    color: primaryTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),

                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: _buildContactCard(
                          icon: Icons.phone_rounded,
                          title: context.l10n.callUs,
                          subtitle: phoneDisplay,
                          color: Colors.green,
                          onTap: () => _launchUrl('tel:${phoneNum.replaceAll(RegExp(r'[^0-9+]'), '')}'),
                          cardBgColor: cardBgColor,
                          isDark: isDark,
                          dividerColor: dividerColor,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: _buildContactCard(
                          icon: Icons.chat_rounded,
                          title: context.l10n.whatsApp,
                          subtitle: context.l10n.chatWithUs,
                          color: const Color(0xFF25D366),
                          onTap: () => _launchUrl(waUrl),
                          cardBgColor: cardBgColor,
                          isDark: isDark,
                          dividerColor: dividerColor,
                        ),
                      ),
                    ],
                  ),
                ).animate().fade(delay: 200.ms, duration: 300.ms),

                SizedBox(height: 12.h),

                _buildFullWidthContactCard(
                  icon: Icons.email_rounded,
                  title: context.l10n.emailSupport,
                  subtitle: supportEmail,
                  color: AppColors.primary500,
                  onTap: () => _launchUrl(
                    'mailto:$supportEmail?subject=Driver Partner Support',
                  ),
                  cardBgColor: cardBgColor,
                  isDark: isDark,
                  dividerColor: dividerColor,
                ).animate().fade(delay: 250.ms, duration: 300.ms),

                SizedBox(height: 100.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
    required Color cardBgColor,
    required bool isDark,
    required Color dividerColor,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20.r),
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: cardBgColor,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: dividerColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 24.sp),
              ),
              SizedBox(height: 16.h),
              Text(
                title,
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                subtitle,
                style: AppTextStyles.bodySmall.copyWith(
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
    required Color cardBgColor,
    required bool isDark,
    required Color dividerColor,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20.r),
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: cardBgColor,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: dividerColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 24.sp),
              ),
              SizedBox(height: 16.h),
              Text(
                title,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                subtitle,
                style: AppTextStyles.bodySmall.copyWith(
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFullWidthContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
    required Color cardBgColor,
    required bool isDark,
    required Color dividerColor,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20.r),
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: cardBgColor,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: dividerColor),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 24.sp),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isDark
                            ? AppColors.darkTextPrimary
                            : AppColors.lightTextPrimary,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      subtitle,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerRecentTickets(
    bool isDark,
    Color cardBgColor,
    Color dividerColor,
  ) {
    return Shimmer.fromColors(
      baseColor: isDark ? AppColors.neutral800 : AppColors.neutral200,
      highlightColor: isDark ? AppColors.neutral700 : AppColors.neutral100,
      child: Column(
        children: List.generate(3, (index) {
          return Container(
            margin: EdgeInsets.only(bottom: 12.h),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: cardBgColor,
              borderRadius: BorderRadius.circular(16.r),
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
                      height: 18.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Container(
                  height: 16.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 10.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    Container(
                      height: 10.h,
                      width: 80.w,
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
        }),
      ),
    );
  }
}
