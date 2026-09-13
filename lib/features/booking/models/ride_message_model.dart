// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ride_message_model.freezed.dart';
part 'ride_message_model.g.dart';

String _parseSenderId(dynamic value) {
  if (value is Map) {
    return value['_id']?.toString() ?? value['id']?.toString() ?? '';
  }
  return value?.toString() ?? '';
}

@freezed
abstract class RideMessage with _$RideMessage {
  const factory RideMessage({
    @JsonKey(name: '_id') required String id,
    required String chatId,
    required String rideId,
    @JsonKey(fromJson: _parseSenderId) required String senderId,
    required String userRole, // 'User' or 'Driver'
    required String message,
    @Default('text') String messageType, // 'text' or 'image'
    required DateTime createdAt,
    @Default('delivered') String status, // 'sent', 'delivered', 'failed' (optimistic UI)
  }) = _RideMessage;

  factory RideMessage.fromJson(Map<String, dynamic> json) => _$RideMessageFromJson(json);

  factory RideMessage.fromRawJson(Map<String, dynamic> json) {
    final tempJson = Map<String, dynamic>.from(json);

    // Map timestamp to createdAt if missing
    if (tempJson['timestamp'] != null && tempJson['createdAt'] == null) {
      tempJson['createdAt'] = tempJson['timestamp'];
    }
    if (tempJson['createdAt'] == null) {
      tempJson['createdAt'] = DateTime.now().toIso8601String();
    }

    // Map id to _id if missing
    if (tempJson['id'] != null && tempJson['_id'] == null) {
      tempJson['_id'] = tempJson['id'];
    }
    if (tempJson['_id'] == null) {
      tempJson['_id'] = 'msg_${DateTime.now().millisecondsSinceEpoch}_${tempJson['message']?.hashCode}';
    }

    // Fill defaults for non-nullable/required model properties
    tempJson['chatId'] ??= '';
    tempJson['rideId'] ??= '';
    tempJson['userRole'] ??= 'User';
    tempJson['message'] ??= '';

    return RideMessage.fromJson(tempJson);
  }
}
