import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/localization/locale_provider.dart';
import '../../auth/providers/login_controller.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../shared/widgets/app_cached_image.dart';
import '../../../shared/widgets/permission_gate_popup.dart';
import '../../../shared/widgets/app_online_toggle.dart';
import '../providers/profile_controller.dart';
import '../providers/company_controller.dart';
import '../../../../core/socket/socket_manager_provider.dart';
import '../../../../core/socket/socket_stream_manager.dart';
import '../../../core/utils/app_snackbar.dart';
import '../../../app/theme/app_theme_provider.dart';
import '../../../shared/widgets/app_theme_toggle.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool _isEShramDismissed = false;

  @override
  void initState() {
    super.initState();
    _loadEShramDismissState();
  }

  Future<void> _loadEShramDismissState() async {
    final prefs = await SharedPreferences.getInstance();
    final dismissed = prefs.getBool('eshram_banner_dismissed') ?? false;
    if (mounted && dismissed) {
      setState(() {
        _isEShramDismissed = true;
      });
    }
  }

  Future<void> _dismissEShramBanner() async {
    setState(() {
      _isEShramDismissed = true;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('eshram_banner_dismissed', true);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final authState = ref.watch(loginControllerProvider);
    final profileState = ref.watch(profileControllerProvider);

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.darkSurface01
          : AppColors.lightSurface01,
      body: SafeArea(
        top: false,
        child: profileState.when(
          data: (user) => _buildMainContent(
            context,
            ref,
            user,
            isDark,
            theme,
            authState.isLoading,
          ),
          loading: () => _buildShimmerProfileLayout(isDark),
          error: (err, stack) => _buildErrorLayout(err.toString(), isDark),
        ),
      ),
    );
  }

  Widget _buildMainContent(
    BuildContext context,
    WidgetRef ref,
    dynamic user,
    bool isDark,
    ThemeData theme,
    bool isLoggingOut,
  ) {
    final userName = user.name ?? 'User';
    final userPhone = user.phone.isNotEmpty ? "+91 ${user.phone}" : "";
    final profileImageUrl = user.image;
    final ratingValue = user.rating != null
        ? user.rating!.toStringAsFixed(1)
        : "4.8";
    final socketStatus = ref.watch(socketManagerProvider);
    final isOnline = socketStatus.isOnDuty;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Header Stack (Curved Violet Header + Overlapping Switch Card)
          Stack(
                clipBehavior: Clip.none,
                children: [
                  // Curved Violet Container
                  Container(
                    height: 250.h,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.primary500,
                          AppColors.primary700,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(32.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary500.withValues(alpha: 0.25),
                          blurRadius: 16,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 60.h,
                      left: 24.w,
                      right: 24.w,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Circular Avatar with White Border
                        Container(
                          width: 76.w,
                          height: 76.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2.5.w,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.12),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child:
                              (profileImageUrl != null &&
                                  profileImageUrl.isNotEmpty)
                              ? AppCachedImage(
                                  imageUrl: profileImageUrl,
                                  width: 76.w,
                                  height: 76.w,
                                  borderRadius: BorderRadius.circular(38.r),
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.white24,
                                  child: Icon(
                                    Icons.person_rounded,
                                    size: 36.sp,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                        SizedBox(width: 16.w),
                        // User Text Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                userName,
                                style: AppTextStyles.titleMedium.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.sp,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                userPhone,
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: Colors.white.withValues(alpha: 0.85),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 6.h),
                              // Rating Badge (Clickable)
                              GestureDetector(
                                onTap: () => context.push('/profile/rating'),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.star_rounded,
                                        color: Colors.amber,
                                        size: 18.sp,
                                      ),
                                      SizedBox(width: 4.w),
                                      Text(
                                        ratingValue,
                                        style: AppTextStyles.bodyMedium.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(width: 2.w),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        color: Colors.white.withValues(alpha: 0.7),
                                        size: 16.sp,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Overlapping Switch Card
                  Positioned(
                    bottom: -28.h,
                    left: 24.w,
                    right: 24.w,
                    height: 64.h,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.darkSurface02 : Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color:
                              (isDark
                                      ? AppColors.neutral800
                                      : AppColors.neutral200)
                                  .withValues(alpha: 0.4),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            isOnline
                                ? context.l10n.online
                                : context.l10n.offline,
                            style: AppTextStyles.titleSmall.copyWith(
                              color: isDark
                                  ? AppColors.darkTextPrimary
                                  : AppColors.lightTextPrimary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          AppOnlineToggle(
                            value: isOnline,
                            isProcessing: socketStatus.isProcessing,
                            onChanged: (val) async {
                              final l10n = context.l10n;

                              if (val) {
                                final allGranted = await PermissionGatePopup.checkAndShow(context);
                                if (!context.mounted) return;
                                if (!allGranted) return;
                                await ref.read(socketClientProvider).getInitialLocation();
                                if (!context.mounted) return;
                              }

                              // 1. Optimistic Update
                              ref
                                  .read(profileControllerProvider.notifier)
                                  .updateDutyStatusOptimistic(val);

                              final success = await ref
                                  .read(socketManagerProvider.notifier)
                                  .toggleDuty(val);

                              if (!context.mounted) return;

                              if (success) {
                                // 2. Silent Sync Profile state
                                await ref
                                    .read(profileControllerProvider.notifier)
                                    .refreshProfile(silent: true);
                                if (!context.mounted) return;

                                if (context.mounted) {
                                  AppSnackBar.show(
                                    context,
                                    message: val
                                        ? l10n.onlineSuccessMessage
                                        : l10n.offlineSuccessMessage,
                                    type: val
                                        ? SnackBarType.success
                                        : SnackBarType.info,
                                  );
                                }
                              } else {
                                // 3. Revert Optimistic Update if failed
                                if (context.mounted) {
                                  ref
                                      .read(profileControllerProvider.notifier)
                                      .updateDutyStatusOptimistic(!val);
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
              .animate()
              .slideY(
                begin: -0.15,
                end: 0,
                duration: 400.ms,
                curve: Curves.easeOutCubic,
              )
              .fade(duration: 400.ms),

          SizedBox(height: 32.h), // Spacer for the overlapping switch card

          // 2. Government e-Shram Benefits Card
          _buildEShramCard(context, ref, isDark),

          SizedBox(height: 20.h),

          // 3. Unified Menu Card
          Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.darkSurface02 : Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color:
                          (isDark ? AppColors.neutral800 : AppColors.neutral200)
                              .withValues(alpha: 0.4),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _buildMenuRow(
                        context: context,
                        icon: Icons.person_outline_rounded,
                        title: context.l10n.personalInformation,
                        onTap: () => context.push('/profile/edit_profile'),
                        isDark: isDark,
                      ),
                      _buildDivider(isDark),
                      _buildMenuRow(
                        context: context,
                        icon: Icons.verified_user_outlined,
                        title: context.l10n.eShramGovtBenefitsMenu,
                        onTap: () {
                          final companyState = ref.read(companyControllerProvider);
                          final link = companyState.maybeWhen(
                            data: (company) => company.insuranceLink,
                            orElse: () => null,
                          ) ?? "https://register.eshram.gov.in/#/user/platform-worker-registration";
                          _launchInsuranceUrl(link);
                        },
                        isDark: isDark,
                      ),
                      _buildDivider(isDark),
                      _buildMenuRow(
                        context: context,
                        icon: Icons.star_outline_rounded,
                        title: context.l10n.reviewAndRating,
                        onTap: () => context.push('/profile/rating'),
                        isDark: isDark,
                      ),
                      _buildDivider(isDark),
                      _buildMenuRow(
                        context: context,
                        icon: Icons.account_balance_wallet_outlined,
                        title: context.l10n.payments,
                        onTap: () => context.push('/payment'),
                        isDark: isDark,
                      ),
                      _buildDivider(isDark),
                      _buildMenuRow(
                        context: context,
                        icon: Icons.language_rounded,
                        title: context.l10n.language,
                        onTap: () => context.push('/profile/language'),
                        isDark: isDark,
                        trailing: Text(
                          _getNativeLanguageName(
                            Localizations.localeOf(context).languageCode,
                          ),
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.primary500,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      _buildDivider(isDark),
                      _buildMenuRow(
                        context: context,
                        icon: Icons.privacy_tip_outlined,
                        title: context.l10n.privacyPolicy,
                        onTap: () => context.push('/privacy_policy'),
                        isDark: isDark,
                      ),
                      _buildDivider(isDark),
                      _buildMenuRow(
                        context: context,
                        icon: Icons.description_outlined,
                        title: context.l10n.termsAndConditions,
                        onTap: () => context.push('/terms_conditions'),
                        isDark: isDark,
                      ),
                      _buildDivider(isDark),
                      _buildMenuRow(
                        context: context,
                        icon: Icons.dark_mode_outlined,
                        title: context.l10n.darkTheme,
                        onTap: () {
                          ref.read(themeModeProvider.notifier).toggleTheme();
                        },
                        isDark: isDark,
                        showChevron: false,
                        trailing: AppThemeToggle(
                          isDark: ref.watch(themeModeProvider) == ThemeMode.dark,
                          onChanged: (val) {
                            ref.read(themeModeProvider.notifier).toggleTheme();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .animate()
              .slideY(
                begin: 0.12,
                end: 0,
                duration: 400.ms,
                curve: Curves.easeOutCubic,
              )
              .fade(delay: 100.ms, duration: 400.ms),

          SizedBox(height: 56.h),

          // 3. Logout Button (Outlined Red Border / Red Text)
          Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: OutlinedButton(
                  onPressed: isLoggingOut
                      ? null
                      : () {
                          ref.read(loginControllerProvider.notifier).logout();
                        },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: isDark
                        ? AppColors.errorLight
                        : AppColors.errorDark,
                    side: BorderSide(
                      color: isDark
                          ? AppColors.errorLight
                          : AppColors.errorDark,
                      width: 1.5,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: isLoggingOut
                      ? SizedBox(
                          height: 20.h,
                          width: 20.h,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              isDark
                                  ? AppColors.errorLight
                                  : AppColors.errorDark,
                            ),
                          ),
                        )
                      : Text(
                          context.l10n.logout,
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: isDark
                                ? AppColors.errorLight
                                : AppColors.errorDark,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              )
              .animate()
              .slideY(
                begin: 0.12,
                end: 0,
                duration: 400.ms,
                curve: Curves.easeOutCubic,
              )
              .fade(delay: 200.ms, duration: 400.ms),

          SizedBox(height: 32.h),
        ],
      ),
    );
  }

  Widget _buildMenuRow({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required bool isDark,
    Widget? trailing,
    bool showChevron = true,
  }) {
    final primaryTextColor = isDark
        ? AppColors.darkTextPrimary
        : AppColors.lightTextPrimary;
    final mutedTextColor = isDark ? AppColors.neutral400 : AppColors.neutral500;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        child: Row(
          children: [
            Icon(
              icon,
              color: primaryTextColor.withValues(alpha: 0.7),
              size: 22.sp,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.w500,
                  color: primaryTextColor,
                ),
              ),
            ),
            if (trailing != null) ...[trailing, SizedBox(width: 8.w)],
            if (showChevron)
              Icon(
                Icons.chevron_right_rounded,
                color: mutedTextColor,
                size: 20.sp,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider(bool isDark) {
    return Divider(
      height: 1,
      thickness: 1,
      color: (isDark ? AppColors.neutral800 : AppColors.neutral200).withValues(
        alpha: 0.4,
      ),
      indent: 56.w,
    );
  }

  Widget _buildShimmerProfileLayout(bool isDark) {
    final baseColor = isDark ? AppColors.neutral800 : AppColors.neutral200;
    final highlightColor = isDark ? AppColors.neutral700 : AppColors.neutral100;

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Stack Shimmer
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 250.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(32.r),
                  ),
                ),
              ),
              Positioned(
                bottom: -28.h,
                left: 24.w,
                right: 24.w,
                height: 64.h,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 48.h),
          // Menu Card Shimmer
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Container(
              height: 200.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),
          SizedBox(height: 56.h),
          // Logout Button Shimmer
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Container(
              height: 52.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorLayout(String error, bool isDark) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkSurface02 : Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: AppColors.errorLight.withValues(alpha: 0.3),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline_rounded,
                color: AppColors.errorLight,
                size: 48.sp,
              ),
              SizedBox(height: 16.h),
              Text(
                error,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.errorLight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getNativeLanguageName(String code) {
    switch (code) {
      case 'hi':
        return 'हिन्दी';
      case 'bn':
        return 'বাংলা';
      case 'gu':
        return 'ગુજરાતી';
      case 'kn':
        return 'ಕನ್ನಡ';
      case 'ml':
        return 'മലയാളം';
      case 'mr':
        return 'मराठी';
      case 'or':
        return 'ଓଡ଼ିଆ';
      case 'pa':
        return 'ਪੰਜਾਬੀ';
      case 'ta':
        return 'தமிழ்';
      case 'te':
        return 'తెలుగు';
      case 'en':
      default:
        return 'English';
    }
  }

  Widget _buildEShramCard(BuildContext context, WidgetRef ref, bool isDark) {
    if (_isEShramDismissed) return const SizedBox.shrink();

    final companyState = ref.watch(companyControllerProvider);
    final link = companyState.maybeWhen(
      data: (company) => company.insuranceLink,
      orElse: () => null,
    ) ?? "https://register.eshram.gov.in/#/user/platform-worker-registration";

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [
                    const Color(0xFF1E293B),
                    const Color(0xFF0F172A),
                  ]
                : [
                    const Color(0xFFEFF6FF),
                    const Color(0xFFDBEAFE),
                  ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isDark
                ? const Color(0xFF3B82F6).withValues(alpha: 0.3)
                : const Color(0xFF60A5FA).withValues(alpha: 0.4),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF3B82F6).withValues(alpha: isDark ? 0.12 : 0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2563EB).withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.verified_user_rounded,
                    color: const Color(0xFF2563EB),
                    size: 22.sp,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            context.l10n.eShramBenefitsTitle,
                            style: AppTextStyles.titleSmall.copyWith(
                              color: isDark ? Colors.white : const Color(0xFF1E3A8A),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                            decoration: BoxDecoration(
                              color: const Color(0xFF16A34A).withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Text(
                              context.l10n.govtScheme,
                              style: TextStyle(
                                color: const Color(0xFF16A34A),
                                fontSize: 9.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        context.l10n.eShramSubHeader,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF2563EB),
                          fontWeight: FontWeight.w500,
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: _dismissEShramBanner,
                  child: Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.1)
                          : Colors.black.withValues(alpha: 0.05),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close_rounded,
                      color: isDark ? Colors.white70 : Colors.black54,
                      size: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              context.l10n.eShramDescription,
              style: AppTextStyles.bodySmall.copyWith(
                color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF334155),
                fontSize: 11.5.sp,
                height: 1.35,
              ),
            ),
            SizedBox(height: 14.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _launchInsuranceUrl(link),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                icon: Icon(
                  Icons.open_in_new_rounded,
                  size: 16.sp,
                ),
                label: Text(
                  context.l10n.registerOnEShramPortal,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ).animate().slideY(begin: 0.1, end: 0, duration: 400.ms).fade(duration: 400.ms);
  }

  Future<void> _launchInsuranceUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(url);
      }
    } catch (e) {
      debugPrint('Error launching url: $e');
    }
  }
}
