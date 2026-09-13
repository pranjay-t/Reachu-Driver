// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeDriverInfo _$HomeDriverInfoFromJson(Map<String, dynamic> json) =>
    _HomeDriverInfo(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String?,
      isOnline: json['isOnline'] as bool? ?? false,
      verificationStatus: json['verificationStatus'] as String?,
      imageVerificationStatus: json['imageVerificationStatus'] as String?,
      willGetOrder: json['willGetOrder'] as bool? ?? true,
      onboardingComplete: json['onboardingComplete'] as bool? ?? false,
      rating: (json['rating'] as num?)?.toDouble(),
      lowBalance: json['lowBalance'] as bool? ?? false,
      driverWalletLimit: json['driverWalletLimit'] == null
          ? 0.0
          : _doubleFromJson(json['driverWalletLimit']),
    );

Map<String, dynamic> _$HomeDriverInfoToJson(_HomeDriverInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'isOnline': instance.isOnline,
      'verificationStatus': instance.verificationStatus,
      'imageVerificationStatus': instance.imageVerificationStatus,
      'willGetOrder': instance.willGetOrder,
      'onboardingComplete': instance.onboardingComplete,
      'rating': instance.rating,
      'lowBalance': instance.lowBalance,
      'driverWalletLimit': instance.driverWalletLimit,
    };

_DocumentSubmissionStatus _$DocumentSubmissionStatusFromJson(
  Map<String, dynamic> json,
) => _DocumentSubmissionStatus(
  isPending: json['isPending'] as bool? ?? false,
  status: json['status'] as String?,
  message: json['message'] as String?,
  registration: json['registration'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$DocumentSubmissionStatusToJson(
  _DocumentSubmissionStatus instance,
) => <String, dynamic>{
  'isPending': instance.isPending,
  'status': instance.status,
  'message': instance.message,
  'registration': instance.registration,
};

_EarningsStats _$EarningsStatsFromJson(Map<String, dynamic> json) =>
    _EarningsStats(
      total: (json['total'] as num).toDouble(),
      cash: (json['cash'] as num).toDouble(),
      online: (json['online'] as num).toDouble(),
    );

Map<String, dynamic> _$EarningsStatsToJson(_EarningsStats instance) =>
    <String, dynamic>{
      'total': instance.total,
      'cash': instance.cash,
      'online': instance.online,
    };

_RidesStats _$RidesStatsFromJson(Map<String, dynamic> json) => _RidesStats(
  total: (json['total'] as num).toInt(),
  completed: (json['completed'] as num).toInt(),
  cancelled: (json['cancelled'] as num).toInt(),
);

Map<String, dynamic> _$RidesStatsToJson(_RidesStats instance) =>
    <String, dynamic>{
      'total': instance.total,
      'completed': instance.completed,
      'cancelled': instance.cancelled,
    };

_TodayStats _$TodayStatsFromJson(Map<String, dynamic> json) => _TodayStats(
  earnings: EarningsStats.fromJson(json['earnings'] as Map<String, dynamic>),
  rides: RidesStats.fromJson(json['rides'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TodayStatsToJson(_TodayStats instance) =>
    <String, dynamic>{'earnings': instance.earnings, 'rides': instance.rides};

_HomeData _$HomeDataFromJson(Map<String, dynamic> json) => _HomeData(
  driver: HomeDriverInfo.fromJson(json['driver'] as Map<String, dynamic>),
  documentSubmission: DocumentSubmissionStatus.fromJson(
    json['documentSubmission'] as Map<String, dynamic>,
  ),
  todayStats: TodayStats.fromJson(json['todayStats'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HomeDataToJson(_HomeData instance) => <String, dynamic>{
  'driver': instance.driver,
  'documentSubmission': instance.documentSubmission,
  'todayStats': instance.todayStats,
};

_HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) =>
    _HomeResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: HomeData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeResponseToJson(_HomeResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
