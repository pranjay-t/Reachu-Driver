// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TransactionsController)
final transactionsControllerProvider = TransactionsControllerProvider._();

final class TransactionsControllerProvider
    extends $AsyncNotifierProvider<TransactionsController, TransactionsState> {
  TransactionsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionsControllerHash();

  @$internal
  @override
  TransactionsController create() => TransactionsController();
}

String _$transactionsControllerHash() =>
    r'8a4bfd188388591bff57872653bea1b1e532c837';

abstract class _$TransactionsController
    extends $AsyncNotifier<TransactionsState> {
  FutureOr<TransactionsState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<TransactionsState>, TransactionsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<TransactionsState>, TransactionsState>,
              AsyncValue<TransactionsState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
