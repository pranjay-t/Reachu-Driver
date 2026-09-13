// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupportMessage _$SupportMessageFromJson(Map<String, dynamic> json) =>
    _SupportMessage(
      id: json['_id'] as String,
      ticketId: json['ticketId'] as String,
      senderId: _parseSenderId(json['senderId']),
      senderType: json['senderType'] as String,
      message: json['message'] as String,
      messageType: json['messageType'] as String? ?? 'text',
      isSystem: json['isSystem'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: json['status'] as String? ?? 'delivered',
    );

Map<String, dynamic> _$SupportMessageToJson(_SupportMessage instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'ticketId': instance.ticketId,
      'senderId': instance.senderId,
      'senderType': instance.senderType,
      'message': instance.message,
      'messageType': instance.messageType,
      'isSystem': instance.isSystem,
      'createdAt': instance.createdAt.toIso8601String(),
      'status': instance.status,
    };

_SupportMessageListResponse _$SupportMessageListResponseFromJson(
  Map<String, dynamic> json,
) => _SupportMessageListResponse(
  success: json['success'] as bool,
  data: (_readMessages(json, 'data') as List<dynamic>)
      .map((e) => SupportMessage.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SupportMessageListResponseToJson(
  _SupportMessageListResponse instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};
