// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RideMessage _$RideMessageFromJson(Map<String, dynamic> json) => _RideMessage(
  id: json['_id'] as String,
  chatId: json['chatId'] as String,
  rideId: json['rideId'] as String,
  senderId: _parseSenderId(json['senderId']),
  userRole: json['userRole'] as String,
  message: json['message'] as String,
  messageType: json['messageType'] as String? ?? 'text',
  createdAt: DateTime.parse(json['createdAt'] as String),
  status: json['status'] as String? ?? 'delivered',
);

Map<String, dynamic> _$RideMessageToJson(_RideMessage instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'chatId': instance.chatId,
      'rideId': instance.rideId,
      'senderId': instance.senderId,
      'userRole': instance.userRole,
      'message': instance.message,
      'messageType': instance.messageType,
      'createdAt': instance.createdAt.toIso8601String(),
      'status': instance.status,
    };
