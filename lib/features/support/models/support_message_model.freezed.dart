// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SupportMessage {

@JsonKey(name: '_id') String get id; String get ticketId;@JsonKey(fromJson: _parseSenderId) String get senderId; String get senderType;// 'user' or 'agent'
 String get message; String get messageType;// 'text' or 'image'
 bool get isSystem; DateTime get createdAt; String get status;
/// Create a copy of SupportMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupportMessageCopyWith<SupportMessage> get copyWith => _$SupportMessageCopyWithImpl<SupportMessage>(this as SupportMessage, _$identity);

  /// Serializes this SupportMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupportMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.ticketId, ticketId) || other.ticketId == ticketId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.senderType, senderType) || other.senderType == senderType)&&(identical(other.message, message) || other.message == message)&&(identical(other.messageType, messageType) || other.messageType == messageType)&&(identical(other.isSystem, isSystem) || other.isSystem == isSystem)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ticketId,senderId,senderType,message,messageType,isSystem,createdAt,status);

@override
String toString() {
  return 'SupportMessage(id: $id, ticketId: $ticketId, senderId: $senderId, senderType: $senderType, message: $message, messageType: $messageType, isSystem: $isSystem, createdAt: $createdAt, status: $status)';
}


}

/// @nodoc
abstract mixin class $SupportMessageCopyWith<$Res>  {
  factory $SupportMessageCopyWith(SupportMessage value, $Res Function(SupportMessage) _then) = _$SupportMessageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String ticketId,@JsonKey(fromJson: _parseSenderId) String senderId, String senderType, String message, String messageType, bool isSystem, DateTime createdAt, String status
});




}
/// @nodoc
class _$SupportMessageCopyWithImpl<$Res>
    implements $SupportMessageCopyWith<$Res> {
  _$SupportMessageCopyWithImpl(this._self, this._then);

  final SupportMessage _self;
  final $Res Function(SupportMessage) _then;

/// Create a copy of SupportMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ticketId = null,Object? senderId = null,Object? senderType = null,Object? message = null,Object? messageType = null,Object? isSystem = null,Object? createdAt = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ticketId: null == ticketId ? _self.ticketId : ticketId // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,senderType: null == senderType ? _self.senderType : senderType // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,messageType: null == messageType ? _self.messageType : messageType // ignore: cast_nullable_to_non_nullable
as String,isSystem: null == isSystem ? _self.isSystem : isSystem // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SupportMessage].
extension SupportMessagePatterns on SupportMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupportMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupportMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupportMessage value)  $default,){
final _that = this;
switch (_that) {
case _SupportMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupportMessage value)?  $default,){
final _that = this;
switch (_that) {
case _SupportMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String ticketId, @JsonKey(fromJson: _parseSenderId)  String senderId,  String senderType,  String message,  String messageType,  bool isSystem,  DateTime createdAt,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupportMessage() when $default != null:
return $default(_that.id,_that.ticketId,_that.senderId,_that.senderType,_that.message,_that.messageType,_that.isSystem,_that.createdAt,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String ticketId, @JsonKey(fromJson: _parseSenderId)  String senderId,  String senderType,  String message,  String messageType,  bool isSystem,  DateTime createdAt,  String status)  $default,) {final _that = this;
switch (_that) {
case _SupportMessage():
return $default(_that.id,_that.ticketId,_that.senderId,_that.senderType,_that.message,_that.messageType,_that.isSystem,_that.createdAt,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String ticketId, @JsonKey(fromJson: _parseSenderId)  String senderId,  String senderType,  String message,  String messageType,  bool isSystem,  DateTime createdAt,  String status)?  $default,) {final _that = this;
switch (_that) {
case _SupportMessage() when $default != null:
return $default(_that.id,_that.ticketId,_that.senderId,_that.senderType,_that.message,_that.messageType,_that.isSystem,_that.createdAt,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupportMessage implements SupportMessage {
  const _SupportMessage({@JsonKey(name: '_id') required this.id, required this.ticketId, @JsonKey(fromJson: _parseSenderId) required this.senderId, required this.senderType, required this.message, this.messageType = 'text', this.isSystem = false, required this.createdAt, this.status = 'delivered'});
  factory _SupportMessage.fromJson(Map<String, dynamic> json) => _$SupportMessageFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String ticketId;
@override@JsonKey(fromJson: _parseSenderId) final  String senderId;
@override final  String senderType;
// 'user' or 'agent'
@override final  String message;
@override@JsonKey() final  String messageType;
// 'text' or 'image'
@override@JsonKey() final  bool isSystem;
@override final  DateTime createdAt;
@override@JsonKey() final  String status;

/// Create a copy of SupportMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportMessageCopyWith<_SupportMessage> get copyWith => __$SupportMessageCopyWithImpl<_SupportMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupportMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.ticketId, ticketId) || other.ticketId == ticketId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.senderType, senderType) || other.senderType == senderType)&&(identical(other.message, message) || other.message == message)&&(identical(other.messageType, messageType) || other.messageType == messageType)&&(identical(other.isSystem, isSystem) || other.isSystem == isSystem)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ticketId,senderId,senderType,message,messageType,isSystem,createdAt,status);

@override
String toString() {
  return 'SupportMessage(id: $id, ticketId: $ticketId, senderId: $senderId, senderType: $senderType, message: $message, messageType: $messageType, isSystem: $isSystem, createdAt: $createdAt, status: $status)';
}


}

/// @nodoc
abstract mixin class _$SupportMessageCopyWith<$Res> implements $SupportMessageCopyWith<$Res> {
  factory _$SupportMessageCopyWith(_SupportMessage value, $Res Function(_SupportMessage) _then) = __$SupportMessageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String ticketId,@JsonKey(fromJson: _parseSenderId) String senderId, String senderType, String message, String messageType, bool isSystem, DateTime createdAt, String status
});




}
/// @nodoc
class __$SupportMessageCopyWithImpl<$Res>
    implements _$SupportMessageCopyWith<$Res> {
  __$SupportMessageCopyWithImpl(this._self, this._then);

  final _SupportMessage _self;
  final $Res Function(_SupportMessage) _then;

/// Create a copy of SupportMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ticketId = null,Object? senderId = null,Object? senderType = null,Object? message = null,Object? messageType = null,Object? isSystem = null,Object? createdAt = null,Object? status = null,}) {
  return _then(_SupportMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ticketId: null == ticketId ? _self.ticketId : ticketId // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,senderType: null == senderType ? _self.senderType : senderType // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,messageType: null == messageType ? _self.messageType : messageType // ignore: cast_nullable_to_non_nullable
as String,isSystem: null == isSystem ? _self.isSystem : isSystem // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SupportMessageListResponse {

 bool get success;@JsonKey(readValue: _readMessages) List<SupportMessage> get data;
/// Create a copy of SupportMessageListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupportMessageListResponseCopyWith<SupportMessageListResponse> get copyWith => _$SupportMessageListResponseCopyWithImpl<SupportMessageListResponse>(this as SupportMessageListResponse, _$identity);

  /// Serializes this SupportMessageListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupportMessageListResponse&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'SupportMessageListResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $SupportMessageListResponseCopyWith<$Res>  {
  factory $SupportMessageListResponseCopyWith(SupportMessageListResponse value, $Res Function(SupportMessageListResponse) _then) = _$SupportMessageListResponseCopyWithImpl;
@useResult
$Res call({
 bool success,@JsonKey(readValue: _readMessages) List<SupportMessage> data
});




}
/// @nodoc
class _$SupportMessageListResponseCopyWithImpl<$Res>
    implements $SupportMessageListResponseCopyWith<$Res> {
  _$SupportMessageListResponseCopyWithImpl(this._self, this._then);

  final SupportMessageListResponse _self;
  final $Res Function(SupportMessageListResponse) _then;

/// Create a copy of SupportMessageListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<SupportMessage>,
  ));
}

}


/// Adds pattern-matching-related methods to [SupportMessageListResponse].
extension SupportMessageListResponsePatterns on SupportMessageListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupportMessageListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupportMessageListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupportMessageListResponse value)  $default,){
final _that = this;
switch (_that) {
case _SupportMessageListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupportMessageListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SupportMessageListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success, @JsonKey(readValue: _readMessages)  List<SupportMessage> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupportMessageListResponse() when $default != null:
return $default(_that.success,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success, @JsonKey(readValue: _readMessages)  List<SupportMessage> data)  $default,) {final _that = this;
switch (_that) {
case _SupportMessageListResponse():
return $default(_that.success,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success, @JsonKey(readValue: _readMessages)  List<SupportMessage> data)?  $default,) {final _that = this;
switch (_that) {
case _SupportMessageListResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupportMessageListResponse implements SupportMessageListResponse {
  const _SupportMessageListResponse({required this.success, @JsonKey(readValue: _readMessages) required final  List<SupportMessage> data}): _data = data;
  factory _SupportMessageListResponse.fromJson(Map<String, dynamic> json) => _$SupportMessageListResponseFromJson(json);

@override final  bool success;
 final  List<SupportMessage> _data;
@override@JsonKey(readValue: _readMessages) List<SupportMessage> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of SupportMessageListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportMessageListResponseCopyWith<_SupportMessageListResponse> get copyWith => __$SupportMessageListResponseCopyWithImpl<_SupportMessageListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupportMessageListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportMessageListResponse&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'SupportMessageListResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SupportMessageListResponseCopyWith<$Res> implements $SupportMessageListResponseCopyWith<$Res> {
  factory _$SupportMessageListResponseCopyWith(_SupportMessageListResponse value, $Res Function(_SupportMessageListResponse) _then) = __$SupportMessageListResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success,@JsonKey(readValue: _readMessages) List<SupportMessage> data
});




}
/// @nodoc
class __$SupportMessageListResponseCopyWithImpl<$Res>
    implements _$SupportMessageListResponseCopyWith<$Res> {
  __$SupportMessageListResponseCopyWithImpl(this._self, this._then);

  final _SupportMessageListResponse _self;
  final $Res Function(_SupportMessageListResponse) _then;

/// Create a copy of SupportMessageListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = null,}) {
  return _then(_SupportMessageListResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<SupportMessage>,
  ));
}


}

// dart format on
