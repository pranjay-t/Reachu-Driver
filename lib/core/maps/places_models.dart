import 'package:freezed_annotation/freezed_annotation.dart';

part 'places_models.freezed.dart';

@freezed
abstract class PlaceAutocompleteResult with _$PlaceAutocompleteResult {
  const PlaceAutocompleteResult._();
  const factory PlaceAutocompleteResult({
    required String placeId,
    required String primaryText,
    required String secondaryText,
    required String fullText,
  }) = _PlaceAutocompleteResult;

  factory PlaceAutocompleteResult.fromJson(Map<String, dynamic> json) {
    final prediction = json['placePrediction'] as Map<String, dynamic>? ?? {};
    final structuredFormat = prediction['structuredFormat'] as Map<String, dynamic>? ?? {};
    final mainText = structuredFormat['mainText'] as Map<String, dynamic>? ?? {};
    final secondaryText = structuredFormat['secondaryText'] as Map<String, dynamic>? ?? {};
    final text = prediction['text'] as Map<String, dynamic>? ?? {};

    return PlaceAutocompleteResult(
      placeId: prediction['placeId'] as String? ?? '',
      primaryText: mainText['text'] as String? ?? '',
      secondaryText: secondaryText['text'] as String? ?? '',
      fullText: text['text'] as String? ?? '',
    );
  }
}

@freezed
abstract class PlaceDetails with _$PlaceDetails {
  const PlaceDetails._();
  const factory PlaceDetails({
    required String placeId,
    required String name,
    required String formattedAddress,
    required double latitude,
    required double longitude,
  }) = _PlaceDetails;

  factory PlaceDetails.fromJson(Map<String, dynamic> json) {
    final location = json['location'] as Map<String, dynamic>? ?? {};
    final displayName = json['displayName'] as Map<String, dynamic>? ?? {};
    
    return PlaceDetails(
      placeId: json['id'] as String? ?? '',
      name: displayName['text'] as String? ?? '',
      formattedAddress: json['formattedAddress'] as String? ?? '',
      latitude: (location['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (location['longitude'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
