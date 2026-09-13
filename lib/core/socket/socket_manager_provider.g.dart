// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socket_manager_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SocketManagerNotifier)
final socketManagerProvider = SocketManagerNotifierProvider._();

final class SocketManagerNotifierProvider
    extends $NotifierProvider<SocketManagerNotifier, SocketManagerStatus> {
  SocketManagerNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'socketManagerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$socketManagerNotifierHash();

  @$internal
  @override
  SocketManagerNotifier create() => SocketManagerNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SocketManagerStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SocketManagerStatus>(value),
    );
  }
}

String _$socketManagerNotifierHash() =>
    r'f48537192bf57bcb0cf299c00ab12aac1b943b5a';

abstract class _$SocketManagerNotifier extends $Notifier<SocketManagerStatus> {
  SocketManagerStatus build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SocketManagerStatus, SocketManagerStatus>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SocketManagerStatus, SocketManagerStatus>,
              SocketManagerStatus,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
