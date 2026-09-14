// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_models.freezed.dart';
part 'payment_models.g.dart';

double _doubleFromJson(dynamic json) {
  if (json == null) return 0.0;
  if (json is num) return json.toDouble();
  if (json is String) return double.tryParse(json) ?? 0.0;
  return 0.0;
}

int _intFromJson(dynamic json) {
  if (json == null) return 0;
  if (json is num) return json.toInt();
  if (json is String) return int.tryParse(json) ?? 0;
  return 0;
}

String _driverIdFromJson(dynamic json) {
  if (json is String) {
    return json;
  }
  if (json is Map) {
    return (json['id'] ?? json['_id'] ?? '').toString();
  }
  return '';
}

@freezed
abstract class WalletData with _$WalletData {
  const factory WalletData({
    required String walletId,
    @JsonKey(fromJson: _doubleFromJson) required double walletBalance,
    @JsonKey(fromJson: _doubleFromJson) required double availableBalance,
    @JsonKey(fromJson: _doubleFromJson) required double pendingWithdrawals,
    @JsonKey(fromJson: _doubleFromJson) required double minimumBalanceForOrder,
    @JsonKey(fromJson: _doubleFromJson) required double totalExpenses,
    @JsonKey(fromJson: _doubleFromJson) @Default(0.0) double driverDebtBalance,
  }) = _WalletData;

  factory WalletData.fromJson(Map<String, dynamic> json) => _$WalletDataFromJson(json);
}

Map<String, dynamic> _safeMap(dynamic json) {
  if (json is Map) {
    return Map<String, dynamic>.from(json);
  }
  return {};
}

@freezed
abstract class WalletBalanceResponse with _$WalletBalanceResponse {
  const factory WalletBalanceResponse({
    required bool success,
    required String message,
    required WalletData data,
  }) = _WalletBalanceResponse;

  factory WalletBalanceResponse.fromJson(Map<String, dynamic> json) {
    return WalletBalanceResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: WalletData.fromJson(_safeMap(json['data'])),
    );
  }
}

@freezed
abstract class RazorpayOrderData with _$RazorpayOrderData {
  const factory RazorpayOrderData({
    required String razorpayKeyId,
    @JsonKey(fromJson: _intFromJson) required int amount,
    required String currency,
    required String orderId,
  }) = _RazorpayOrderData;

  factory RazorpayOrderData.fromJson(Map<String, dynamic> json) => _$RazorpayOrderDataFromJson(json);
}

@freezed
abstract class CreateRazorpayOrderResponse with _$CreateRazorpayOrderResponse {
  const factory CreateRazorpayOrderResponse({
    required bool success,
    required String message,
    required RazorpayOrderData data,
  }) = _CreateRazorpayOrderResponse;

  factory CreateRazorpayOrderResponse.fromJson(Map<String, dynamic> json) {
    return CreateRazorpayOrderResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: RazorpayOrderData.fromJson(_safeMap(json['data'])),
    );
  }
}

@freezed
abstract class VerifyPaymentResponse with _$VerifyPaymentResponse {
  const factory VerifyPaymentResponse({
    required bool success,
    required String message,
  }) = _VerifyPaymentResponse;

  factory VerifyPaymentResponse.fromJson(Map<String, dynamic> json) => _$VerifyPaymentResponseFromJson(json);
}

@freezed
abstract class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    @JsonKey(name: '_id') required String id,
    required String title,
    required String description,
    @JsonKey(fromJson: _doubleFromJson) required double amount,
    required String type, // 'credit' or 'debit'
    required String transactionType, // 'wallet_recharge', 'ride_fare', etc.
    required String status, // 'completed', etc.
    required String createdAt,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);
}

@freezed
abstract class PaginationData with _$PaginationData {
  const factory PaginationData({
    required int total,
    required int page,
    required int limit,
    required int pages,
  }) = _PaginationData;

  factory PaginationData.fromJson(Map<String, dynamic> json) => _$PaginationDataFromJson(json);
}

@freezed
abstract class TransactionsResponse with _$TransactionsResponse {
  const factory TransactionsResponse({
    required bool success,
    required String message,
    required List<TransactionModel> data,
    required PaginationData pagination,
  }) = _TransactionsResponse;

  factory TransactionsResponse.fromJson(Map<String, dynamic> json) {
    return TransactionsResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: (json['data'] as List? ?? [])
          .map((e) => TransactionModel.fromJson(_safeMap(e)))
          .toList(),
      pagination: PaginationData.fromJson(_safeMap(json['pagination'])),
    );
  }
}

@freezed
abstract class BankAccountData with _$BankAccountData {
  const factory BankAccountData({
    @JsonKey(name: '_id') required String id,
    @JsonKey(fromJson: _driverIdFromJson) required String driverId,
    required String type, // "BankAccount" or "UPI"
    String? bankName,
    String? accountNumber,
    String? accountHolderName,
    String? ifscCode,
    String? upiId,
  }) = _BankAccountData;

  factory BankAccountData.fromJson(Map<String, dynamic> json) => _$BankAccountDataFromJson(json);
}

@freezed
abstract class GetBankAccountsResponse with _$GetBankAccountsResponse {
  const factory GetBankAccountsResponse({
    required bool success,
    required String message,
    required List<BankAccountData> data,
  }) = _GetBankAccountsResponse;

  factory GetBankAccountsResponse.fromJson(Map<String, dynamic> json) {
    return GetBankAccountsResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: (json['data'] as List? ?? [])
          .map((e) => BankAccountData.fromJson(_safeMap(e)))
          .toList(),
    );
  }
}

@freezed
abstract class BankAccountAddResp with _$BankAccountAddResp {
  const factory BankAccountAddResp({
    required bool success,
    required String message,
    required BankAccountData data,
  }) = _BankAccountAddResp;

  factory BankAccountAddResp.fromJson(Map<String, dynamic> json) {
    return BankAccountAddResp(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: BankAccountData.fromJson(_safeMap(json['data'])),
    );
  }
}

class WithdrawalData {
  final String? withdrawalId;
  final String? transactionId;
  final double amount;
  final double? newBalance;
  final String? status;
  final String? BankAccountId;
  final String? fromAccountType;
  final String? createdAt;

  const WithdrawalData({
    this.withdrawalId,
    this.transactionId,
    this.amount = 0.0,
    this.newBalance,
    this.status,
    this.BankAccountId,
    this.fromAccountType,
    this.createdAt,
  });

  factory WithdrawalData.fromJson(Map<String, dynamic> json) {
    final safe = _safeMap(json);
    return WithdrawalData(
      withdrawalId: (safe['withdrawalId'] ?? safe['transactionId'] ?? safe['_id'] ?? safe['id'])?.toString(),
      transactionId: (safe['transactionId'] ?? safe['withdrawalId'] ?? safe['_id'] ?? safe['id'])?.toString(),
      amount: _doubleFromJson(safe['amount']),
      newBalance: safe['newBalance'] != null ? _doubleFromJson(safe['newBalance']) : null,
      status: safe['status']?.toString() ?? 'completed',
      BankAccountId: (safe['BankAccountId'] ?? safe['bankAccountId'])?.toString(),
      fromAccountType: safe['fromAccountType']?.toString(),
      createdAt: safe['createdAt']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'withdrawalId': withdrawalId,
      'transactionId': transactionId,
      'amount': amount,
      'newBalance': newBalance,
      'status': status,
      'BankAccountId': BankAccountId,
      'fromAccountType': fromAccountType,
      'createdAt': createdAt,
    };
  }
}

class PaymentsWithdrawResponse {
  final bool success;
  final String message;
  final WithdrawalData data;

  const PaymentsWithdrawResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory PaymentsWithdrawResponse.fromJson(Map<String, dynamic> json) {
    return PaymentsWithdrawResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: WithdrawalData.fromJson(_safeMap(json['data'])),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.toJson(),
    };
  }
}

@freezed
abstract class CommonResponse with _$CommonResponse {
  const factory CommonResponse({
    required bool success,
    required String message,
  }) = _CommonResponse;

  factory CommonResponse.fromJson(Map<String, dynamic> json) => _$CommonResponseFromJson(json);
}

const List<String> kNameMatchGoodResults = [
  'EXACT_MATCH',
  'GOOD_MATCH',
  'GOOD_PARTIAL_MATCH',
];

@freezed
abstract class BankAccountVerificationData with _$BankAccountVerificationData {
  const BankAccountVerificationData._();

  const factory BankAccountVerificationData({
    @Default(false) bool verified,
    @Default(false) bool nameMatches,
    String? accountStatus,
    String? nameAtBank,
    String? nameMatchResult,
    @JsonKey(fromJson: _doubleFromJson) double? nameMatchScore,
    String? bankName,
    String? branch,
    String? city,
  }) = _BankAccountVerificationData;

  factory BankAccountVerificationData.fromJson(Map<String, dynamic> json) =>
      _$BankAccountVerificationDataFromJson(json);

  bool get isGoodNameMatch {
    if (nameMatches) return true;
    if (nameMatchResult != null &&
        kNameMatchGoodResults.contains(nameMatchResult!.toUpperCase())) {
      return true;
    }
    return false;
  }
}

@freezed
abstract class VerifyBankAccountResponse with _$VerifyBankAccountResponse {
  const factory VerifyBankAccountResponse({
    required bool success,
    required String message,
    BankAccountVerificationData? data,
  }) = _VerifyBankAccountResponse;

  factory VerifyBankAccountResponse.fromJson(Map<String, dynamic> json) {
    return VerifyBankAccountResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: json['data'] != null
          ? BankAccountVerificationData.fromJson(_safeMap(json['data']))
          : null,
    );
  }
}

