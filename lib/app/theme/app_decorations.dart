import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_dimensions.dart';
import '../../shared/models/ride_status.dart'; // Requires enum RideStatus to be defined

abstract class AppDecorations {
  // ══════════════════════════════════════════
  // CARD DECORATION
  // ══════════════════════════════════════════
  static BoxDecoration cardDecoration(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
      color: isDark ? AppColors.darkSurface02 : AppColors.lightSurface00,
      borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
      border: Border.all(
        color: isDark ? AppColors.neutral800 : AppColors.neutral200,
        width: AppDimensions.cardBorderWidth,
      ),
    );
  }

  // ══════════════════════════════════════════
  // SHEET DECORATION
  // ══════════════════════════════════════════
  static BoxDecoration sheetDecoration(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
      color: isDark ? AppColors.darkSurface02 : AppColors.lightSurface00,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(AppDimensions.sheetBorderRadius)),
      boxShadow: [
        BoxShadow(
          color: isDark ? Colors.black.withOpacity(0.4) : Colors.black.withOpacity(0.05),
          blurRadius: 24,
          offset: const Offset(0, -4),
        )
      ],
    );
  }

  // ══════════════════════════════════════════
  // GLASS DECORATION
  // ══════════════════════════════════════════
  static BoxDecoration glassDecoration(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
      color: isDark ? AppColors.darkSurface02.withOpacity(0.85) : AppColors.lightSurface00.withOpacity(0.85),
      borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
      border: Border.all(
        color: isDark ? AppColors.neutral700.withOpacity(0.5) : AppColors.neutral200.withOpacity(0.5),
        width: 1,
      ),
    );
  }

  // ══════════════════════════════════════════
  // SEARCH BAR DECORATION
  // ══════════════════════════════════════════
  static BoxDecoration searchBarDecoration(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
      color: isDark ? AppColors.darkSurface03 : AppColors.lightSurface02,
      borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
    );
  }

  // ══════════════════════════════════════════
  // INPUT DECORATION
  // ══════════════════════════════════════════
  static BoxDecoration inputDecoration(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
      color: isDark ? AppColors.darkSurface02 : AppColors.lightSurface02,
      borderRadius: BorderRadius.circular(AppDimensions.inputBorderRadius),
      border: Border.all(
        color: isDark ? AppColors.neutral700 : AppColors.neutral300,
        width: 1,
      ),
    );
  }

  // ══════════════════════════════════════════
  // RIDE STATE BADGE DECORATION
  // ══════════════════════════════════════════
  static BoxDecoration rideStateBadgeDecoration(RideStatus status) {
    Color bgColor;
    Color borderColor;

    switch (status) {
      case RideStatus.searching:
        bgColor = AppColors.stateSearching.withOpacity(0.1);
        borderColor = AppColors.stateSearching.withOpacity(0.3);
        break;
      case RideStatus.matched:
        bgColor = AppColors.stateMatched.withOpacity(0.1);
        borderColor = AppColors.stateMatched.withOpacity(0.3);
        break;
      case RideStatus.driverEnRoute:
        bgColor = AppColors.stateEnRoute.withOpacity(0.1);
        borderColor = AppColors.stateEnRoute.withOpacity(0.3);
        break;
      case RideStatus.driverArrived:
        bgColor = AppColors.stateArrived.withOpacity(0.1);
        borderColor = AppColors.stateArrived.withOpacity(0.3);
        break;
      case RideStatus.inRide:
        bgColor = AppColors.stateInRide.withOpacity(0.1);
        borderColor = AppColors.stateInRide.withOpacity(0.3);
        break;
      case RideStatus.completed:
      case RideStatus.rated:
        bgColor = AppColors.stateCompleted.withOpacity(0.1);
        borderColor = AppColors.stateCompleted.withOpacity(0.3);
        break;
      case RideStatus.idle:
      default:
        bgColor = AppColors.neutral800.withOpacity(0.5);
        borderColor = AppColors.neutral700;
        break;
    }

    return BoxDecoration(
      color: bgColor,
      border: Border.all(color: borderColor, width: 1),
      borderRadius: BorderRadius.circular(AppDimensions.radiusXS),
    );
  }

  // ══════════════════════════════════════════
  // FARE CARD DECORATION
  // ══════════════════════════════════════════
  static BoxDecoration fareCardDecoration(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
      color: isDark ? AppColors.darkSurface03 : AppColors.lightSurface00,
      borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
      border: Border.all(color: AppColors.primary500.withOpacity(0.5), width: 1.5),
      boxShadow: [
        BoxShadow(
          color: AppColors.primary500.withOpacity(0.1),
          blurRadius: 16,
          offset: const Offset(0, 4),
        )
      ],
    );
  }

  // ══════════════════════════════════════════
  // SELECTED TILE DECORATION
  // ══════════════════════════════════════════
  static BoxDecoration selectedTileDecoration(BuildContext context) {
    return BoxDecoration(
      color: AppColors.primary500.withOpacity(0.1),
      borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
      border: Border.all(color: AppColors.primary500, width: 1.5),
    );
  }
}
