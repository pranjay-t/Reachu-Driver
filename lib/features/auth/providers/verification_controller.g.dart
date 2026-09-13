// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(VerificationController)
final verificationControllerProvider = VerificationControllerProvider._();

final class VerificationControllerProvider
    extends $NotifierProvider<VerificationController, AsyncValue<String?>> {
  VerificationControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'verificationControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$verificationControllerHash();

  @$internal
  @override
  VerificationController create() => VerificationController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<String?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<String?>>(value),
    );
  }
}

String _$verificationControllerHash() =>
    r'e8ea14c4c15013749e7c735cb9b0c93ea812ed7a';

abstract class _$VerificationController extends $Notifier<AsyncValue<String?>> {
  AsyncValue<String?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<String?>, AsyncValue<String?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String?>, AsyncValue<String?>>,
              AsyncValue<String?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
