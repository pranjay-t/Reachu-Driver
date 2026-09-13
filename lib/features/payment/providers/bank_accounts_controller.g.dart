// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_accounts_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BankAccountsController)
final bankAccountsControllerProvider = BankAccountsControllerProvider._();

final class BankAccountsControllerProvider
    extends
        $AsyncNotifierProvider<BankAccountsController, List<BankAccountData>> {
  BankAccountsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bankAccountsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bankAccountsControllerHash();

  @$internal
  @override
  BankAccountsController create() => BankAccountsController();
}

String _$bankAccountsControllerHash() =>
    r'6e71d2b84c95527c7ce7c459f6d8549dddce91da';

abstract class _$BankAccountsController
    extends $AsyncNotifier<List<BankAccountData>> {
  FutureOr<List<BankAccountData>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<BankAccountData>>, List<BankAccountData>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<BankAccountData>>,
                List<BankAccountData>
              >,
              AsyncValue<List<BankAccountData>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
