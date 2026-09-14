import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/network_exceptions.dart';
import '../../../core/network/result.dart';
import '../../../core/utils/app_logger.dart';
import '../../account/providers/profile_controller.dart';
import '../models/payment_models.dart';
import '../repositories/payment_repository.dart';

part 'bank_accounts_controller.g.dart';

@riverpod
class BankAccountsController extends _$BankAccountsController {
  @override
  Future<List<BankAccountData>> build() async {
    return _fetchBankAccounts();
  }

  Future<List<BankAccountData>> _fetchBankAccounts() async {
    try {
      AppLogger.d('BankAccountsController: Fetching bank accounts...');
      final profile = await ref.read(profileControllerProvider.future);
      
      final repository = ref.read(paymentRepositoryProvider);
      final result = await repository.getBankAccounts(profile.id);

      switch (result) {
        case Success(:final data):
          if (data.success) {
            return data.data;
          } else {
            throw Exception(data.message);
          }
        case Failure(:final error):
          final errorMessage = NetworkExceptions.getErrorMessage(error);
          AppLogger.e('BankAccountsController: Failure with error: $errorMessage');
          throw Exception(errorMessage);
      }
    } catch (e, stack) {
      AppLogger.e('BankAccountsController: Exception in _fetchBankAccounts: $e \n stackTrace: $stack');
      rethrow;
    }
  }

  Future<void> refreshAccounts() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchBankAccounts());
  }

  Future<BankAccountVerificationData> verifyBankAccount({
    required String accountNumber,
    required String ifscCode,
    required String accountHolderName,
    String? phone,
  }) async {
    final repository = ref.read(paymentRepositoryProvider);
    String userPhone = phone ?? '';
    if (userPhone.isEmpty) {
      try {
        final profile = await ref.read(profileControllerProvider.future);
        userPhone = profile.phone;
      } catch (_) {}
    }

    final result = await repository.verifyBankAccount(
      accountNumber: accountNumber,
      ifscCode: ifscCode,
      accountHolderName: accountHolderName,
      phone: userPhone,
    );

    switch (result) {
      case Success(:final data):
        if (data.data != null) {
          return data.data!;
        } else {
          throw Exception(
            data.message.isNotEmpty ? data.message : 'Bank verification failed',
          );
        }
      case Failure(:final error):
        throw Exception(NetworkExceptions.getErrorMessage(error));
    }
  }

  Future<BankAccountData> addBankAccount(Map<String, dynamic> accountData) async {
    final profile = await ref.read(profileControllerProvider.future);
    final repository = ref.read(paymentRepositoryProvider);

    final payload = {
      'driverId': profile.id,
      'type': 'BankAccount',
      ...accountData,
    }..remove('phone');

    final result = await repository.addBankAccount(payload);

    switch (result) {
      case Success(:final data):
        if (data.success) {
          await refreshAccounts();
          return data.data;
        } else {
          throw Exception(data.message);
        }
      case Failure(:final error):
        throw Exception(NetworkExceptions.getErrorMessage(error));
    }
  }

  Future<void> updateBankAccount({
    required String accountId,
    required Map<String, dynamic> accountData,
  }) async {
    final repository = ref.read(paymentRepositoryProvider);
    final cleanData = Map<String, dynamic>.from(accountData)..remove('phone');
    final result = await repository.updateBankAccount(accountId, cleanData);

    switch (result) {
      case Success(:final data):
        if (data.success) {
          await refreshAccounts();
        } else {
          throw Exception(data.message);
        }
      case Failure(:final error):
        throw Exception(NetworkExceptions.getErrorMessage(error));
    }
  }

  Future<void> deleteBankAccount(String accountId) async {
    final repository = ref.read(paymentRepositoryProvider);
    final result = await repository.deleteBankAccount(accountId);

    switch (result) {
      case Success(:final data):
        if (data.success) {
          await refreshAccounts();
        } else {
          throw Exception(data.message);
        }
      case Failure(:final error):
        throw Exception(NetworkExceptions.getErrorMessage(error));
    }
  }
}
