// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_chat_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RideChatNotifier)
final rideChatProvider = RideChatNotifierFamily._();

final class RideChatNotifierProvider
    extends $NotifierProvider<RideChatNotifier, RideChatState> {
  RideChatNotifierProvider._({
    required RideChatNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'rideChatProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$rideChatNotifierHash();

  @override
  String toString() {
    return r'rideChatProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  RideChatNotifier create() => RideChatNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RideChatState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RideChatState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RideChatNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$rideChatNotifierHash() => r'5ddaa3b34b58403fcfc39f230bfbbfa67e7443f0';

final class RideChatNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          RideChatNotifier,
          RideChatState,
          RideChatState,
          RideChatState,
          String
        > {
  RideChatNotifierFamily._()
    : super(
        retry: null,
        name: r'rideChatProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RideChatNotifierProvider call(String rideId) =>
      RideChatNotifierProvider._(argument: rideId, from: this);

  @override
  String toString() => r'rideChatProvider';
}

abstract class _$RideChatNotifier extends $Notifier<RideChatState> {
  late final _$args = ref.$arg as String;
  String get rideId => _$args;

  RideChatState build(String rideId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<RideChatState, RideChatState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RideChatState, RideChatState>,
              RideChatState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
