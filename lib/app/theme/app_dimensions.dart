abstract class AppDimensions {
  // ══════════════════════════════════════════
  // SPACING
  // ══════════════════════════════════════════
  static const double space2 = 2.0; // Minimal spacing
  static const double space4 = 4.0; // Extra small spacing
  static const double space6 = 6.0; // Smaller spacing
  static const double space8 = 8.0; // Small spacing
  static const double space12 = 12.0; // Medium-small spacing
  static const double space16 = 16.0; // Default spacing
  static const double space20 = 20.0; // Default large spacing
  static const double space24 = 24.0; // Large spacing
  static const double space32 = 32.0; // Extra large spacing
  static const double space40 = 40.0; // Section spacing
  static const double space48 = 48.0; // Large section spacing
  static const double space64 = 64.0; // Extra large section spacing

  // ══════════════════════════════════════════
  // BORDER RADIUS
  // ══════════════════════════════════════════
  static const double radiusXS = 4.0; // Badges, small inputs
  static const double radiusSM = 8.0; // Buttons, small cards
  static const double radiusMD = 12.0; // Default cards
  static const double radiusLG = 16.0; // Dialogs, large cards
  static const double radiusXL = 24.0; // Bottom sheets
  static const double radiusFull = 999.0; // Pills, circular avatars

  // ══════════════════════════════════════════
  // ICON SIZES
  // ══════════════════════════════════════════
  static const double iconXS = 14.0; // Inline text icons
  static const double iconSM = 16.0; // Small decorative icons
  static const double iconMD = 20.0; // Default icons
  static const double iconLG = 24.0; // Prominent icons (AppBar)
  static const double iconXL = 32.0; // Large state icons
  static const double iconXXL = 48.0; // Empty state icons

  // ══════════════════════════════════════════
  // COMPONENT HEIGHTS
  // ══════════════════════════════════════════
  static const double buttonHeightSM = 36.0; // Small action buttons
  static const double buttonHeightMD = 48.0; // Default buttons
  static const double buttonHeightLG = 56.0; // Primary CTA buttons

  // ══════════════════════════════════════════
  // BOTTOM SHEET
  // ══════════════════════════════════════════
  static const double sheetHandleWidth = 32.0; // Drag handle width
  static const double sheetHandleHeight = 4.0; // Drag handle height
  static const double sheetBorderRadius = radiusXL; // Sheet top radius

  // ══════════════════════════════════════════
  // MAP DEFAULTS
  // ══════════════════════════════════════════
  static const double mapDefaultZoom = 14.0; // Standard city view
  static const double mapDriverZoom = 18.0; // Close up driver tracking
  static const double mapRouteZoom = 12.0; // Full route overview

  // ══════════════════════════════════════════
  // CARD DEFAULTS
  // ══════════════════════════════════════════
  static const double cardElevation = 0.0; // Flat premium design
  static const double cardBorderWidth = 1.0; // Subtle outline
  static const double cardPadding = space16; // Internal card padding

  // ══════════════════════════════════════════
  // INPUT FIELDS
  // ══════════════════════════════════════════
  static const double inputHeight = 56.0; // Standard tap target
  static const double inputBorderRadius = radiusSM; // Slightly rounded
  static const double inputPadding = space16; // Comfortable text padding

  // ══════════════════════════════════════════
  // ANIMATION DURATIONS
  // ══════════════════════════════════════════
  static const Duration durationFast = Duration(milliseconds: 150); // Micro-interactions
  static const Duration durationNormal = Duration(milliseconds: 250); // Standard transitions
  static const Duration durationSlow = Duration(milliseconds: 400); // Complex layout changes
  static const Duration durationPage = Duration(milliseconds: 300); // Page routing
}
