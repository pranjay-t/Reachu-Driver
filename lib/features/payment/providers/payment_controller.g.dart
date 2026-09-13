// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaymentController)
final paymentControllerProvider = PaymentControllerProvider._();

final class PaymentControllerProvider
    extends $AsyncNotifierProvider<PaymentController, WalletData> {
  PaymentControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentControllerHash();

  @$internal
  @override
  PaymentController create() => PaymentController();
}

String _$paymentControllerHash() => r'cab01cee9e07c161ea6e66007aaa8e314de74c95';

abstract class _$PaymentController extends $AsyncNotifier<WalletData> {
  FutureOr<WalletData> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<WalletData>, WalletData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<WalletData>, WalletData>,
              AsyncValue<WalletData>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
