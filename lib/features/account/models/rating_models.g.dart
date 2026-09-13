// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewRatingResponse _$ReviewRatingResponseFromJson(
  Map<String, dynamic> json,
) => _ReviewRatingResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => ReviewRating.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ReviewRatingResponseToJson(
  _ReviewRatingResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_ReviewRating _$ReviewRatingFromJson(Map<String, dynamic> json) =>
    _ReviewRating(
      id: json['_id'] as String?,
      orderId: json['orderId'] as String?,
      user: json['userId'] == null
          ? null
          : ReviewUser.fromJson(json['userId'] as Map<String, dynamic>),
      driverId: json['driverId'] as String?,
      experienceType: json['expreienceType'] as String?,
      experienceDescription: json['exprerienceDescription'] as String?,
      rating: (json['rating'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReviewRatingToJson(_ReviewRating instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'orderId': instance.orderId,
      'userId': instance.user,
      'driverId': instance.driverId,
      'expreienceType': instance.experienceType,
      'exprerienceDescription': instance.experienceDescription,
      'rating': instance.rating,
    };

_ReviewUser _$ReviewUserFromJson(Map<String, dynamic> json) => _ReviewUser(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  phone: json['phone'],
  image: json['image'] as String?,
);

Map<String, dynamic> _$ReviewUserToJson(_ReviewUser instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'image': instance.image,
    };
