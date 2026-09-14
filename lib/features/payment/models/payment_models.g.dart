// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WalletData _$WalletDataFromJson(Map<String, dynamic> json) => _WalletData(
  walletId: json['walletId'] as String,
  walletBalance: _doubleFromJson(json['walletBalance']),
  availableBalance: _doubleFromJson(json['availableBalance']),
  pendingWithdrawals: _doubleFromJson(json['pendingWithdrawals']),
  minimumBalanceForOrder: _doubleFromJson(json['minimumBalanceForOrder']),
  totalExpenses: _doubleFromJson(json['totalExpenses']),
  driverDebtBalance: json['driverDebtBalance'] == null
      ? 0.0
      : _doubleFromJson(json['driverDebtBalance']),
);

Map<String, dynamic> _$WalletDataToJson(_WalletData instance) =>
    <String, dynamic>{
      'walletId': instance.walletId,
      'walletBalance': instance.walletBalance,
      'availableBalance': instance.availableBalance,
      'pendingWithdrawals': instance.pendingWithdrawals,
      'minimumBalanceForOrder': instance.minimumBalanceForOrder,
      'totalExpenses': instance.totalExpenses,
      'driverDebtBalance': instance.driverDebtBalance,
    };

_RazorpayOrderData _$RazorpayOrderDataFromJson(Map<String, dynamic> json) =>
    _RazorpayOrderData(
      razorpayKeyId: json['razorpayKeyId'] as String,
      amount: _intFromJson(json['amount']),
      currency: json['currency'] as String,
      orderId: json['orderId'] as String,
    );

Map<String, dynamic> _$RazorpayOrderDataToJson(_RazorpayOrderData instance) =>
    <String, dynamic>{
      'razorpayKeyId': instance.razorpayKeyId,
      'amount': instance.amount,
      'currency': instance.currency,
      'orderId': instance.orderId,
    };

_VerifyPaymentResponse _$VerifyPaymentResponseFromJson(
  Map<String, dynamic> json,
) => _VerifyPaymentResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
);

Map<String, dynamic> _$VerifyPaymentResponseToJson(
  _VerifyPaymentResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
};

_TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    _TransactionModel(
      id: json['_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      amount: _doubleFromJson(json['amount']),
      type: json['type'] as String,
      transactionType: json['transactionType'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$TransactionModelToJson(_TransactionModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'amount': instance.amount,
      'type': instance.type,
      'transactionType': instance.transactionType,
      'status': instance.status,
      'createdAt': instance.createdAt,
    };

_PaginationData _$PaginationDataFromJson(Map<String, dynamic> json) =>
    _PaginationData(
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationDataToJson(_PaginationData instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
      'pages': instance.pages,
    };

_BankAccountData _$BankAccountDataFromJson(Map<String, dynamic> json) =>
    _BankAccountData(
      id: json['_id'] as String,
      driverId: _driverIdFromJson(json['driverId']),
      type: json['type'] as String,
      bankName: json['bankName'] as String?,
      accountNumber: json['accountNumber'] as String?,
      accountHolderName: json['accountHolderName'] as String?,
      ifscCode: json['ifscCode'] as String?,
      upiId: json['upiId'] as String?,
    );

Map<String, dynamic> _$BankAccountDataToJson(_BankAccountData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'driverId': instance.driverId,
      'type': instance.type,
      'bankName': instance.bankName,
      'accountNumber': instance.accountNumber,
      'accountHolderName': instance.accountHolderName,
      'ifscCode': instance.ifscCode,
      'upiId': instance.upiId,
    };

_CommonResponse _$CommonResponseFromJson(Map<String, dynamic> json) =>
    _CommonResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$CommonResponseToJson(_CommonResponse instance) =>
    <String, dynamic>{'success': instance.success, 'message': instance.message};

_BankAccountVerificationData _$BankAccountVerificationDataFromJson(
  Map<String, dynamic> json,
) => _BankAccountVerificationData(
  verified: json['verified'] as bool? ?? false,
  nameMatches: json['nameMatches'] as bool? ?? false,
  accountStatus: json['accountStatus'] as String?,
  nameAtBank: json['nameAtBank'] as String?,
  nameMatchResult: json['nameMatchResult'] as String?,
  nameMatchScore: _doubleFromJson(json['nameMatchScore']),
  bankName: json['bankName'] as String?,
  branch: json['branch'] as String?,
  city: json['city'] as String?,
);

Map<String, dynamic> _$BankAccountVerificationDataToJson(
  _BankAccountVerificationData instance,
) => <String, dynamic>{
  'verified': instance.verified,
  'nameMatches': instance.nameMatches,
  'accountStatus': instance.accountStatus,
  'nameAtBank': instance.nameAtBank,
  'nameMatchResult': instance.nameMatchResult,
  'nameMatchScore': instance.nameMatchScore,
  'bankName': instance.bankName,
  'branch': instance.branch,
  'city': instance.city,
};
