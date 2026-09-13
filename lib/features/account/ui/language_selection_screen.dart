import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:reachu_driver/app/theme/app_colors.dart';
import 'package:reachu_driver/app/theme/app_text_styles.dart';
import 'package:reachu_driver/core/localization/locale_provider.dart';
import 'package:reachu_driver/core/utils/app_snackbar.dart';

class LanguageOption {
  final String code;
  final String name; // Native name
  final String englishSublabel; // English name
  final String badgeText;

  const LanguageOption({
    required this.code,
    required this.name,
    required this.englishSublabel,
    required this.badgeText,
  });
}

const List<LanguageOption> kSupportedLanguages = [
  LanguageOption(
    code: 'en',
    name: 'English',
    englishSublabel: 'English',
    badgeText: 'EN',
  ),
  LanguageOption(
    code: 'hi',
    name: 'हिन्दी',
    englishSublabel: 'Hindi',
    badgeText: 'HI',
  ),
  LanguageOption(
    code: 'bn',
    name: 'বাংলা',
    englishSublabel: 'Bengali',
    badgeText: 'BN',
  ),
  LanguageOption(
    code: 'gu',
    name: 'ગુજરાતી',
    englishSublabel: 'Gujarati',
    badgeText: 'GU',
  ),
  LanguageOption(
    code: 'kn',
    name: 'ಕನ್ನಡ',
    englishSublabel: 'Kannada',
    badgeText: 'KN',
  ),
  LanguageOption(
    code: 'ml',
    name: 'മലയാളം',
    englishSublabel: 'Malayalam',
    badgeText: 'ML',
  ),
  LanguageOption(
    code: 'mr',
    name: 'मराठी',
    englishSublabel: 'Marathi',
    badgeText: 'MR',
  ),
  LanguageOption(
    code: 'or',
    name: 'ଓଡ଼ିଆ',
    englishSublabel: 'Odia',
    badgeText: 'OR',
  ),
  LanguageOption(
    code: 'pa',
    name: 'ਪੰਜਾਬੀ',
    englishSublabel: 'Punjabi',
    badgeText: 'PA',
  ),
  LanguageOption(
    code: 'ta',
    name: 'தமிழ்',
    englishSublabel: 'Tamil',
    badgeText: 'TA',
  ),
  LanguageOption(
    code: 'te',
    name: 'తెలుగు',
    englishSublabel: 'Telugu',
    badgeText: 'TE',
  ),
];

class LanguageSelectionScreen extends ConsumerStatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  ConsumerState<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState
    extends ConsumerState<LanguageSelectionScreen> {
  late String _selectedCode;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _selectedCode = ref.read(localeProvider).languageCode;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final filteredLanguages = kSupportedLanguages.where((lang) {
      if (_searchQuery.isEmpty) return true;
      final q = _searchQuery.toLowerCase();
      return lang.name.toLowerCase().contains(q) ||
          lang.englishSublabel.toLowerCase().contains(q) ||
          lang.code.toLowerCase().contains(q);
    }).toList();

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.darkSurface01 : AppColors.lightSurface01,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color:
                isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            size: 20.r,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          context.l10n.selectLanguage,
          style: AppTextStyles.titleMedium.copyWith(
            color:
                isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkSurface02 : Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: (isDark
                            ? AppColors.neutral800
                            : AppColors.neutral200)
                        .withValues(alpha: 0.5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: (val) {
                    setState(() {
                      _searchQuery = val;
                    });
                  },
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.lightTextPrimary,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search language / भाषा खोजें...',
                    hintStyle: AppTextStyles.bodyMedium.copyWith(
                      color: isDark
                          ? AppColors.neutral400
                          : AppColors.neutral500,
                    ),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: AppColors.primary500,
                      size: 22.r,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 14.h,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),

            // Language List
            Expanded(
              child: filteredLanguages.isEmpty
                  ? Center(
                      child: Text(
                        'No language found',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: isDark
                              ? AppColors.darkTextSecondary
                              : AppColors.lightTextSecondary,
                        ),
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 12.h,
                      ),
                      itemCount: filteredLanguages.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 12.h),
                      itemBuilder: (context, index) {
                        final lang = filteredLanguages[index];
                        final isSelected = lang.code == _selectedCode;

                        return _buildLanguageCard(
                          context: context,
                          lang: lang,
                          isSelected: isSelected,
                          isDark: isDark,
                          onTap: () {
                            setState(() {
                              _selectedCode = lang.code;
                            });
                          },
                        )
                            .animate()
                            .fadeIn(
                              duration: 300.ms,
                              delay: (index * 40).ms,
                            )
                            .slideY(
                              begin: 0.1,
                              end: 0,
                              duration: 300.ms,
                              delay: (index * 40).ms,
                              curve: Curves.easeOutCubic,
                            );
                      },
                    ),
            ),

            // Bottom Sticky Apply Button
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSurface01 : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 16,
                    offset: const Offset(0, -4),
                  ),
                ],
                border: Border(
                  top: BorderSide(
                    color: (isDark
                            ? AppColors.neutral800
                            : AppColors.neutral200)
                        .withValues(alpha: 0.5),
                  ),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  onPressed: () async {
                    final targetLocale = Locale(_selectedCode);
                    await ref
                        .read(localeProvider.notifier)
                        .setLocale(targetLocale);
                    if (!context.mounted) return;

                    AppSnackBar.show(
                      context,
                      message: 'Language updated successfully',
                      type: SnackBarType.success,
                    );
                    context.pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary500,
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Text(
                    'Apply / लागू करें',
                    style: AppTextStyles.titleMedium.copyWith(
                      color: Colors.white,
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

  Widget _buildLanguageCard({
    required BuildContext context,
    required LanguageOption lang,
    required bool isSelected,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    final activeBg = isDark
        ? AppColors.primary500.withValues(alpha: 0.15)
        : AppColors.primary500.withValues(alpha: 0.08);

    final cardBg = isSelected
        ? activeBg
        : (isDark ? AppColors.darkSurface02 : Colors.white);

    final borderColor = isSelected
        ? AppColors.primary500
        : (isDark ? AppColors.neutral800 : AppColors.neutral200)
            .withValues(alpha: 0.6);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: borderColor,
            width: isSelected ? 2.w : 1.w,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary500.withValues(alpha: 0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Row(
          children: [
            // Regional Code Badge Container
            Container(
              width: 44.r,
              height: 44.r,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary500
                    : (isDark
                        ? AppColors.neutral800
                        : AppColors.neutral100),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Text(
                  lang.badgeText,
                  style: AppTextStyles.titleSmall.copyWith(
                    color: isSelected
                        ? Colors.white
                        : (isDark
                            ? AppColors.darkTextPrimary
                            : AppColors.neutral700),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.w),

            // Language Names Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lang.name,
                    style: AppTextStyles.titleSmall.copyWith(
                      color: isDark
                          ? AppColors.darkTextPrimary
                          : AppColors.lightTextPrimary,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    lang.englishSublabel,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.lightTextSecondary,
                    ),
                  ),
                ],
              ),
            ),

            // Custom Selection Radio/Check Badge
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 24.r,
              height: 24.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.primary500 : Colors.transparent,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primary500
                      : (isDark ? AppColors.neutral600 : AppColors.neutral400),
                  width: 2.w,
                ),
              ),
              child: isSelected
                  ? Icon(
                      Icons.check_rounded,
                      size: 16.r,
                      color: Colors.white,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
