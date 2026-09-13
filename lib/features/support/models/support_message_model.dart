// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'support_message_model.freezed.dart';
part 'support_message_model.g.dart';

String _parseSenderId(dynamic value) {
  if (value is Map) {
    return value['_id']?.toString() ?? value['id']?.toString() ?? '';
  }
  return value?.toString() ?? '';
}

@freezed
abstract class SupportMessage with _$SupportMessage {
  const factory SupportMessage({
    @JsonKey(name: '_id') required String id,
    required String ticketId,
    @JsonKey(fromJson: _parseSenderId) required String senderId,
    required String senderType, // 'user' or 'agent'
    required String message,
    @Default('text') String messageType, // 'text' or 'image'
    @Default(false) bool isSystem,
    required DateTime createdAt,
    @Default('delivered') String status, // 'sent' or 'delivered' for optimistic UI
  }) = _SupportMessage;

  factory SupportMessage.fromJson(Map<String, dynamic> json) => _$SupportMessageFromJson(json);
}

Object? _readMessages(Map json, String key) {
  return json['messages'] ?? json['data'];
}

@freezed
abstract class SupportMessageListResponse with _$SupportMessageListResponse {
  const factory SupportMessageListResponse({
    required bool success,
    @JsonKey(readValue: _readMessages) required List<SupportMessage> data,
  }) = _SupportMessageListResponse;

  factory SupportMessageListResponse.fromJson(Map<String, dynamic> json) =>
      _$SupportMessageListResponseFromJson(json);
}
