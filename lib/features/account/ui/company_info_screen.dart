import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:go_router/go_router.dart';
import '../providers/company_controller.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/localization/locale_provider.dart';

class CompanyInfoScreen extends ConsumerWidget {
  final String type; // 'privacy' or 'terms'
  const CompanyInfoScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final companyState = ref.watch(companyControllerProvider);
    final l10n = context.l10n;
    final title = type == 'privacy'
        ? l10n.privacyPolicy
        : l10n.termsAndConditions;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkSurface01 : AppColors.lightSurface01,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: isDark ? Colors.white : Colors.black87,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          title,
          style: AppTextStyles.titleMedium.copyWith(
            color: isDark ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Scrollable Info Area
            Expanded(
              child: companyState.when(
                data: (company) {
                  final rawContent = type == 'privacy'
                      ? company.privacyPolicy
                      : company.termAndCondition;
                  final htmlContent = rawContent.trim().isNotEmpty
                      ? rawContent
                      : (type == 'privacy'
                          ? l10n.defaultPrivacyPolicyHtml
                          : l10n.defaultTermsAndConditionsHtml);

                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.all(20.w),
                    child: Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.darkSurface02 : Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: (isDark ? AppColors.neutral800 : AppColors.neutral200)
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
                      child: HtmlWidget(
                        htmlContent,
                        textStyle: TextStyle(
                          fontSize: 14.sp,
                          color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                          height: 1.5,
                        ),
                        customStylesBuilder: (element) {
                          if (element.localName == 'h1') {
                            return {
                              'font-size': '18px',
                              'font-weight': 'bold',
                              'color': isDark ? '#FFFFFF' : '#1F2937',
                              'margin-top': '16px',
                              'margin-bottom': '8px',
                            };
                          }
                          if (element.localName == 'h2') {
                            return {
                              'font-size': '16px',
                              'font-weight': '600',
                              'color': isDark ? '#E5E7EB' : '#374151',
                              'margin-top': '12px',
                              'margin-bottom': '6px',
                            };
                          }
                          if (element.localName == 'strong') {
                            return {
                              'font-weight': 'bold',
                              'color': isDark ? '#A78BFA' : '#7C3AED',
                            };
                          }
                          return null;
                        },
                      ),
                    ),
                  ).animate().fade(duration: 400.ms).slideY(
                        begin: 0.05,
                        end: 0,
                        duration: 400.ms,
                        curve: Curves.easeOutCubic,
                      );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF7C3AED),
                  ),
                ),
                error: (error, _) => Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline_rounded,
                          color: AppColors.errorDark,
                          size: 48.sp,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          l10n.failedToLoadDetails,
                          style: AppTextStyles.titleMedium.copyWith(
                            color: isDark ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          error.toString().replaceAll('Exception:', '').trim(),
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: isDark ? Colors.white54 : Colors.black54,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        ElevatedButton.icon(
                          onPressed: () => ref.invalidate(companyControllerProvider),
                          icon: const Icon(Icons.refresh_rounded),
                          label: Text(l10n.retry),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7C3AED),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.w,
                              vertical: 12.h,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        ),
                      ],
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
}
