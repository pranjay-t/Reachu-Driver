import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/network/api_service.dart';
import '../../../core/network/result.dart';
import '../models/payment_models.dart';

part 'payment_repository.g.dart';

@riverpod
PaymentRepository paymentRepository(Ref ref) {
  return PaymentRepository(ref.watch(apiServiceProvider));
}

class PaymentRepository {
  final ApiService _apiService;

  PaymentRepository(this._apiService);

  Future<ApiResult<WalletBalanceResponse>> getWalletBalance() async {
    return _apiService.get(
      ApiPath.getWallet,
      converter: (data) => WalletBalanceResponse.fromJson(Map<String, dynamic>.from(data as Map)),
    );
  }

  Future<ApiResult<CreateRazorpayOrderResponse>> createRazorpayOrder(String amount) async {
    return _apiService.post(
      ApiPath.getRazorpayOrderId,
      data: {'amount': amount},
      converter: (data) => CreateRazorpayOrderResponse.fromJson(Map<String, dynamic>.from(data as Map)),
    );
  }

  Future<ApiResult<VerifyPaymentResponse>> verifyPayment({
    required String paymentId,
    required String orderId,
    required String signature,
  }) async {
    return _apiService.post(
      ApiPath.verifyPayment,
      data: {
        'razorpay_payment_id': paymentId,
        'razorpay_order_id': orderId,
        'razorpay_signature': signature,
      },
      converter: (data) => VerifyPaymentResponse.fromJson(Map<String, dynamic>.from(data as Map)),
    );
  }

  Future<ApiResult<TransactionsResponse>> getTransactions({
    required String userId,
    required int page,
    int limit = 15,
  }) async {
    return _apiService.get(
      ApiPath.getTransactions,
      queryParameters: {
        'userId': userId,
        'userType': 'Driver',
        'page': page,
        'limit': limit,
      },
      converter: (data) => TransactionsResponse.fromJson(Map<String, dynamic>.from(data as Map)),
    );
  }

  Future<ApiResult<GetBankAccountsResponse>> getBankAccounts(String driverId) async {
    return _apiService.get(
      ApiPath.getBankAccounts(driverId),
      converter: (data) => GetBankAccountsResponse.fromJson(Map<String, dynamic>.from(data as Map)),
    );
  }

  Future<ApiResult<BankAccountAddResp>> addBankAccount(Map<String, dynamic> data) async {
    return _apiService.post(
      ApiPath.addBankAccount,
      data: data,
      converter: (data) => BankAccountAddResp.fromJson(Map<String, dynamic>.from(data as Map)),
    );
  }

  Future<ApiResult<CommonResponse>> updateBankAccount(String accountId, Map<String, dynamic> data) async {
    return _apiService.put(
      ApiPath.updateBankAccount(accountId),
      data: data,
      converter: (data) => CommonResponse.fromJson(Map<String, dynamic>.from(data as Map)),
    );
  }

  Future<ApiResult<CommonResponse>> deleteBankAccount(String accountId) async {
    return _apiService.delete(
      ApiPath.deleteBankAccount(accountId),
      converter: (data) => CommonResponse.fromJson(Map<String, dynamic>.from(data as Map)),
    );
  }

  Future<ApiResult<PaymentsWithdrawResponse>> withdrawMoney({
    required String amount,
    required String bankAccountId,
  }) async {
    return _apiService.post(
      ApiPath.withdrawMoney,
      data: {
        'amount': amount,
        'BankAccountId': bankAccountId,
      },
      converter: (data) => PaymentsWithdrawResponse.fromJson(Map<String, dynamic>.from(data as Map)),
    );
  }

  Future<ApiResult<CommonResponse>> collectCashPayment(String orderId) async {
    return _apiService.post(
      ApiPath.collectCash,
      data: {
        'orderId': orderId,
      },
      converter: (data) => CommonResponse.fromJson(Map<String, dynamic>.from(data as Map)),
    );
  }

  Future<ApiResult<Map<String, dynamic>>> getRideQr(String orderId) async {
    return _apiService.get(
      ApiPath.getRideQr(orderId),
      converter: (data) => Map<String, dynamic>.from(data as Map),
    );
  }

  Future<ApiResult<Map<String, dynamic>>> refreshRidePayment(String orderId) async {
    return _apiService.get(
      ApiPath.refreshRidePayment(orderId),
      converter: (data) => Map<String, dynamic>.from(data as Map),
    );
  }
}
