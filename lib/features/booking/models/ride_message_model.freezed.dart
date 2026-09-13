// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ride_message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RideMessage {

@JsonKey(name: '_id') String get id; String get chatId; String get rideId;@JsonKey(fromJson: _parseSenderId) String get senderId; String get userRole;// 'User' or 'Driver'
 String get message; String get messageType;// 'text' or 'image'
 DateTime get createdAt; String get status;
/// Create a copy of RideMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RideMessageCopyWith<RideMessage> get copyWith => _$RideMessageCopyWithImpl<RideMessage>(this as RideMessage, _$identity);

  /// Serializes this RideMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RideMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.rideId, rideId) || other.rideId == rideId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.userRole, userRole) || other.userRole == userRole)&&(identical(other.message, message) || other.message == message)&&(identical(other.messageType, messageType) || other.messageType == messageType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,chatId,rideId,senderId,userRole,message,messageType,createdAt,status);

@override
String toString() {
  return 'RideMessage(id: $id, chatId: $chatId, rideId: $rideId, senderId: $senderId, userRole: $userRole, message: $message, messageType: $messageType, createdAt: $createdAt, status: $status)';
}


}

/// @nodoc
abstract mixin class $RideMessageCopyWith<$Res>  {
  factory $RideMessageCopyWith(RideMessage value, $Res Function(RideMessage) _then) = _$RideMessageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String chatId, String rideId,@JsonKey(fromJson: _parseSenderId) String senderId, String userRole, String message, String messageType, DateTime createdAt, String status
});




}
/// @nodoc
class _$RideMessageCopyWithImpl<$Res>
    implements $RideMessageCopyWith<$Res> {
  _$RideMessageCopyWithImpl(this._self, this._then);

  final RideMessage _self;
  final $Res Function(RideMessage) _then;

/// Create a copy of RideMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? chatId = null,Object? rideId = null,Object? senderId = null,Object? userRole = null,Object? message = null,Object? messageType = null,Object? createdAt = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,rideId: null == rideId ? _self.rideId : rideId // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,userRole: null == userRole ? _self.userRole : userRole // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,messageType: null == messageType ? _self.messageType : messageType // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RideMessage].
extension RideMessagePatterns on RideMessage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RideMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RideMessage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RideMessage value)  $default,){
final _that = this;
switch (_that) {
case _RideMessage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RideMessage value)?  $default,){
final _that = this;
switch (_that) {
case _RideMessage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String chatId,  String rideId, @JsonKey(fromJson: _parseSenderId)  String senderId,  String userRole,  String message,  String messageType,  DateTime createdAt,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RideMessage() when $default != null:
return $default(_that.id,_that.chatId,_that.rideId,_that.senderId,_that.userRole,_that.message,_that.messageType,_that.createdAt,_that.status);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String chatId,  String rideId, @JsonKey(fromJson: _parseSenderId)  String senderId,  String userRole,  String message,  String messageType,  DateTime createdAt,  String status)  $default,) {final _that = this;
switch (_that) {
case _RideMessage():
return $default(_that.id,_that.chatId,_that.rideId,_that.senderId,_that.userRole,_that.message,_that.messageType,_that.createdAt,_that.status);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String chatId,  String rideId, @JsonKey(fromJson: _parseSenderId)  String senderId,  String userRole,  String message,  String messageType,  DateTime createdAt,  String status)?  $default,) {final _that = this;
switch (_that) {
case _RideMessage() when $default != null:
return $default(_that.id,_that.chatId,_that.rideId,_that.senderId,_that.userRole,_that.message,_that.messageType,_that.createdAt,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RideMessage implements RideMessage {
  const _RideMessage({@JsonKey(name: '_id') required this.id, required this.chatId, required this.rideId, @JsonKey(fromJson: _parseSenderId) required this.senderId, required this.userRole, required this.message, this.messageType = 'text', required this.createdAt, this.status = 'delivered'});
  factory _RideMessage.fromJson(Map<String, dynamic> json) => _$RideMessageFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String chatId;
@override final  String rideId;
@override@JsonKey(fromJson: _parseSenderId) final  String senderId;
@override final  String userRole;
// 'User' or 'Driver'
@override final  String message;
@override@JsonKey() final  String messageType;
// 'text' or 'image'
@override final  DateTime createdAt;
@override@JsonKey() final  String status;

/// Create a copy of RideMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RideMessageCopyWith<_RideMessage> get copyWith => __$RideMessageCopyWithImpl<_RideMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RideMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RideMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.rideId, rideId) || other.rideId == rideId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.userRole, userRole) || other.userRole == userRole)&&(identical(other.message, message) || other.message == message)&&(identical(other.messageType, messageType) || other.messageType == messageType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,chatId,rideId,senderId,userRole,message,messageType,createdAt,status);

@override
String toString() {
  return 'RideMessage(id: $id, chatId: $chatId, rideId: $rideId, senderId: $senderId, userRole: $userRole, message: $message, messageType: $messageType, createdAt: $createdAt, status: $status)';
}


}

/// @nodoc
abstract mixin class _$RideMessageCopyWith<$Res> implements $RideMessageCopyWith<$Res> {
  factory _$RideMessageCopyWith(_RideMessage value, $Res Function(_RideMessage) _then) = __$RideMessageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String chatId, String rideId,@JsonKey(fromJson: _parseSenderId) String senderId, String userRole, String message, String messageType, DateTime createdAt, String status
});




}
/// @nodoc
class __$RideMessageCopyWithImpl<$Res>
    implements _$RideMessageCopyWith<$Res> {
  __$RideMessageCopyWithImpl(this._self, this._then);

  final _RideMessage _self;
  final $Res Function(_RideMessage) _then;

/// Create a copy of RideMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? chatId = null,Object? rideId = null,Object? senderId = null,Object? userRole = null,Object? message = null,Object? messageType = null,Object? createdAt = null,Object? status = null,}) {
  return _then(_RideMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,rideId: null == rideId ? _self.rideId : rideId // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,userRole: null == userRole ? _self.userRole : userRole // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,messageType: null == messageType ? _self.messageType : messageType // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
