import 'package:flutter/material.dart';

abstract class AppColors {
  // ══════════════════════════════════════════
  // NEUTRAL SCALE
  // ══════════════════════════════════════════
  static const Color neutral50 = Color(0xFFFAFAFA); // Lightest background
  static const Color neutral100 = Color(0xFFF4F4F5); // Light surface
  static const Color neutral200 = Color(
    0xFFE4E4E7,
  ); // Borders / dividers (light)
  static const Color neutral300 = Color(
    0xFFD4D4D8,
  ); // Disabled elements (light)
  static const Color neutral400 = Color(0xFFA1A1AA); // Subtle text (light)
  static const Color neutral500 = Color(0xFF71717A); // Secondary text
  static const Color neutral600 = Color(0xFF52525B); // Muted dark
  static const Color neutral700 = Color(0xFF3F3F46); // Disabled elements (dark)
  static const Color neutral800 = Color(0xFF27272A); // Elevated surface (dark)
  static const Color neutral900 = Color(0xFF18181B); // Base surface (dark)
  static const Color neutral950 = Color(
    0xFF000000,
  ); // Deepest background (dark/pure black)

  // ══════════════════════════════════════════
  // PRIMARY SCALE: Vibrant Red (#FF4D4D family)
  // ══════════════════════════════════════════
  static const Color primary50 = Color(
    0xFFFFF5F5,
  ); // Lightest primary (light mode background)
  static const Color primary100 = Color(0xFFFFE3E3); // Light primary surface
  static const Color primary200 = Color(
    0xFFFFC9C9,
  ); // Primary border / subtle active
  static const Color primary300 = Color(0xFFFFA3A3); // Muted primary indicator
  static const Color primary400 = Color(
    0xFFFF7B7B,
  ); // Active element (dark mode)
  static const Color primary500 = Color(0xFFFF4D4D); // Primary brand color
  static const Color primary600 = Color(0xFFE70211); // Primary CTA (light mode)
  static const Color primary700 = Color(0xFFC2010E); // Hover state (light mode)
  static const Color primary800 = Color(0xFF9C010B); // Deep primary
  static const Color primary900 = Color(0xFF780008); // Darkest primary surface

  // ══════════════════════════════════════════
  // SECONDARY SCALE: Vibrant Yellow/Gold (#FFC800 family)
  // ══════════════════════════════════════════
  static const Color secondary50 = Color(0xFFFFFDF0); // Lightest secondary
  static const Color secondary100 = Color(
    0xFFFFF9C4,
  ); // Light secondary surface
  static const Color secondary200 = Color(0xFFFFF59D); // Secondary border
  static const Color secondary300 = Color(
    0xFFFFF176,
  ); // Muted secondary indicator
  static const Color secondary400 = Color(0xFFFFEE58); // Lighter secondary
  static const Color secondary500 = Color(
    0xFFFFC800,
  ); // Secondary brand color / accent
  static const Color secondary600 = Color(0xFFE0A800); // Secondary CTA / text
  static const Color secondary700 = Color(0xFFC28E00); // Hover state
  static const Color secondary800 = Color(0xFFA37400); // Deep secondary
  static const Color secondary900 = Color(
    0xFF855A00,
  ); // Darkest secondary surface

  // ══════════════════════════════════════════
  // SEMANTIC COLORS
  // ══════════════════════════════════════════
  static const Color successLight = Color(0xFF34D399); // Success text/icon
  static const Color successDark = Color(0xFF059669); // Success heavy
  static const Color successSurface = Color(0xFF064E3B); // Success background

  static const Color warningLight = Color(0xFFFBBF24); // Warning text/icon
  static const Color warningDark = Color(0xFFD97706); // Warning heavy
  static const Color warningSurface = Color(0xFF78350F); // Warning background

  static const Color errorLight = Color(0xFFF87171); // Error text/icon
  static const Color errorDark = Color(0xFFDC2626); // Error heavy
  static const Color errorSurface = Color(0xFF7F1D1D); // Error background

  static const Color infoLight = Color(0xFF38BDF8); // Info text/icon
  static const Color infoDark = Color(0xFF0284C7); // Info heavy
  static const Color infoSurface = Color(0xFF0C4A6E); // Info background

  // ══════════════════════════════════════════
  // MAP COLORS
  // ══════════════════════════════════════════
  static const Color mapPolyline = Color(0xFF2563EB); // Route color
  static const Color pickupColor = Color(0xFF10B981); // Driver current location
  static const Color mapDriverMarker =
      pickupColor; // Driver current location alias
  static const Color mapPickupPin = neutral900; // Pickup marker
  static const Color dropColor = errorDark; // Drop-off marker
  static const Color mapDropPin = dropColor; // Drop-off marker alias
  static const Color mapRouteSurface = Color(
    0x33FF4D4D,
  ); // Transparent route bounding box

  // ══════════════════════════════════════════
  // RIDE STATE COLORS
  // ══════════════════════════════════════════
  static const Color stateSearching = primary400; // Pulsing search state
  static const Color stateMatched = successLight; // Driver found
  static const Color stateEnRoute = infoLight; // Driver on the way
  static const Color stateArrived = warningLight; // Driver waiting
  static const Color stateInRide = primary500; // Trip in progress
  static const Color stateCompleted = successDark; // Trip finished

  // ══════════════════════════════════════════
  // SURFACE HIERARCHY (DARK)
  // ══════════════════════════════════════════
  static const Color darkSurface00 = Color(0xFF000000); // Deepest background
  static const Color darkSurface01 = Color(0xFF000000); // Default scaffold
  static const Color darkSurface02 = Color(0xFF121214); // Cards and sheets
  static const Color darkSurface03 = Color(0xFF1C1C1E); // Elevated panels
  static const Color darkSurface04 = Color(
    0xFF2C2C2E,
  ); // Highest elevation/popups

  // ══════════════════════════════════════════
  // SURFACE HIERARCHY (LIGHT)
  // ══════════════════════════════════════════
  static const Color lightSurface00 = Color(
    0xFFFFFFFF,
  ); // Highest elevation/sheets
  static const Color lightSurface01 = neutral50; // Default scaffold
  static const Color lightSurface02 = neutral100; // Default card
  static const Color lightSurface03 = neutral200; // Elevated card
  static const Color lightSurface04 = neutral300; // Highest inset/wells

  // ══════════════════════════════════════════
  // TEXT HIERARCHY (DARK)
  // ══════════════════════════════════════════
  static const Color darkTextPrimary = neutral50; // Main headings/body
  static const Color darkTextSecondary = neutral400; // Subtitles/captions
  static const Color darkTextTertiary = neutral500; // Meta text
  static const Color darkTextDisabled = neutral600; // Disabled labels
  static const Color darkTextInverse = neutral950; // Text on primary buttons

  // ══════════════════════════════════════════
  // TEXT HIERARCHY (LIGHT)
  // ══════════════════════════════════════════
  static const Color lightTextPrimary = Color(0xFF000000); // Main headings/body
  static const Color lightTextSecondary = neutral600; // Subtitles/captions
  static const Color lightTextTertiary = neutral500; // Meta text
  static const Color lightTextDisabled = neutral300; // Disabled labels
  static const Color lightTextInverse = Color(
    0xFFFFFFFF,
  ); // Text on primary buttons

  // ══════════════════════════════════════════
  // UTILITY COLORS
  // ══════════════════════════════════════════
  static const Color darkDivider = neutral800; // Standard dark border
  static const Color lightDivider = neutral200; // Standard light border
  static const Color darkOverlay = Color(0x80000000); // Modal backdrop
  static const Color lightOverlay = Color(0x4D000000); // Modal backdrop
  static const Color shimmerBase = neutral800; // Skeleton loading base
  static const Color shimmerHighlight =
      neutral700; // Skeleton loading highlight
}
