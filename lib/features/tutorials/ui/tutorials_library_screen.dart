import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/localization/locale_provider.dart';
import '../providers/tutorial_controller.dart';
import 'widgets/tutorial_video_player.dart';

class TutorialsLibraryScreen extends ConsumerStatefulWidget {
  const TutorialsLibraryScreen({super.key});

  @override
  ConsumerState<TutorialsLibraryScreen> createState() =>
      _TutorialsLibraryScreenState();
}

class _TutorialsLibraryScreenState
    extends ConsumerState<TutorialsLibraryScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final tutorialsAsync = ref.watch(tutorialsControllerProvider);

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.darkSurface01
          : AppColors.lightSurface01,
      appBar: AppBar(
        backgroundColor: isDark
            ? AppColors.darkSurface01
            : AppColors.lightSurface01,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: isDark
                ? AppColors.darkTextPrimary
                : AppColors.lightTextPrimary,
            size: 20.sp,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          context.l10n.trainingVideos,
          style: AppTextStyles.titleMedium.copyWith(
            color: isDark
                ? AppColors.darkTextPrimary
                : AppColors.lightTextPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: tutorialsAsync.when(
          data: (tutorials) {
            if (tutorials.isEmpty) {
              return Center(
                child: Text(
                  'No training videos available.',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                  ),
                ),
              );
            }

            final safeIndex = _selectedIndex.clamp(0, tutorials.length - 1);
            final activeTutorial = tutorials[safeIndex];

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Video Player Card
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(18.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 14,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: TutorialVideoPlayer(
                      key: ValueKey(activeTutorial.id),
                      videoUrl: activeTutorial.videoUrl,
                      onCompleted: () async {
                        await ref
                            .read(tutorialsControllerProvider.notifier)
                            .markWatched(activeTutorial.id);
                        if (mounted) {
                          setState(() {});
                        }
                      },
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // 2. Active Tutorial Details
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.darkSurface02 : Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: (isDark
                                ? AppColors.neutral800
                                : AppColors.neutral200)
                            .withValues(alpha: 0.4),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8.w,
                                          vertical: 2.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: activeTutorial.isMandatory
                                              ? Colors.orange.withValues(alpha: 0.15)
                                              : AppColors.primary500.withValues(alpha: 0.12),
                                          borderRadius: BorderRadius.circular(6.r),
                                          border: Border.all(
                                            color: activeTutorial.isMandatory
                                                ? Colors.orange
                                                : AppColors.primary500,
                                            width: 0.8,
                                          ),
                                        ),
                                        child: Text(
                                          activeTutorial.isMandatory
                                              ? 'Required'
                                              : 'Optional',
                                          style: AppTextStyles.bodySmall.copyWith(
                                            color: activeTutorial.isMandatory
                                                ? Colors.orange
                                                : AppColors.primary500,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      ),
                                      if (activeTutorial.category.isNotEmpty &&
                                          activeTutorial.category != 'General') ...[
                                        SizedBox(width: 6.w),
                                        Text(
                                          '• ${activeTutorial.category}',
                                          style: AppTextStyles.bodySmall.copyWith(
                                            color: isDark
                                                ? AppColors.darkTextSecondary
                                                : AppColors.lightTextSecondary,
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    activeTutorial.title.isNotEmpty
                                        ? activeTutorial.title
                                        : 'Driver Guide',
                                    style: AppTextStyles.titleMedium.copyWith(
                                      color: isDark
                                          ? AppColors.darkTextPrimary
                                          : AppColors.lightTextPrimary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (activeTutorial.watched)
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF10B981)
                                      .withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.check_circle_rounded,
                                      color: const Color(0xFF10B981),
                                      size: 14.sp,
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      'Watched',
                                      style: AppTextStyles.bodySmall.copyWith(
                                        color: const Color(0xFF10B981),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                        if (activeTutorial.description.isNotEmpty) ...[
                          SizedBox(height: 8.h),
                          Text(
                            activeTutorial.description,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: isDark
                                  ? AppColors.darkTextSecondary
                                  : AppColors.lightTextSecondary,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // 3. Playlist of Videos
                  Text(
                    'All Training Videos (${tutorials.length})',
                    style: AppTextStyles.titleSmall.copyWith(
                      color: isDark
                          ? AppColors.darkTextPrimary
                          : AppColors.lightTextPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 12.h),

                  ...List.generate(tutorials.length, (idx) {
                    final item = tutorials[idx];
                    final isSelected = idx == _selectedIndex;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = idx;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? (isDark
                                  ? AppColors.primary500.withValues(alpha: 0.15)
                                  : AppColors.primary500.withValues(alpha: 0.08))
                              : (isDark ? AppColors.darkSurface02 : Colors.white),
                          borderRadius: BorderRadius.circular(14.r),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary500
                                : (isDark
                                        ? AppColors.neutral800
                                        : AppColors.neutral200)
                                    .withValues(alpha: 0.4),
                            width: isSelected ? 1.5 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 36.r,
                              height: 36.r,
                              decoration: BoxDecoration(
                                color: item.watched
                                    ? const Color(0xFF10B981)
                                    : (isSelected
                                        ? AppColors.primary500
                                        : AppColors.neutral400),
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: item.watched
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 20.sp,
                                    )
                                  : Text(
                                      '${idx + 1}',
                                      style: AppTextStyles.bodyMedium.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title.isNotEmpty
                                        ? item.title
                                        : 'Tutorial ${idx + 1}',
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      color: isDark
                                          ? AppColors.darkTextPrimary
                                          : AppColors.lightTextPrimary,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 3.h),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 6.w,
                                          vertical: 1.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: item.isMandatory
                                              ? Colors.orange.withValues(alpha: 0.15)
                                              : (isDark
                                                  ? AppColors.neutral800
                                                  : AppColors.neutral200),
                                          borderRadius: BorderRadius.circular(4.r),
                                        ),
                                        child: Text(
                                          item.isMandatory ? 'Required' : 'Optional',
                                          style: AppTextStyles.bodySmall.copyWith(
                                            color: item.isMandatory
                                                ? Colors.orange
                                                : (isDark
                                                    ? AppColors.darkTextSecondary
                                                    : AppColors.lightTextSecondary),
                                            fontSize: 10.sp,
                                            fontWeight: item.isMandatory
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      if (item.durationSeconds > 0) ...[
                                        SizedBox(width: 8.w),
                                        Text(
                                          '${(item.durationSeconds / 60).ceil()} mins',
                                          style: AppTextStyles.bodySmall.copyWith(
                                            color: isDark
                                                ? AppColors.darkTextSecondary
                                                : AppColors.lightTextSecondary,
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.play_circle_outline_rounded,
                              color: isSelected
                                  ? AppColors.primary500
                                  : AppColors.neutral400,
                              size: 24.sp,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            );
          },
          loading: () => _buildShimmerLoading(isDark),
          error: (err, _) => Center(
            child: Text(
              'Error loading tutorials.',
              style: AppTextStyles.bodyMedium.copyWith(
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerLoading(bool isDark) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Shimmer.fromColors(
        baseColor: isDark ? AppColors.darkSurface02 : AppColors.neutral200,
        highlightColor: isDark ? AppColors.darkSurface03 : AppColors.neutral100,
        child: Column(
          children: [
            Container(
              height: 200.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              height: 60.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
