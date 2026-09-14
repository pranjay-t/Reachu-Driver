// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_onboarding_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DriverOnboardingController)
final driverOnboardingControllerProvider =
    DriverOnboardingControllerProvider._();

final class DriverOnboardingControllerProvider
    extends
        $NotifierProvider<DriverOnboardingController, DriverOnboardingState> {
  DriverOnboardingControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'driverOnboardingControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$driverOnboardingControllerHash();

  @$internal
  @override
  DriverOnboardingController create() => DriverOnboardingController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DriverOnboardingState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DriverOnboardingState>(value),
    );
  }
}

String _$driverOnboardingControllerHash() =>
    r'2d0163d82d02d6b80693235c87085becb53014df';

abstract class _$DriverOnboardingController
    extends $Notifier<DriverOnboardingState> {
  DriverOnboardingState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<DriverOnboardingState, DriverOnboardingState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DriverOnboardingState, DriverOnboardingState>,
              DriverOnboardingState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
