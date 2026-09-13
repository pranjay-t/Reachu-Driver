// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_socket_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(supportSocketService)
final supportSocketServiceProvider = SupportSocketServiceProvider._();

final class SupportSocketServiceProvider
    extends
        $FunctionalProvider<
          SupportSocketService,
          SupportSocketService,
          SupportSocketService
        >
    with $Provider<SupportSocketService> {
  SupportSocketServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supportSocketServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supportSocketServiceHash();

  @$internal
  @override
  $ProviderElement<SupportSocketService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SupportSocketService create(Ref ref) {
    return supportSocketService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupportSocketService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupportSocketService>(value),
    );
  }
}

String _$supportSocketServiceHash() =>
    r'b19eb0e73b86af48dfb0497fdd874d8a600fedbc';
