import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/network_exceptions.dart';
import '../../../core/network/result.dart';
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
      print('DEBUG: BankAccountsController._fetchBankAccounts started');
      final profile = await ref.read(profileControllerProvider.future);
      print('DEBUG: BankAccountsController: Profile loaded with ID: ${profile.id}');
      
      final repository = ref.read(paymentRepositoryProvider);
      print('DEBUG: BankAccountsController: Fetching bank accounts from repository...');
      final result = await repository.getBankAccounts(profile.id);
      print('DEBUG: BankAccountsController: Repository getBankAccounts result: $result');

      switch (result) {
        case Success(:final data):
          print('DEBUG: BankAccountsController: Success fetching data, count: ${data.data.length}');
          if (data.success) {
            return data.data;
          } else {
            throw Exception(data.message);
          }
        case Failure(:final error):
          final errorMessage = NetworkExceptions.getErrorMessage(error);
          print('DEBUG: BankAccountsController: Failure with error: $errorMessage');
          throw Exception(errorMessage);
      }
    } catch (e, stack) {
      print('DEBUG: BankAccountsController: Exception in _fetchBankAccounts: $e\n$stack');
      rethrow;
    }
  }

  Future<void> refreshAccounts() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchBankAccounts());
  }

  Future<BankAccountData> addBankAccount(Map<String, dynamic> accountData) async {
    final profile = await ref.read(profileControllerProvider.future);
    final repository = ref.read(paymentRepositoryProvider);

    final payload = {
      'driverId': profile.id,
      ...accountData,
    };

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
    final result = await repository.updateBankAccount(accountId, accountData);

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
