// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_connectivity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NetworkConnectivityNotifier)
final networkConnectivityProvider = NetworkConnectivityNotifierProvider._();

final class NetworkConnectivityNotifierProvider
    extends
        $NotifierProvider<
          NetworkConnectivityNotifier,
          NetworkConnectivityState
        > {
  NetworkConnectivityNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkConnectivityProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkConnectivityNotifierHash();

  @$internal
  @override
  NetworkConnectivityNotifier create() => NetworkConnectivityNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NetworkConnectivityState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NetworkConnectivityState>(value),
    );
  }
}

String _$networkConnectivityNotifierHash() =>
    r'5cc3ba2d7d3c7d45aca6a7b4d139b7b302d5dad8';

abstract class _$NetworkConnectivityNotifier
    extends $Notifier<NetworkConnectivityState> {
  NetworkConnectivityState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<NetworkConnectivityState, NetworkConnectivityState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NetworkConnectivityState, NetworkConnectivityState>,
              NetworkConnectivityState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
