// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VehicleInfo _$VehicleInfoFromJson(Map<String, dynamic> json) => _VehicleInfo(
  id: json['_id'] as String,
  vehicleName: json['vehicleName'] as String,
  vehicleNumber: json['vehicleNumber'] as String,
  vehicleType: json['vehicleType'] as String?,
  vehicleColor: json['vehicleColor'] as String?,
  vehicleModel: json['vehicleModel'] as String?,
  vehicleYear: (json['vehicleYear'] as num?)?.toInt(),
  vehicleCapacity: (json['vehicleCapacity'] as num?)?.toDouble(),
  vehicleStatus: json['vehicleStatus'] as String?,
  driverId: json['driverId'] as String?,
  verificationStatus: json['verificationStatus'] as String?,
  disable: json['disable'] as bool?,
);

Map<String, dynamic> _$VehicleInfoToJson(_VehicleInfo instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'vehicleName': instance.vehicleName,
      'vehicleNumber': instance.vehicleNumber,
      'vehicleType': instance.vehicleType,
      'vehicleColor': instance.vehicleColor,
      'vehicleModel': instance.vehicleModel,
      'vehicleYear': instance.vehicleYear,
      'vehicleCapacity': instance.vehicleCapacity,
      'vehicleStatus': instance.vehicleStatus,
      'driverId': instance.driverId,
      'verificationStatus': instance.verificationStatus,
      'disable': instance.disable,
    };

_CreateVehicleResponse _$CreateVehicleResponseFromJson(
  Map<String, dynamic> json,
) => _CreateVehicleResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  vehicle: (json['vehicle'] as List<dynamic>)
      .map((e) => VehicleInfo.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CreateVehicleResponseToJson(
  _CreateVehicleResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'vehicle': instance.vehicle,
};

_RegisterProfileResponse _$RegisterProfileResponseFromJson(
  Map<String, dynamic> json,
) => _RegisterProfileResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: DriverModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RegisterProfileResponseToJson(
  _RegisterProfileResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_DriverImageUploadResponse _$DriverImageUploadResponseFromJson(
  Map<String, dynamic> json,
) => _DriverImageUploadResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  driver: DriverModel.fromJson(json['driver'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DriverImageUploadResponseToJson(
  _DriverImageUploadResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'driver': instance.driver,
};

_CheckVerificationResponse _$CheckVerificationResponseFromJson(
  Map<String, dynamic> json,
) => _CheckVerificationResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  status: json['status'] as String,
  isDriver: json['isDriver'] as bool,
  data: json['data'] as Map<String, dynamic>?,
  token: json['token'] as String?,
  driverId: json['driverId'] as String?,
);

Map<String, dynamic> _$CheckVerificationResponseToJson(
  _CheckVerificationResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'status': instance.status,
  'isDriver': instance.isDriver,
  'data': instance.data,
  'token': instance.token,
  'driverId': instance.driverId,
};
