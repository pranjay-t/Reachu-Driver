import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../providers/faq_providers.dart';
import 'faqs_details_screen.dart';

class FaqsScreen extends ConsumerStatefulWidget {
  final String? initialCategory;

  const FaqsScreen({
    super.key,
    this.initialCategory,
  });

  @override
  ConsumerState<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends ConsumerState<FaqsScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.trim().toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
    final borderColor = isDark ? AppColors.neutral800 : AppColors.neutral200;

    final categoriesAsync = ref.watch(faqCategoriesProvider);

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.darkSurface01
          : AppColors.lightSurface01,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: isDark
            ? AppColors.darkSurface01
            : AppColors.lightSurface01,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryTextColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Frequently Asked Questions',
          style: AppTextStyles.titleMedium.copyWith(
            color: primaryTextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          /// Search Bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: TextField(
              controller: _searchController,
              style: AppTextStyles.bodyMedium.copyWith(color: primaryTextColor),
              decoration: InputDecoration(
                hintText: 'Search FAQs...',
                hintStyle: AppTextStyles.bodyMedium.copyWith(color: secondaryTextColor),
                prefixIcon: Icon(Icons.search, color: secondaryTextColor, size: 20.w),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear, color: secondaryTextColor, size: 18.w),
                        onPressed: () => _searchController.clear(),
                      )
                    : null,
                filled: true,
                fillColor: cardBgColor,
                contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: borderColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(color: AppColors.primary500),
                ),
              ),
            ),
          ),

          /// Vertical List of FAQ Categories
          Expanded(
            child: categoriesAsync.when(
              data: (response) {
                final categories = response.categories ?? [];
                if (categories.isEmpty) {
                  return _buildEmptyState(secondaryTextColor, 'No FAQ categories found');
                }

                return ListView.separated(
                  padding: EdgeInsets.all(16.w),
                  itemCount: categories.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final cat = categories[index];
                    final isInitialCategory = widget.initialCategory != null &&
                        (cat.name == widget.initialCategory || cat.id == widget.initialCategory);

                    return Card(
                      elevation: 0,
                      color: cardBgColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        side: BorderSide(color: borderColor),
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                        ),
                        child: ExpansionTile(
                          key: Key('category_${cat.id}'),
                          initiallyExpanded: index == 0 || isInitialCategory || _searchQuery.isNotEmpty,
                          leading: Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: AppColors.primary500.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Icon(
                              Icons.folder_outlined,
                              color: AppColors.primary500,
                              size: 20.w,
                            ),
                          ),
                          title: Text(
                            cat.name ?? '',
                            style: AppTextStyles.titleSmall.copyWith(
                              color: primaryTextColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          children: [
                            _CategoryQuestionsList(
                              categoryId: cat.id ?? '',
                              categoryName: cat.name ?? '',
                              searchQuery: _searchQuery,
                              isDark: isDark,
                              primaryTextColor: primaryTextColor,
                              secondaryTextColor: secondaryTextColor,
                              cardBgColor: cardBgColor,
                              borderColor: borderColor,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 48.w, color: AppColors.errorDark),
                    SizedBox(height: 12.h),
                    Text(
                      'Failed to load FAQ categories',
                      style: AppTextStyles.bodyLarge.copyWith(color: primaryTextColor),
                    ),
                    SizedBox(height: 12.h),
                    ElevatedButton(
                      onPressed: () => ref.refresh(faqCategoriesProvider),
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary500),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(Color textColor, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.help_outline, size: 64.w, color: textColor.withValues(alpha: 0.5)),
          SizedBox(height: 16.h),
          Text(
            message,
            style: AppTextStyles.titleMedium.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}

class _CategoryQuestionsList extends ConsumerWidget {
  final String categoryId;
  final String categoryName;
  final String searchQuery;
  final bool isDark;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color cardBgColor;
  final Color borderColor;

  const _CategoryQuestionsList({
    required this.categoryId,
    required this.categoryName,
    required this.searchQuery,
    required this.isDark,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.cardBgColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (categoryId.isEmpty) {
      return const SizedBox.shrink();
    }

    final faqsAsync = ref.watch(faqsByCategoryProvider(categoryId));

    return faqsAsync.when(
      data: (response) {
        final questions = response.questions ?? [];
        final filtered = searchQuery.isEmpty
            ? questions
            : questions.where((item) {
                final q = item.question?.toLowerCase() ?? '';
                final a = item.answer?.toLowerCase() ?? '';
                return q.contains(searchQuery) || a.contains(searchQuery);
              }).toList();

        if (filtered.isEmpty) {
          if (searchQuery.isNotEmpty) return const SizedBox.shrink();
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Text(
              'No FAQs found in this category.',
              style: AppTextStyles.bodyMedium.copyWith(color: secondaryTextColor),
            ),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          itemCount: filtered.length,
          separatorBuilder: (context, index) => Divider(color: borderColor, height: 1.h),
          itemBuilder: (context, index) {
            final item = filtered[index];
            return ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              leading: Icon(
                Icons.help_outline,
                color: AppColors.primary500,
                size: 18.w,
              ),
              title: Text(
                item.question ?? '',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: primaryTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: secondaryTextColor,
                size: 18.w,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FaqsDetailsScreen(
                      question: item.question,
                      answer: item.answer,
                      categoryName: categoryName,
                    ),
                  ),
                );
              },
            );
          },
        );
      },
      loading: () => Padding(
        padding: EdgeInsets.all(16.w),
        child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
      ),
      error: (err, stack) => Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            Icon(Icons.error_outline, color: AppColors.errorDark, size: 20.w),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                'Failed to load FAQs for $categoryName',
                style: AppTextStyles.bodyMedium.copyWith(color: secondaryTextColor),
              ),
            ),
            TextButton(
              onPressed: () => ref.refresh(faqsByCategoryProvider(categoryId)),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
