// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SupportTickets)
final supportTicketsProvider = SupportTicketsProvider._();

final class SupportTicketsProvider
    extends $AsyncNotifierProvider<SupportTickets, List<SupportTicket>> {
  SupportTicketsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supportTicketsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supportTicketsHash();

  @$internal
  @override
  SupportTickets create() => SupportTickets();
}

String _$supportTicketsHash() => r'b2143b1381ca24316eede91667ad8f8105c05dc6';

abstract class _$SupportTickets extends $AsyncNotifier<List<SupportTicket>> {
  FutureOr<List<SupportTicket>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<SupportTicket>>, List<SupportTicket>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<SupportTicket>>, List<SupportTicket>>,
              AsyncValue<List<SupportTicket>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SupportChat)
final supportChatProvider = SupportChatFamily._();

final class SupportChatProvider
    extends $AsyncNotifierProvider<SupportChat, List<SupportMessage>> {
  SupportChatProvider._({
    required SupportChatFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'supportChatProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$supportChatHash();

  @override
  String toString() {
    return r'supportChatProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SupportChat create() => SupportChat();

  @override
  bool operator ==(Object other) {
    return other is SupportChatProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$supportChatHash() => r'80be509ae779f9f5de58c951a6e46505bad4890e';

final class SupportChatFamily extends $Family
    with
        $ClassFamilyOverride<
          SupportChat,
          AsyncValue<List<SupportMessage>>,
          List<SupportMessage>,
          FutureOr<List<SupportMessage>>,
          String
        > {
  SupportChatFamily._()
    : super(
        retry: null,
        name: r'supportChatProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SupportChatProvider call(String ticketId) =>
      SupportChatProvider._(argument: ticketId, from: this);

  @override
  String toString() => r'supportChatProvider';
}

abstract class _$SupportChat extends $AsyncNotifier<List<SupportMessage>> {
  late final _$args = ref.$arg as String;
  String get ticketId => _$args;

  FutureOr<List<SupportMessage>> build(String ticketId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<SupportMessage>>, List<SupportMessage>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<SupportMessage>>,
                List<SupportMessage>
              >,
              AsyncValue<List<SupportMessage>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
