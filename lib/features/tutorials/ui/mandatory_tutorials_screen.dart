import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/localization/locale_provider.dart';
import '../../../shared/widgets/app_button.dart';
import '../models/tutorial_model.dart';
import '../providers/tutorial_controller.dart';
import 'widgets/tutorial_video_player.dart';

class MandatoryTutorialsScreen extends ConsumerStatefulWidget {
  const MandatoryTutorialsScreen({super.key});

  @override
  ConsumerState<MandatoryTutorialsScreen> createState() =>
      _MandatoryTutorialsScreenState();
}

class _MandatoryTutorialsScreenState
    extends ConsumerState<MandatoryTutorialsScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final tutorialsAsync = ref.watch(tutorialsControllerProvider);

    return PopScope(
      canPop: false, // Prevent bypassing mandatory training
      child: Scaffold(
        backgroundColor: isDark
            ? AppColors.darkSurface01
            : AppColors.lightSurface01,
        body: SafeArea(
          child: tutorialsAsync.when(
            data: (allTutorials) {
              final tutorials =
                  allTutorials.where((t) => t.isMandatory).toList();
              if (tutorials.isEmpty) {
                return _buildEmptyOrCompletedState(context, isDark, allDone: true);
              }

              final allCompleted = tutorials.every((t) => t.watched);
              if (allCompleted) {
                return _buildEmptyOrCompletedState(context, isDark, allDone: true);
              }

              // Ensure current index is within bounds
              final safeIndex = _currentIndex.clamp(0, tutorials.length - 1);
              final currentTutorial = tutorials[safeIndex];

              return _buildTrainingContent(
                context: context,
                isDark: isDark,
                tutorials: tutorials,
                currentIndex: safeIndex,
                tutorial: currentTutorial,
              );
            },
            loading: () => _buildLoadingState(isDark),
            error: (err, _) => _buildErrorState(context, isDark),
          ),
        ),
      ),
    );
  }

  Widget _buildTrainingContent({
    required BuildContext context,
    required bool isDark,
    required List<TutorialModel> tutorials,
    required int currentIndex,
    required TutorialModel tutorial,
  }) {
    final completedCount = tutorials.where((t) => t.watched).length;
    final totalCount = tutorials.length;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Friendly Welcome Header
          Container(
            padding: EdgeInsets.all(18.r),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isDark
                    ? [const Color(0xFF1E293B), const Color(0xFF0F172A)]
                    : [const Color(0xFFEFF6FF), const Color(0xFFDBEAFE)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: isDark
                    ? AppColors.neutral800.withValues(alpha: 0.5)
                    : const Color(0xFFBFDBFE),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: AppColors.primary500.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.waving_hand_rounded,
                    color: Colors.amber,
                    size: 26.sp,
                  ),
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.welcomeToReachU,
                        style: AppTextStyles.titleMedium.copyWith(
                          color: isDark
                              ? AppColors.darkTextPrimary
                              : AppColors.lightTextPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        context.l10n.welcomeTrainingSubtitle,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: isDark
                              ? AppColors.darkTextSecondary
                              : AppColors.lightTextSecondary,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(duration: 400.ms).slideY(begin: -0.1, end: 0),

          SizedBox(height: 20.h),

          // 2. Simple Progress Tracker
          Row(
            children: [
              Expanded(
                child: Text(
                  'Progress: $completedCount of $totalCount Completed',
                  style: AppTextStyles.titleSmall.copyWith(
                    color: isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.lightTextPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 8.w),
              if (tutorial.watched)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF10B981).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: const Color(0xFF10B981)),
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
                        'Completed',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: const Color(0xFF10B981),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              else
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.orange.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.orange),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.play_circle_fill_rounded,
                        color: Colors.orange,
                        size: 14.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'Pending',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),

          SizedBox(height: 8.h),

          // Progress Bar
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: LinearProgressIndicator(
              value: totalCount > 0 ? (completedCount / totalCount) : 0,
              backgroundColor: isDark
                  ? AppColors.darkSurface02
                  : AppColors.neutral200,
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF10B981)),
              minHeight: 8.h,
            ),
          ),

          SizedBox(height: 20.h),

          // 3. Embedded Video Player
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: TutorialVideoPlayer(
              key: ValueKey(tutorial.id),
              videoUrl: tutorial.videoUrl,
              onCompleted: () async {
                await ref
                    .read(tutorialsControllerProvider.notifier)
                    .markWatched(tutorial.id);
                if (mounted) {
                  setState(() {});
                }
              },
            ),
          ).animate().fadeIn(duration: 500.ms).scale(begin: const Offset(0.98, 0.98)),

          SizedBox(height: 16.h),

          // 4. Video Title & Description
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkSurface02 : Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: isDark
                    ? AppColors.neutral800.withValues(alpha: 0.4)
                    : AppColors.neutral200.withValues(alpha: 0.6),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tutorial.title.isNotEmpty
                      ? tutorial.title
                      : 'Essential Driver Guide',
                  style: AppTextStyles.titleMedium.copyWith(
                    color: isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.lightTextPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (tutorial.description.isNotEmpty) ...[
                  SizedBox(height: 8.h),
                  Text(
                    tutorial.description,
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

          SizedBox(height: 24.h),

          // 5. Next Video or Finish Action
          if (tutorials.length > 1) ...[
            Text(
              'All Required Videos',
              style: AppTextStyles.titleSmall.copyWith(
                color: isDark
                    ? AppColors.darkTextPrimary
                    : AppColors.lightTextPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            ...List.generate(tutorials.length, (idx) {
              final item = tutorials[idx];
              final isSelected = idx == currentIndex;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = idx;
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
                          : (isDark ? AppColors.neutral800 : AppColors.neutral200)
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
                            ? Icon(Icons.check, color: Colors.white, size: 20.sp)
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
                        child: Text(
                          item.title.isNotEmpty ? item.title : 'Tutorial ${idx + 1}',
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
                      ),
                      Icon(
                        Icons.play_circle_outline_rounded,
                        color: isSelected ? AppColors.primary500 : AppColors.neutral400,
                        size: 24.sp,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ],
      ),
    );
  }

  Widget _buildEmptyOrCompletedState(
    BuildContext context,
    bool isDark, {
    required bool allDone,
  }) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(24.r),
              decoration: BoxDecoration(
                color: const Color(0xFF10B981).withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle_rounded,
                color: const Color(0xFF10B981),
                size: 72.sp,
              ),
            ).animate().scale(duration: 400.ms, curve: Curves.elasticOut),
            SizedBox(height: 24.h),
            Text(
              context.l10n.trainingCompletedTitle,
              style: AppTextStyles.headlineSmall.copyWith(
                color: isDark
                    ? AppColors.darkTextPrimary
                    : AppColors.lightTextPrimary,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              context.l10n.trainingCompletedSubtitle,
              style: AppTextStyles.bodyMedium.copyWith(
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 36.h),
            AppButton(
              label: context.l10n.startDriving,
              onPressed: () {
                context.go('/home');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingState(bool isDark) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: isDark ? AppColors.darkSurface02 : AppColors.neutral200,
            highlightColor:
                isDark ? AppColors.darkSurface03 : AppColors.neutral100,
            child: Container(
              height: 70.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Shimmer.fromColors(
            baseColor: isDark ? AppColors.darkSurface02 : AppColors.neutral200,
            highlightColor:
                isDark ? AppColors.darkSurface03 : AppColors.neutral100,
            child: Container(
              height: 200.h,
              width: double.infinity,
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

  Widget _buildErrorState(BuildContext context, bool isDark) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 48.sp,
              color: Colors.redAccent,
            ),
            SizedBox(height: 16.h),
            Text(
              'Could not load training videos.',
              style: AppTextStyles.titleMedium.copyWith(
                color: isDark
                    ? AppColors.darkTextPrimary
                    : AppColors.lightTextPrimary,
              ),
            ),
            SizedBox(height: 20.h),
            AppButton(
              label: 'Retry',
              onPressed: () {
                ref.read(tutorialsControllerProvider.notifier).refresh();
              },
            ),
          ],
        ),
      ),
    );
  }
}
