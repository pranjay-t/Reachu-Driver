// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(placesService)
final placesServiceProvider = PlacesServiceProvider._();

final class PlacesServiceProvider
    extends $FunctionalProvider<PlacesService, PlacesService, PlacesService>
    with $Provider<PlacesService> {
  PlacesServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'placesServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$placesServiceHash();

  @$internal
  @override
  $ProviderElement<PlacesService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PlacesService create(Ref ref) {
    return placesService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlacesService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlacesService>(value),
    );
  }
}

String _$placesServiceHash() => r'6d2c26ca6d7f50f2ab7ab7b5f1b760d5bff17309';
