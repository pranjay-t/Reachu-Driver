// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_queue_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RideQueue)
final rideQueueProvider = RideQueueProvider._();

final class RideQueueProvider
    extends $NotifierProvider<RideQueue, List<RideRequestItem>> {
  RideQueueProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rideQueueProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rideQueueHash();

  @$internal
  @override
  RideQueue create() => RideQueue();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<RideRequestItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<RideRequestItem>>(value),
    );
  }
}

String _$rideQueueHash() => r'6f76ef37c00648482e1c9257fb4a6cfe0d569b08';

abstract class _$RideQueue extends $Notifier<List<RideRequestItem>> {
  List<RideRequestItem> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<RideRequestItem>, List<RideRequestItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<RideRequestItem>, List<RideRequestItem>>,
              List<RideRequestItem>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
