// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_model.freezed.dart';
part 'ticket_model.g.dart';

String _parseUserId(dynamic value) {
  if (value is Map) {
    return value['_id']?.toString() ?? value['id']?.toString() ?? '';
  }
  return value?.toString() ?? '';
}

@freezed
abstract class SupportTicket with _$SupportTicket {
  const factory SupportTicket({
    @JsonKey(name: '_id') required String id,
    required String ticketNumber,
    @JsonKey(fromJson: _parseUserId) required String userId,
    required String category,
    required String subject,
    @Default('low') String priority,
    @Default('open') String status,
    String? relatedOrderId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SupportTicket;

  factory SupportTicket.fromJson(Map<String, dynamic> json) => _$SupportTicketFromJson(json);
}

@freezed
abstract class SupportTicketResponse with _$SupportTicketResponse {
  const factory SupportTicketResponse({
    required bool success,
    required String message,
    bool? isNew,
    required SupportTicket data,
  }) = _SupportTicketResponse;

  factory SupportTicketResponse.fromJson(Map<String, dynamic> json) =>
      _$SupportTicketResponseFromJson(json);
}

Object? _readTickets(Map json, String key) {
  return json['tickets'] ?? json['data'];
}

@freezed
abstract class SupportTicketListResponse with _$SupportTicketListResponse {
  const factory SupportTicketListResponse({
    required bool success,
    @JsonKey(readValue: _readTickets) required List<SupportTicket> data,
  }) = _SupportTicketListResponse;

  factory SupportTicketListResponse.fromJson(Map<String, dynamic> json) =>
      _$SupportTicketListResponseFromJson(json);
}
