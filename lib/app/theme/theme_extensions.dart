import 'package:flutter/material.dart';

// ══════════════════════════════════════════
// RIDE THEME EXTENSION
// ══════════════════════════════════════════
class RideThemeExtension extends ThemeExtension<RideThemeExtension> {
  final Color stateSearchingColor;
  final Color stateMatchedColor;
  final Color stateEnRouteColor;
  final Color stateArrivedColor;
  final Color stateInRideColor;
  final Color stateCompletedColor;

  const RideThemeExtension({
    required this.stateSearchingColor,
    required this.stateMatchedColor,
    required this.stateEnRouteColor,
    required this.stateArrivedColor,
    required this.stateInRideColor,
    required this.stateCompletedColor,
  });

  @override
  ThemeExtension<RideThemeExtension> copyWith({
    Color? stateSearchingColor,
    Color? stateMatchedColor,
    Color? stateEnRouteColor,
    Color? stateArrivedColor,
    Color? stateInRideColor,
    Color? stateCompletedColor,
  }) {
    return RideThemeExtension(
      stateSearchingColor: stateSearchingColor ?? this.stateSearchingColor,
      stateMatchedColor: stateMatchedColor ?? this.stateMatchedColor,
      stateEnRouteColor: stateEnRouteColor ?? this.stateEnRouteColor,
      stateArrivedColor: stateArrivedColor ?? this.stateArrivedColor,
      stateInRideColor: stateInRideColor ?? this.stateInRideColor,
      stateCompletedColor: stateCompletedColor ?? this.stateCompletedColor,
    );
  }

  @override
  ThemeExtension<RideThemeExtension> lerp(ThemeExtension<RideThemeExtension>? other, double t) {
    if (other is! RideThemeExtension) return this;
    return RideThemeExtension(
      stateSearchingColor: Color.lerp(stateSearchingColor, other.stateSearchingColor, t)!,
      stateMatchedColor: Color.lerp(stateMatchedColor, other.stateMatchedColor, t)!,
      stateEnRouteColor: Color.lerp(stateEnRouteColor, other.stateEnRouteColor, t)!,
      stateArrivedColor: Color.lerp(stateArrivedColor, other.stateArrivedColor, t)!,
      stateInRideColor: Color.lerp(stateInRideColor, other.stateInRideColor, t)!,
      stateCompletedColor: Color.lerp(stateCompletedColor, other.stateCompletedColor, t)!,
    );
  }
}

// ══════════════════════════════════════════
// MAP THEME EXTENSION
// ══════════════════════════════════════════
class MapThemeExtension extends ThemeExtension<MapThemeExtension> {
  final Color polylineColor;
  final Color driverMarkerColor;
  final Color pickupPinColor;
  final Color dropPinColor;
  final Color routeSurfaceColor;

  const MapThemeExtension({
    required this.polylineColor,
    required this.driverMarkerColor,
    required this.pickupPinColor,
    required this.dropPinColor,
    required this.routeSurfaceColor,
  });

  @override
  ThemeExtension<MapThemeExtension> copyWith({
    Color? polylineColor,
    Color? driverMarkerColor,
    Color? pickupPinColor,
    Color? dropPinColor,
    Color? routeSurfaceColor,
  }) {
    return MapThemeExtension(
      polylineColor: polylineColor ?? this.polylineColor,
      driverMarkerColor: driverMarkerColor ?? this.driverMarkerColor,
      pickupPinColor: pickupPinColor ?? this.pickupPinColor,
      dropPinColor: dropPinColor ?? this.dropPinColor,
      routeSurfaceColor: routeSurfaceColor ?? this.routeSurfaceColor,
    );
  }

  @override
  ThemeExtension<MapThemeExtension> lerp(ThemeExtension<MapThemeExtension>? other, double t) {
    if (other is! MapThemeExtension) return this;
    return MapThemeExtension(
      polylineColor: Color.lerp(polylineColor, other.polylineColor, t)!,
      driverMarkerColor: Color.lerp(driverMarkerColor, other.driverMarkerColor, t)!,
      pickupPinColor: Color.lerp(pickupPinColor, other.pickupPinColor, t)!,
      dropPinColor: Color.lerp(dropPinColor, other.dropPinColor, t)!,
      routeSurfaceColor: Color.lerp(routeSurfaceColor, other.routeSurfaceColor, t)!,
    );
  }
}

// ══════════════════════════════════════════
// FARE THEME EXTENSION
// ══════════════════════════════════════════
class FareThemeExtension extends ThemeExtension<FareThemeExtension> {
  final TextStyle fareDisplayTextStyle;
  final TextStyle currencySymbolStyle;
  final Color discountColor;

  const FareThemeExtension({
    required this.fareDisplayTextStyle,
    required this.currencySymbolStyle,
    required this.discountColor,
  });

  @override
  ThemeExtension<FareThemeExtension> copyWith({
    TextStyle? fareDisplayTextStyle,
    TextStyle? currencySymbolStyle,
    Color? discountColor,
  }) {
    return FareThemeExtension(
      fareDisplayTextStyle: fareDisplayTextStyle ?? this.fareDisplayTextStyle,
      currencySymbolStyle: currencySymbolStyle ?? this.currencySymbolStyle,
      discountColor: discountColor ?? this.discountColor,
    );
  }

  @override
  ThemeExtension<FareThemeExtension> lerp(ThemeExtension<FareThemeExtension>? other, double t) {
    if (other is! FareThemeExtension) return this;
    return FareThemeExtension(
      fareDisplayTextStyle: TextStyle.lerp(fareDisplayTextStyle, other.fareDisplayTextStyle, t)!,
      currencySymbolStyle: TextStyle.lerp(currencySymbolStyle, other.currencySymbolStyle, t)!,
      discountColor: Color.lerp(discountColor, other.discountColor, t)!,
    );
  }
}
