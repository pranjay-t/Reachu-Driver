// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupportTicket _$SupportTicketFromJson(Map<String, dynamic> json) =>
    _SupportTicket(
      id: json['_id'] as String,
      ticketNumber: json['ticketNumber'] as String,
      userId: _parseUserId(json['userId']),
      category: json['category'] as String,
      subject: json['subject'] as String,
      priority: json['priority'] as String? ?? 'low',
      status: json['status'] as String? ?? 'open',
      relatedOrderId: json['relatedOrderId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$SupportTicketToJson(_SupportTicket instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'ticketNumber': instance.ticketNumber,
      'userId': instance.userId,
      'category': instance.category,
      'subject': instance.subject,
      'priority': instance.priority,
      'status': instance.status,
      'relatedOrderId': instance.relatedOrderId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_SupportTicketResponse _$SupportTicketResponseFromJson(
  Map<String, dynamic> json,
) => _SupportTicketResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  isNew: json['isNew'] as bool?,
  data: SupportTicket.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SupportTicketResponseToJson(
  _SupportTicketResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'isNew': instance.isNew,
  'data': instance.data,
};

_SupportTicketListResponse _$SupportTicketListResponseFromJson(
  Map<String, dynamic> json,
) => _SupportTicketListResponse(
  success: json['success'] as bool,
  data: (_readTickets(json, 'data') as List<dynamic>)
      .map((e) => SupportTicket.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SupportTicketListResponseToJson(
  _SupportTicketListResponse instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};
