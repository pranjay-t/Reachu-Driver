import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

abstract class AppTextStyles {
  // ══════════════════════════════════════════
  // DISPLAY / HERO
  // ══════════════════════════════════════════
  static TextStyle get displayLarge => GoogleFonts.inter(
        fontSize: 48,
        fontWeight: FontWeight.w700,
        letterSpacing: -1.0,
        height: 1.1,
        color: AppColors.darkTextPrimary,
      );

  static TextStyle get displayMedium => GoogleFonts.inter(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
        height: 1.15,
        color: AppColors.darkTextPrimary,
      );

  // ══════════════════════════════════════════
  // HEADLINES
  // ══════════════════════════════════════════
  static TextStyle get headlineLarge => GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
        height: 1.2,
        color: AppColors.darkTextPrimary,
      );

  static TextStyle get headlineMedium => GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.25,
        height: 1.25,
        color: AppColors.darkTextPrimary,
      );

  static TextStyle get headlineSmall => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.3,
        color: AppColors.darkTextPrimary,
      );

  // ══════════════════════════════════════════
  // TITLES
  // ══════════════════════════════════════════
  static TextStyle get titleLarge => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.4,
        color: AppColors.darkTextPrimary,
      );

  static TextStyle get titleMedium => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        height: 1.4,
        color: AppColors.darkTextPrimary,
      );

  static TextStyle get titleSmall => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        height: 1.4,
        color: AppColors.darkTextPrimary,
      );

  // ══════════════════════════════════════════
  // BODY
  // ══════════════════════════════════════════
  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        height: 1.5,
        color: AppColors.darkTextPrimary,
      );

  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        height: 1.5,
        color: AppColors.darkTextPrimary,
      );

  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        height: 1.5,
        color: AppColors.darkTextPrimary,
      );

  // ══════════════════════════════════════════
  // LABELS (Buttons, chips)
  // ══════════════════════════════════════════
  static TextStyle get labelLarge => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        height: 1.4,
        color: AppColors.darkTextPrimary,
      );

  static TextStyle get labelMedium => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        height: 1.4,
        color: AppColors.darkTextPrimary,
      );

  static TextStyle get labelSmall => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        height: 1.4,
        color: AppColors.darkTextPrimary,
      );

  // ══════════════════════════════════════════
  // MONOSPACE (Numbers, fares, times)
  // ══════════════════════════════════════════
  static TextStyle get monoLarge => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.2,
        color: AppColors.darkTextPrimary,
        fontFeatures: const [FontFeature.tabularFigures()],
      );

  static TextStyle get monoMedium => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
        height: 1.2,
        color: AppColors.darkTextPrimary,
        fontFeatures: const [FontFeature.tabularFigures()],
      );
}
