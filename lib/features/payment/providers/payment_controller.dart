import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/network_exceptions.dart';
import '../../../core/network/result.dart';
import '../models/payment_models.dart';
import '../repositories/payment_repository.dart';

part 'payment_controller.g.dart';

@riverpod
class PaymentController extends _$PaymentController {
  @override
  Future<WalletData> build() async {
    return _fetchWalletBalance();
  }

  Future<WalletData> _fetchWalletBalance() async {
    final repository = ref.read(paymentRepositoryProvider);
    final result = await repository.getWalletBalance();

    switch (result) {
      case Success(:final data):
        if (data.success) {
          return data.data;
        } else {
          throw Exception(data.message);
        }
      case Failure(:final error):
        throw Exception(NetworkExceptions.getErrorMessage(error));
    }
  }

  Future<void> refreshWallet() async {
    final keepAlive = ref.keepAlive();
    try {
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() => _fetchWalletBalance());
    } finally {
      keepAlive.close();
    }
  }

  Future<CreateRazorpayOrderResponse> createRazorpayOrder(String amount) async {
    final repository = ref.read(paymentRepositoryProvider);
    final result = await repository.createRazorpayOrder(amount);

    switch (result) {
      case Success(:final data):
        if (data.success) {
          return data;
        } else {
          throw Exception(data.message);
        }
      case Failure(:final error):
        throw Exception(NetworkExceptions.getErrorMessage(error));
    }
  }

  Future<void> verifyPayment({
    required String paymentId,
    required String orderId,
    required String signature,
  }) async {
    final repository = ref.read(paymentRepositoryProvider);
    final result = await repository.verifyPayment(
      paymentId: paymentId,
      orderId: orderId,
      signature: signature,
    );

    switch (result) {
      case Success(:final data):
        if (data.success) {
          // After successful verification, refresh the wallet balance
          await refreshWallet();
        } else {
          throw Exception(data.message);
        }
      case Failure(:final error):
        throw Exception(NetworkExceptions.getErrorMessage(error));
    }
  }

  Future<PaymentsWithdrawResponse> withdrawMoney({
    required String amount,
    required String bankAccountId,
  }) async {
    final repository = ref.read(paymentRepositoryProvider);
    final result = await repository.withdrawMoney(
      amount: amount,
      bankAccountId: bankAccountId,
    );

    switch (result) {
      case Success(:final data):
        if (data.success) {
          await refreshWallet();
          return data;
        } else {
          throw Exception(data.message);
        }
      case Failure(:final error):
        throw Exception(NetworkExceptions.getErrorMessage(error));
    }
  }

  Future<void> collectCashPayment({
    required String orderId,
  }) async {
    final keepAlive = ref.keepAlive();
    try {
      final repository = ref.read(paymentRepositoryProvider);
      final result = await repository.collectCashPayment(orderId);

      switch (result) {
        case Success(:final data):
          if (data.success) {
            await refreshWallet();
          } else {
            throw Exception(data.message);
          }
        case Failure(:final error):
          throw Exception(NetworkExceptions.getErrorMessage(error));
      }
    } finally {
      keepAlive.close();
    }
  }

  Future<Map<String, dynamic>> getRideQr({
    required String orderId,
  }) async {
    final keepAlive = ref.keepAlive();
    try {
      final repository = ref.read(paymentRepositoryProvider);
      final result = await repository.getRideQr(orderId);

      switch (result) {
        case Success(:final data):
          if (data['success'] == true) {
            return Map<String, dynamic>.from(data['data'] as Map);
          } else {
            throw Exception(data['message'] ?? 'Failed to get QR');
          }
        case Failure(:final error):
          throw Exception(NetworkExceptions.getErrorMessage(error));
      }
    } finally {
      keepAlive.close();
    }
  }

  Future<Map<String, dynamic>> refreshRidePayment({
    required String orderId,
  }) async {
    final keepAlive = ref.keepAlive();
    try {
      final repository = ref.read(paymentRepositoryProvider);
      final result = await repository.refreshRidePayment(orderId);

      switch (result) {
        case Success(:final data):
          return data;
        case Failure(:final error):
          throw Exception(NetworkExceptions.getErrorMessage(error));
      }
    } finally {
      keepAlive.close();
    }
  }
}
