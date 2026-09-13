// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VehicleCategory _$VehicleCategoryFromJson(Map<String, dynamic> json) =>
    _VehicleCategory(
      id: json['_id'] as String,
      cityId: json['cityId'] as String?,
      name: json['name'] as String,
      image: json['image'] as String?,
      minimumPrice: (json['minimumPrice'] as num?)?.toDouble(),
      baseFare: (json['baseFare'] as num?)?.toDouble(),
      disable: json['disable'] as bool?,
      requiredDocuments: (json['requiredDocuments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$VehicleCategoryToJson(_VehicleCategory instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'cityId': instance.cityId,
      'name': instance.name,
      'image': instance.image,
      'minimumPrice': instance.minimumPrice,
      'baseFare': instance.baseFare,
      'disable': instance.disable,
      'requiredDocuments': instance.requiredDocuments,
    };

_GetAllVehicleCategoriesResponse _$GetAllVehicleCategoriesResponseFromJson(
  Map<String, dynamic> json,
) => _GetAllVehicleCategoriesResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => VehicleCategory.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetAllVehicleCategoriesResponseToJson(
  _GetAllVehicleCategoriesResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_VehicleSubCategory _$VehicleSubCategoryFromJson(Map<String, dynamic> json) =>
    _VehicleSubCategory(
      id: json['_id'] as String,
      name: json['name'] as String,
      image: json['image'] as String?,
      minimumPrice: (json['minimumPrice'] as num?)?.toDouble(),
      baseFare: (json['baseFare'] as num?)?.toDouble(),
      disable: json['disable'] as bool?,
      cityId: json['cityId'] as String?,
      vehicleCategoryId: json['vehicleCategoryId'],
      requiredDocuments: (json['requiredDocuments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$VehicleSubCategoryToJson(_VehicleSubCategory instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'minimumPrice': instance.minimumPrice,
      'baseFare': instance.baseFare,
      'disable': instance.disable,
      'cityId': instance.cityId,
      'vehicleCategoryId': instance.vehicleCategoryId,
      'requiredDocuments': instance.requiredDocuments,
    };

_GetAllSubVehicleCategoriesResponse
_$GetAllSubVehicleCategoriesResponseFromJson(Map<String, dynamic> json) =>
    _GetAllSubVehicleCategoriesResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => VehicleSubCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllSubVehicleCategoriesResponseToJson(
  _GetAllSubVehicleCategoriesResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
