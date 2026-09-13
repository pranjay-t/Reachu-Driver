import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/localization/locale_provider.dart';
import '../../../shared/widgets/app_cached_image.dart';
import '../models/rating_models.dart';
import '../providers/profile_controller.dart';
import '../providers/rating_controller.dart';

class RatingScreen extends ConsumerWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = context.l10n;
    final ratingState = ref.watch(ratingControllerProvider);
    final profileState = ref.watch(profileControllerProvider);

    final driver = profileState.asData?.value;
    final driverName = driver?.name ?? 'Driver';
    final driverImage = driver?.image;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkSurface01 : AppColors.lightSurface01,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: isDark ? AppColors.darkSurface01 : AppColors.lightSurface01,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            size: 24.sp,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          l10n.reviewAndRating,
          style: AppTextStyles.titleMedium.copyWith(
            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.primary500,
          onRefresh: () async {
            await ref.read(ratingControllerProvider.notifier).refreshRatings();
          },
          child: ratingState.when(
            data: (reviews) {
              final avgRating = reviews.averageRating;
              final totalReviews = reviews.length;

              return CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                slivers: [
                  // Top Hero Rating Summary Section
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                      child: _buildHeroRatingCard(
                        context,
                        isDark: isDark,
                        driverName: driverName,
                        driverImage: driverImage,
                        avgRating: avgRating,
                        totalReviews: totalReviews,
                        l10n: l10n,
                      ).animate().slideY(
                        begin: -0.1,
                        end: 0,
                        duration: 350.ms,
                        curve: Curves.easeOutCubic,
                      ).fade(duration: 350.ms),
                    ),
                  ),

                  // Section Header
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            l10n.reviewAndRating,
                            style: AppTextStyles.titleSmall.copyWith(
                              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: AppColors.primary500.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Text(
                              '$totalReviews',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.primary500,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Reviews List or Empty State
                  if (reviews.isEmpty)
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: _buildEmptyState(context, isDark: isDark, l10n: l10n),
                    )
                  else
                    SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final review = reviews[index];
                            return _buildReviewCard(
                              context,
                              review: review,
                              isDark: isDark,
                              l10n: l10n,
                            ).animate().slideY(
                              begin: 0.15,
                              end: 0,
                              delay: Duration(milliseconds: 50 * index),
                              duration: 300.ms,
                              curve: Curves.easeOutCubic,
                            ).fade(
                              delay: Duration(milliseconds: 50 * index),
                              duration: 300.ms,
                            );
                          },
                          childCount: reviews.length,
                        ),
                      ),
                    ),

                  SliverToBoxAdapter(child: SizedBox(height: 24.h)),
                ],
              );
            },
            loading: () => _buildShimmerSkeleton(isDark: isDark),
            error: (err, stack) => _buildErrorState(
              context,
              error: err.toString(),
              isDark: isDark,
              onRetry: () => ref.read(ratingControllerProvider.notifier).refreshRatings(),
            ),
          ),
        ),
      ),
    );
  }

  // Modern Hero Card displaying overall Driver Rating info
  Widget _buildHeroRatingCard(
    BuildContext context, {
    required bool isDark,
    required String driverName,
    String? driverImage,
    required double avgRating,
    required int totalReviews,
    required dynamic l10n,
  }) {
    final ratingDisplay = avgRating > 0 ? avgRating.toStringAsFixed(1) : "0.0";

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [
                  AppColors.primary700,
                  AppColors.primary900,
                ]
              : [
                  AppColors.primary500,
                  AppColors.primary700,
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary500.withValues(alpha: 0.25),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: EdgeInsets.all(20.w),
      child: Row(
        children: [
          // Left side: Driver Avatar & Name
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 56.w,
                  height: 56.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2.w,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: (driverImage != null && driverImage.isNotEmpty)
                      ? AppCachedImage(
                          imageUrl: driverImage,
                          width: 56.w,
                          height: 56.w,
                          borderRadius: BorderRadius.circular(28.r),
                        )
                      : CircleAvatar(
                          backgroundColor: Colors.white24,
                          child: Icon(
                            Icons.person_rounded,
                            size: 28.sp,
                            color: Colors.white,
                          ),
                        ),
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        driverName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.titleMedium.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        totalReviews > 0
                            ? l10n.ratedByCustomers(totalReviews)
                            : l10n.noRatingsYet,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.white.withValues(alpha: 0.85),
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 12.w),

          // Right side: Glassmorphic Rating Badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(18.r),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.25),
                width: 1,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      ratingDisplay,
                      style: AppTextStyles.headlineSmall.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 22.sp,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                      size: 24.sp,
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (index) {
                    final ratingVal = avgRating;
                    return Icon(
                      index < ratingVal.floor()
                          ? Icons.star_rounded
                          : (index < ratingVal
                              ? Icons.star_half_rounded
                              : Icons.star_outline_rounded),
                      color: Colors.amber,
                      size: 14.sp,
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Modern Card for Individual Reviews
  Widget _buildReviewCard(
    BuildContext context, {
    required ReviewRating review,
    required bool isDark,
    required dynamic l10n,
  }) {
    final user = review.user;
    final userName = (user?.name != null && user!.name!.isNotEmpty)
        ? user.name!
        : l10n.customer;
    final userImage = user?.image;
    final ratingScore = review.rating ?? 0;
    final comment = (review.experienceDescription != null &&
            review.experienceDescription!.trim().isNotEmpty)
        ? review.experienceDescription!
        : l10n.noCommentProvided;

    final badgeInfo = _getRatingBadgeInfo(ratingScore, l10n);

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface02 : Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: (isDark ? AppColors.neutral800 : AppColors.neutral200).withValues(alpha: 0.5),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row 1: Customer Info & Rating Badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Customer Avatar
              Container(
                width: 42.w,
                height: 42.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark ? AppColors.neutral800 : AppColors.neutral200,
                ),
                child: (userImage != null && userImage.isNotEmpty)
                    ? AppCachedImage(
                        imageUrl: userImage,
                        width: 42.w,
                        height: 42.w,
                        borderRadius: BorderRadius.circular(21.r),
                      )
                    : Center(
                        child: Text(
                          userName.isNotEmpty ? userName[0].toUpperCase() : 'C',
                          style: AppTextStyles.titleSmall.copyWith(
                            color: AppColors.primary500,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ),
              SizedBox(width: 12.w),

              // Name & Stars
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          Icons.star_rounded,
                          color: index < ratingScore ? Colors.amber : (isDark ? AppColors.neutral700 : AppColors.neutral300),
                          size: 16.sp,
                        );
                      }),
                    ),
                  ],
                ),
              ),

              // Rating Pill Badge
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: badgeInfo.color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: badgeInfo.color.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Text(
                  badgeInfo.text,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: badgeInfo.color,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.sp,
                  ),
                ),
              ),
            ],
          ),

          if (comment.isNotEmpty) ...[
            SizedBox(height: 12.h),
            // Comment Text Container
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: (isDark ? AppColors.darkSurface01 : AppColors.lightSurface02).withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                comment,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                  fontSize: 13.sp,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  // Helper method to get rating badge info
  _RatingBadge _getRatingBadgeInfo(int rating, dynamic l10n) {
    if (rating >= 4) {
      return _RatingBadge(text: l10n.ratingExcellent, color: AppColors.successDark);
    } else if (rating >= 3) {
      return _RatingBadge(text: l10n.ratingGood, color: AppColors.infoDark);
    } else if (rating >= 2) {
      return _RatingBadge(text: l10n.ratingAverage, color: AppColors.warningDark);
    } else if (rating >= 1) {
      return _RatingBadge(text: l10n.ratingBelowAverage, color: Colors.orange);
    } else {
      return _RatingBadge(text: l10n.ratingPoor, color: AppColors.errorDark);
    }
  }

  // Wowed Empty State Widget
  Widget _buildEmptyState(BuildContext context, {required bool isDark, required dynamic l10n}) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 90.w,
              height: 90.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary500.withValues(alpha: 0.1),
              ),
              child: Icon(
                Icons.rate_review_outlined,
                color: AppColors.primary500,
                size: 44.sp,
              ),
            ).animate().scale(duration: 400.ms, curve: Curves.easeOutBack),
            SizedBox(height: 20.h),
            Text(
              l10n.noReviewsYet,
              textAlign: TextAlign.center,
              style: AppTextStyles.titleMedium.copyWith(
                color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              l10n.noReviewsDesc,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium.copyWith(
                color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Skeleton Loading Shimmer
  Widget _buildShimmerSkeleton({required bool isDark}) {
    final baseColor = isDark ? AppColors.neutral800 : AppColors.neutral200;
    final highlightColor = isDark ? AppColors.neutral700 : AppColors.neutral100;

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Column(
          children: [
            Container(
              height: 110.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.r),
              ),
            ),
            SizedBox(height: 24.h),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) => Container(
                  height: 100.h,
                  margin: EdgeInsets.only(bottom: 12.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Error State Widget
  Widget _buildErrorState(
    BuildContext context, {
    required String error,
    required bool isDark,
    required VoidCallback onRetry,
  }) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
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
              error,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium.copyWith(
                color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
              ),
            ),
            SizedBox(height: 20.h),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text("Retry"),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary500,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RatingBadge {
  final String text;
  final Color color;

  _RatingBadge({required this.text, required this.color});
}
