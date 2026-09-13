import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppShadows {
  // ══════════════════════════════════════════
  // NO SHADOW
  // ══════════════════════════════════════════
  static const List<BoxShadow> shadowNone = [];

  // ══════════════════════════════════════════
  // SMALL SHADOW (Subtle lift)
  // ══════════════════════════════════════════
  static List<BoxShadow> shadowSM(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return [
      BoxShadow(
        color: isDark ? AppColors.primary500.withOpacity(0.02) : Colors.black.withOpacity(0.04),
        blurRadius: 4,
        offset: const Offset(0, 2),
      )
    ];
  }

  // ══════════════════════════════════════════
  // MEDIUM SHADOW (Card elevation)
  // ══════════════════════════════════════════
  static List<BoxShadow> shadowMD(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return [
      BoxShadow(
        color: isDark ? AppColors.primary500.withOpacity(0.03) : Colors.black.withOpacity(0.08),
        blurRadius: 8,
        offset: const Offset(0, 4),
      )
    ];
  }

  // ══════════════════════════════════════════
  // LARGE SHADOW (Bottom sheets, floating panels)
  // ══════════════════════════════════════════
  static List<BoxShadow> shadowLG(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return [
      BoxShadow(
        color: isDark ? AppColors.primary500.withOpacity(0.04) : Colors.black.withOpacity(0.12),
        blurRadius: 24,
        offset: const Offset(0, 8),
      )
    ];
  }

  // ══════════════════════════════════════════
  // MAP SHADOW (Floating overlays on map)
  // ══════════════════════════════════════════
  static List<BoxShadow> shadowMap(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return [
      BoxShadow(
        color: isDark ? Colors.black.withOpacity(0.4) : Colors.black.withOpacity(0.15),
        blurRadius: 16,
        offset: const Offset(0, 4),
      )
    ];
  }
}
