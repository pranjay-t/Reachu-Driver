// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DriverModel _$DriverModelFromJson(Map<String, dynamic> json) => _DriverModel(
  id: json['_id'] as String,
  name: json['name'] as String?,
  phone: _phoneFromJson(json['phone']),
  email: json['email'] as String?,
  gender: json['gender'] as String?,
  image: json['image'] as String?,
  DLImage: json['DLImage'] as String?,
  PANImage: json['PANImage'] as String?,
  aadharImageFront: json['aadharImageFront'] as String?,
  aadharImageBack: json['aadharImageBack'] as String?,
  imageVerificationStatus: json['imageVerificationStatus'] as String?,
  profileVerificationStatus: json['profileVerificationStatus'] as String?,
  vehicleVerificationStatus: json['vehicleVerificationStatus'] as String?,
  isCompleteVerified: json['isCompleteVerified'] as String?,
  verificationStatus: json['verificationStatus'] as String?,
  dateOfBirth: json['dateOfBirth'] == null
      ? null
      : DateTime.parse(json['dateOfBirth'] as String),
  isProfileCompleted: json['isProfileCompleted'] as bool?,
  startDuty: json['startDuty'] as bool?,
  disable: json['disable'] as bool?,
  isCancelledAnyOrder: json['isCancelledAnyOrder'] as bool?,
  rating: (json['rating'] as num?)?.toDouble(),
  totalRating: (json['totalRating'] as num?)?.toInt(),
  preference: json['preference'] as String?,
  alternateContact1: json['alternateContact1'] as String?,
  relation1: json['relation1'] as String?,
  address1: json['address1'] as String?,
  alternateContact2: json['alternateContact2'] as String?,
  relation2: json['relation2'] as String?,
  address2: json['address2'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$DriverModelToJson(_DriverModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'gender': instance.gender,
      'image': instance.image,
      'DLImage': instance.DLImage,
      'PANImage': instance.PANImage,
      'aadharImageFront': instance.aadharImageFront,
      'aadharImageBack': instance.aadharImageBack,
      'imageVerificationStatus': instance.imageVerificationStatus,
      'profileVerificationStatus': instance.profileVerificationStatus,
      'vehicleVerificationStatus': instance.vehicleVerificationStatus,
      'isCompleteVerified': instance.isCompleteVerified,
      'verificationStatus': instance.verificationStatus,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'isProfileCompleted': instance.isProfileCompleted,
      'startDuty': instance.startDuty,
      'disable': instance.disable,
      'isCancelledAnyOrder': instance.isCancelledAnyOrder,
      'rating': instance.rating,
      'totalRating': instance.totalRating,
      'preference': instance.preference,
      'alternateContact1': instance.alternateContact1,
      'relation1': instance.relation1,
      'address1': instance.address1,
      'alternateContact2': instance.alternateContact2,
      'relation2': instance.relation2,
      'address2': instance.address2,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
