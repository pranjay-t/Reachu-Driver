import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'app_dimensions.dart';
import 'theme_extensions.dart';

abstract class AppTheme {
  // ══════════════════════════════════════════
  // DARK THEME (PRIMARY)
  // ══════════════════════════════════════════
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkSurface01,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary500,
        onPrimary: AppColors.darkTextInverse,
        secondary: AppColors.secondary500,
        onSecondary: AppColors.darkTextInverse,
        surface: AppColors.darkSurface02,
        onSurface: AppColors.darkTextPrimary,
        error: AppColors.errorDark,
        onError: AppColors.darkTextInverse,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkSurface01,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.darkTextPrimary),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        titleTextStyle: AppTextStyles.titleMedium.copyWith(color: AppColors.darkTextPrimary),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkSurface02,
        elevation: 16,
        selectedItemColor: AppColors.primary500,
        unselectedItemColor: AppColors.neutral500,
        selectedLabelStyle: AppTextStyles.labelSmall.copyWith(fontWeight: FontWeight.w600),
        unselectedLabelStyle: AppTextStyles.labelSmall,
        type: BottomNavigationBarType.fixed,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.darkSurface02,
        elevation: 0,
        indicatorColor: AppColors.primary500.withOpacity(0.2),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTextStyles.labelSmall.copyWith(color: AppColors.primary500, fontWeight: FontWeight.w600);
          }
          return AppTextStyles.labelSmall.copyWith(color: AppColors.neutral500);
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.primary500);
          }
          return const IconThemeData(color: AppColors.neutral500);
        }),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary500,
          foregroundColor: AppColors.darkTextInverse,
          disabledBackgroundColor: AppColors.neutral800,
          disabledForegroundColor: AppColors.neutral600,
          elevation: 0,
          textStyle: AppTextStyles.labelLarge,
          minimumSize: const Size.fromHeight(AppDimensions.buttonHeightLG),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
          ),
          padding: const EdgeInsets.symmetric(horizontal: AppDimensions.space24),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.darkTextPrimary,
          side: const BorderSide(color: AppColors.neutral700, width: 1.5),
          textStyle: AppTextStyles.labelLarge,
          minimumSize: const Size.fromHeight(AppDimensions.buttonHeightLG),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
          ),
          padding: const EdgeInsets.symmetric(horizontal: AppDimensions.space24),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary400,
          textStyle: AppTextStyles.labelLarge,
          minimumSize: const Size(0, AppDimensions.buttonHeightMD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
          ),
          padding: const EdgeInsets.symmetric(horizontal: AppDimensions.space16),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkSurface02,
        contentPadding: const EdgeInsets.all(AppDimensions.inputPadding),
        hintStyle: AppTextStyles.bodyLarge.copyWith(color: AppColors.neutral500),
        labelStyle: AppTextStyles.bodyLarge.copyWith(color: AppColors.neutral400),
        floatingLabelStyle: AppTextStyles.bodySmall.copyWith(color: AppColors.primary400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.inputBorderRadius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.inputBorderRadius),
          borderSide: const BorderSide(color: AppColors.neutral700, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.inputBorderRadius),
          borderSide: const BorderSide(color: AppColors.primary500, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.inputBorderRadius),
          borderSide: const BorderSide(color: AppColors.errorDark, width: 1),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.darkSurface02,
        elevation: 24,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(AppDimensions.sheetBorderRadius)),
        ),
        dragHandleColor: AppColors.neutral600,
      ),
      cardTheme: CardThemeData(
        color: AppColors.darkSurface02,
        elevation: AppDimensions.cardElevation,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
          side: const BorderSide(color: AppColors.neutral800, width: AppDimensions.cardBorderWidth),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.darkSurface02,
        disabledColor: AppColors.neutral800,
        selectedColor: AppColors.primary500.withOpacity(0.2),
        secondarySelectedColor: AppColors.primary500,
        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.space12, vertical: AppDimensions.space8),
        labelStyle: AppTextStyles.labelMedium,
        secondaryLabelStyle: AppTextStyles.labelMedium.copyWith(color: AppColors.primary400),
        brightness: Brightness.dark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
          side: const BorderSide(color: AppColors.neutral700, width: 1),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.darkDivider,
        thickness: 1,
        space: AppDimensions.space24,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.darkTextPrimary,
        size: AppDimensions.iconMD,
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.displayLarge,
        displayMedium: AppTextStyles.displayMedium,
        headlineLarge: AppTextStyles.headlineLarge,
        headlineMedium: AppTextStyles.headlineMedium,
        headlineSmall: AppTextStyles.headlineSmall,
        titleLarge: AppTextStyles.titleLarge,
        titleMedium: AppTextStyles.titleMedium,
        titleSmall: AppTextStyles.titleSmall,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
        labelLarge: AppTextStyles.labelLarge,
        labelMedium: AppTextStyles.labelMedium,
        labelSmall: AppTextStyles.labelSmall,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.darkTextInverse;
          return AppColors.neutral400;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.primary500;
          return AppColors.neutral800;
        }),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.primary500;
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(AppColors.darkTextInverse),
        side: const BorderSide(color: AppColors.neutral500, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimensions.radiusXS)),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.primary500;
          return AppColors.neutral500;
        }),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.darkSurface04,
        contentTextStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.darkTextPrimary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimensions.radiusSM)),
        behavior: SnackBarBehavior.floating,
        elevation: 8,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.darkSurface02,
        elevation: 24,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimensions.radiusLG)),
        titleTextStyle: AppTextStyles.titleLarge.copyWith(color: AppColors.darkTextPrimary),
        contentTextStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.darkTextSecondary),
      ),
      listTileTheme: ListTileThemeData(
        tileColor: Colors.transparent,
        contentPadding: const EdgeInsets.symmetric(horizontal: AppDimensions.space16, vertical: AppDimensions.space8),
        titleTextStyle: AppTextStyles.titleSmall.copyWith(color: AppColors.darkTextPrimary),
        subtitleTextStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.darkTextSecondary),
        iconColor: AppColors.darkTextPrimary,
      ),
      tabBarTheme: TabBarThemeData(
        indicatorColor: AppColors.primary500,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: AppColors.primary500,
        unselectedLabelColor: AppColors.neutral400,
        labelStyle: AppTextStyles.labelLarge,
        unselectedLabelStyle: AppTextStyles.labelLarge,
        dividerColor: AppColors.darkDivider,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary500,
        linearTrackColor: AppColors.neutral800,
        circularTrackColor: Colors.transparent,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.primary500,
        inactiveTrackColor: AppColors.neutral800,
        thumbColor: AppColors.primary500,
        overlayColor: AppColors.primary500.withOpacity(0.2),
        valueIndicatorTextStyle: AppTextStyles.labelMedium.copyWith(color: AppColors.darkTextInverse),
      ),
      extensions: [
        const RideThemeExtension(
          stateSearchingColor: AppColors.stateSearching,
          stateMatchedColor: AppColors.stateMatched,
          stateEnRouteColor: AppColors.stateEnRoute,
          stateArrivedColor: AppColors.stateArrived,
          stateInRideColor: AppColors.stateInRide,
          stateCompletedColor: AppColors.stateCompleted,
        ),
        const MapThemeExtension(
          polylineColor: AppColors.mapPolyline,
          driverMarkerColor: AppColors.mapDriverMarker,
          pickupPinColor: AppColors.mapPickupPin,
          dropPinColor: AppColors.mapDropPin,
          routeSurfaceColor: AppColors.mapRouteSurface,
        ),
        FareThemeExtension(
          fareDisplayTextStyle: AppTextStyles.displayMedium,
          currencySymbolStyle: AppTextStyles.headlineSmall.copyWith(color: AppColors.darkTextSecondary),
          discountColor: AppColors.successLight,
        ),
      ],
    );
  }

  // ══════════════════════════════════════════
  // LIGHT THEME (SECONDARY)
  // ══════════════════════════════════════════
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightSurface01,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary600,
        onPrimary: AppColors.lightTextInverse,
        secondary: AppColors.secondary500,
        onSecondary: AppColors.lightTextPrimary,
        surface: AppColors.lightSurface02,
        onSurface: AppColors.lightTextPrimary,
        error: AppColors.errorDark,
        onError: AppColors.lightTextInverse,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightSurface01,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.lightTextPrimary),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: AppTextStyles.titleMedium.copyWith(color: AppColors.lightTextPrimary),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.lightSurface00,
        elevation: 16,
        selectedItemColor: AppColors.primary600,
        unselectedItemColor: AppColors.neutral500,
        selectedLabelStyle: AppTextStyles.labelSmall.copyWith(fontWeight: FontWeight.w600),
        unselectedLabelStyle: AppTextStyles.labelSmall,
        type: BottomNavigationBarType.fixed,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.lightSurface00,
        elevation: 0,
        indicatorColor: AppColors.primary100,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTextStyles.labelSmall.copyWith(color: AppColors.primary600, fontWeight: FontWeight.w600);
          }
          return AppTextStyles.labelSmall.copyWith(color: AppColors.neutral600);
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.primary600);
          }
          return const IconThemeData(color: AppColors.neutral500);
        }),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary600,
          foregroundColor: AppColors.lightTextInverse,
          disabledBackgroundColor: AppColors.neutral300,
          disabledForegroundColor: AppColors.neutral500,
          elevation: 0,
          textStyle: AppTextStyles.labelLarge,
          minimumSize: const Size.fromHeight(AppDimensions.buttonHeightLG),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
          ),
          padding: const EdgeInsets.symmetric(horizontal: AppDimensions.space24),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.lightTextPrimary,
          side: const BorderSide(color: AppColors.neutral300, width: 1.5),
          textStyle: AppTextStyles.labelLarge,
          minimumSize: const Size.fromHeight(AppDimensions.buttonHeightLG),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
          ),
          padding: const EdgeInsets.symmetric(horizontal: AppDimensions.space24),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary600,
          textStyle: AppTextStyles.labelLarge,
          minimumSize: const Size(0, AppDimensions.buttonHeightMD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
          ),
          padding: const EdgeInsets.symmetric(horizontal: AppDimensions.space16),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightSurface02,
        contentPadding: const EdgeInsets.all(AppDimensions.inputPadding),
        hintStyle: AppTextStyles.bodyLarge.copyWith(color: AppColors.neutral400),
        labelStyle: AppTextStyles.bodyLarge.copyWith(color: AppColors.neutral500),
        floatingLabelStyle: AppTextStyles.bodySmall.copyWith(color: AppColors.primary600),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.inputBorderRadius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.inputBorderRadius),
          borderSide: const BorderSide(color: AppColors.neutral300, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.inputBorderRadius),
          borderSide: const BorderSide(color: AppColors.primary500, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.inputBorderRadius),
          borderSide: const BorderSide(color: AppColors.errorDark, width: 1),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.lightSurface00,
        elevation: 24,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(AppDimensions.sheetBorderRadius)),
        ),
        dragHandleColor: AppColors.neutral300,
      ),
      cardTheme: CardThemeData(
        color: AppColors.lightSurface00,
        elevation: AppDimensions.cardElevation,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
          side: const BorderSide(color: AppColors.neutral200, width: AppDimensions.cardBorderWidth),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.lightSurface02,
        disabledColor: AppColors.neutral200,
        selectedColor: AppColors.primary100,
        secondarySelectedColor: AppColors.primary600,
        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.space12, vertical: AppDimensions.space8),
        labelStyle: AppTextStyles.labelMedium.copyWith(color: AppColors.lightTextPrimary),
        secondaryLabelStyle: AppTextStyles.labelMedium.copyWith(color: AppColors.primary600),
        brightness: Brightness.light,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
          side: const BorderSide(color: AppColors.neutral300, width: 1),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.lightDivider,
        thickness: 1,
        space: AppDimensions.space24,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.lightTextPrimary,
        size: AppDimensions.iconMD,
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.displayLarge.copyWith(color: AppColors.lightTextPrimary),
        displayMedium: AppTextStyles.displayMedium.copyWith(color: AppColors.lightTextPrimary),
        headlineLarge: AppTextStyles.headlineLarge.copyWith(color: AppColors.lightTextPrimary),
        headlineMedium: AppTextStyles.headlineMedium.copyWith(color: AppColors.lightTextPrimary),
        headlineSmall: AppTextStyles.headlineSmall.copyWith(color: AppColors.lightTextPrimary),
        titleLarge: AppTextStyles.titleLarge.copyWith(color: AppColors.lightTextPrimary),
        titleMedium: AppTextStyles.titleMedium.copyWith(color: AppColors.lightTextPrimary),
        titleSmall: AppTextStyles.titleSmall.copyWith(color: AppColors.lightTextPrimary),
        bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.lightTextPrimary),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.lightTextPrimary),
        bodySmall: AppTextStyles.bodySmall.copyWith(color: AppColors.lightTextPrimary),
        labelLarge: AppTextStyles.labelLarge.copyWith(color: AppColors.lightTextPrimary),
        labelMedium: AppTextStyles.labelMedium.copyWith(color: AppColors.lightTextPrimary),
        labelSmall: AppTextStyles.labelSmall.copyWith(color: AppColors.lightTextPrimary),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.lightTextInverse;
          return AppColors.neutral500;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.primary600;
          return AppColors.neutral200;
        }),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.primary600;
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(AppColors.lightTextInverse),
        side: const BorderSide(color: AppColors.neutral400, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimensions.radiusXS)),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.primary600;
          return AppColors.neutral400;
        }),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.neutral900,
        contentTextStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.darkTextPrimary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimensions.radiusSM)),
        behavior: SnackBarBehavior.floating,
        elevation: 8,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.lightSurface00,
        elevation: 24,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimensions.radiusLG)),
        titleTextStyle: AppTextStyles.titleLarge.copyWith(color: AppColors.lightTextPrimary),
        contentTextStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.lightTextSecondary),
      ),
      listTileTheme: ListTileThemeData(
        tileColor: Colors.transparent,
        contentPadding: const EdgeInsets.symmetric(horizontal: AppDimensions.space16, vertical: AppDimensions.space8),
        titleTextStyle: AppTextStyles.titleSmall.copyWith(color: AppColors.lightTextPrimary),
        subtitleTextStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.lightTextSecondary),
        iconColor: AppColors.lightTextPrimary,
      ),
      tabBarTheme: TabBarThemeData(
        indicatorColor: AppColors.primary600,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: AppColors.primary600,
        unselectedLabelColor: AppColors.neutral500,
        labelStyle: AppTextStyles.labelLarge,
        unselectedLabelStyle: AppTextStyles.labelLarge,
        dividerColor: AppColors.lightDivider,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary600,
        linearTrackColor: AppColors.neutral200,
        circularTrackColor: Colors.transparent,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.primary600,
        inactiveTrackColor: AppColors.neutral200,
        thumbColor: AppColors.primary600,
        overlayColor: AppColors.primary600.withOpacity(0.2),
        valueIndicatorTextStyle: AppTextStyles.labelMedium.copyWith(color: AppColors.lightTextInverse),
      ),
      extensions: [
        const RideThemeExtension(
          stateSearchingColor: AppColors.stateSearching,
          stateMatchedColor: AppColors.stateMatched,
          stateEnRouteColor: AppColors.stateEnRoute,
          stateArrivedColor: AppColors.stateArrived,
          stateInRideColor: AppColors.stateInRide,
          stateCompletedColor: AppColors.stateCompleted,
        ),
        const MapThemeExtension(
          polylineColor: AppColors.mapPolyline,
          driverMarkerColor: AppColors.mapDriverMarker,
          pickupPinColor: AppColors.neutral900,
          dropPinColor: AppColors.errorDark,
          routeSurfaceColor: AppColors.mapRouteSurface,
        ),
        FareThemeExtension(
          fareDisplayTextStyle: AppTextStyles.displayMedium.copyWith(color: AppColors.lightTextPrimary),
          currencySymbolStyle: AppTextStyles.headlineSmall.copyWith(color: AppColors.lightTextSecondary),
          discountColor: AppColors.successDark,
        ),
      ],
    );
  }
}
