// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SupportTicket {

@JsonKey(name: '_id') String get id; String get ticketNumber;@JsonKey(fromJson: _parseUserId) String get userId; String get category; String get subject; String get priority; String get status; String? get relatedOrderId; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of SupportTicket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupportTicketCopyWith<SupportTicket> get copyWith => _$SupportTicketCopyWithImpl<SupportTicket>(this as SupportTicket, _$identity);

  /// Serializes this SupportTicket to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupportTicket&&(identical(other.id, id) || other.id == id)&&(identical(other.ticketNumber, ticketNumber) || other.ticketNumber == ticketNumber)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.category, category) || other.category == category)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.status, status) || other.status == status)&&(identical(other.relatedOrderId, relatedOrderId) || other.relatedOrderId == relatedOrderId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ticketNumber,userId,category,subject,priority,status,relatedOrderId,createdAt,updatedAt);

@override
String toString() {
  return 'SupportTicket(id: $id, ticketNumber: $ticketNumber, userId: $userId, category: $category, subject: $subject, priority: $priority, status: $status, relatedOrderId: $relatedOrderId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SupportTicketCopyWith<$Res>  {
  factory $SupportTicketCopyWith(SupportTicket value, $Res Function(SupportTicket) _then) = _$SupportTicketCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String ticketNumber,@JsonKey(fromJson: _parseUserId) String userId, String category, String subject, String priority, String status, String? relatedOrderId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$SupportTicketCopyWithImpl<$Res>
    implements $SupportTicketCopyWith<$Res> {
  _$SupportTicketCopyWithImpl(this._self, this._then);

  final SupportTicket _self;
  final $Res Function(SupportTicket) _then;

/// Create a copy of SupportTicket
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ticketNumber = null,Object? userId = null,Object? category = null,Object? subject = null,Object? priority = null,Object? status = null,Object? relatedOrderId = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ticketNumber: null == ticketNumber ? _self.ticketNumber : ticketNumber // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,relatedOrderId: freezed == relatedOrderId ? _self.relatedOrderId : relatedOrderId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SupportTicket].
extension SupportTicketPatterns on SupportTicket {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupportTicket value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupportTicket() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupportTicket value)  $default,){
final _that = this;
switch (_that) {
case _SupportTicket():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupportTicket value)?  $default,){
final _that = this;
switch (_that) {
case _SupportTicket() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String ticketNumber, @JsonKey(fromJson: _parseUserId)  String userId,  String category,  String subject,  String priority,  String status,  String? relatedOrderId,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupportTicket() when $default != null:
return $default(_that.id,_that.ticketNumber,_that.userId,_that.category,_that.subject,_that.priority,_that.status,_that.relatedOrderId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String ticketNumber, @JsonKey(fromJson: _parseUserId)  String userId,  String category,  String subject,  String priority,  String status,  String? relatedOrderId,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SupportTicket():
return $default(_that.id,_that.ticketNumber,_that.userId,_that.category,_that.subject,_that.priority,_that.status,_that.relatedOrderId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String ticketNumber, @JsonKey(fromJson: _parseUserId)  String userId,  String category,  String subject,  String priority,  String status,  String? relatedOrderId,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SupportTicket() when $default != null:
return $default(_that.id,_that.ticketNumber,_that.userId,_that.category,_that.subject,_that.priority,_that.status,_that.relatedOrderId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupportTicket implements SupportTicket {
  const _SupportTicket({@JsonKey(name: '_id') required this.id, required this.ticketNumber, @JsonKey(fromJson: _parseUserId) required this.userId, required this.category, required this.subject, this.priority = 'low', this.status = 'open', this.relatedOrderId, required this.createdAt, required this.updatedAt});
  factory _SupportTicket.fromJson(Map<String, dynamic> json) => _$SupportTicketFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String ticketNumber;
@override@JsonKey(fromJson: _parseUserId) final  String userId;
@override final  String category;
@override final  String subject;
@override@JsonKey() final  String priority;
@override@JsonKey() final  String status;
@override final  String? relatedOrderId;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of SupportTicket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportTicketCopyWith<_SupportTicket> get copyWith => __$SupportTicketCopyWithImpl<_SupportTicket>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupportTicketToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportTicket&&(identical(other.id, id) || other.id == id)&&(identical(other.ticketNumber, ticketNumber) || other.ticketNumber == ticketNumber)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.category, category) || other.category == category)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.status, status) || other.status == status)&&(identical(other.relatedOrderId, relatedOrderId) || other.relatedOrderId == relatedOrderId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ticketNumber,userId,category,subject,priority,status,relatedOrderId,createdAt,updatedAt);

@override
String toString() {
  return 'SupportTicket(id: $id, ticketNumber: $ticketNumber, userId: $userId, category: $category, subject: $subject, priority: $priority, status: $status, relatedOrderId: $relatedOrderId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SupportTicketCopyWith<$Res> implements $SupportTicketCopyWith<$Res> {
  factory _$SupportTicketCopyWith(_SupportTicket value, $Res Function(_SupportTicket) _then) = __$SupportTicketCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String ticketNumber,@JsonKey(fromJson: _parseUserId) String userId, String category, String subject, String priority, String status, String? relatedOrderId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$SupportTicketCopyWithImpl<$Res>
    implements _$SupportTicketCopyWith<$Res> {
  __$SupportTicketCopyWithImpl(this._self, this._then);

  final _SupportTicket _self;
  final $Res Function(_SupportTicket) _then;

/// Create a copy of SupportTicket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ticketNumber = null,Object? userId = null,Object? category = null,Object? subject = null,Object? priority = null,Object? status = null,Object? relatedOrderId = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_SupportTicket(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ticketNumber: null == ticketNumber ? _self.ticketNumber : ticketNumber // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,relatedOrderId: freezed == relatedOrderId ? _self.relatedOrderId : relatedOrderId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$SupportTicketResponse {

 bool get success; String get message; bool? get isNew; SupportTicket get data;
/// Create a copy of SupportTicketResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupportTicketResponseCopyWith<SupportTicketResponse> get copyWith => _$SupportTicketResponseCopyWithImpl<SupportTicketResponse>(this as SupportTicketResponse, _$identity);

  /// Serializes this SupportTicketResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupportTicketResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.isNew, isNew) || other.isNew == isNew)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,isNew,data);

@override
String toString() {
  return 'SupportTicketResponse(success: $success, message: $message, isNew: $isNew, data: $data)';
}


}

/// @nodoc
abstract mixin class $SupportTicketResponseCopyWith<$Res>  {
  factory $SupportTicketResponseCopyWith(SupportTicketResponse value, $Res Function(SupportTicketResponse) _then) = _$SupportTicketResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, bool? isNew, SupportTicket data
});


$SupportTicketCopyWith<$Res> get data;

}
/// @nodoc
class _$SupportTicketResponseCopyWithImpl<$Res>
    implements $SupportTicketResponseCopyWith<$Res> {
  _$SupportTicketResponseCopyWithImpl(this._self, this._then);

  final SupportTicketResponse _self;
  final $Res Function(SupportTicketResponse) _then;

/// Create a copy of SupportTicketResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? isNew = freezed,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isNew: freezed == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SupportTicket,
  ));
}
/// Create a copy of SupportTicketResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SupportTicketCopyWith<$Res> get data {
  
  return $SupportTicketCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [SupportTicketResponse].
extension SupportTicketResponsePatterns on SupportTicketResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupportTicketResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupportTicketResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupportTicketResponse value)  $default,){
final _that = this;
switch (_that) {
case _SupportTicketResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupportTicketResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SupportTicketResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  bool? isNew,  SupportTicket data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupportTicketResponse() when $default != null:
return $default(_that.success,_that.message,_that.isNew,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  bool? isNew,  SupportTicket data)  $default,) {final _that = this;
switch (_that) {
case _SupportTicketResponse():
return $default(_that.success,_that.message,_that.isNew,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  bool? isNew,  SupportTicket data)?  $default,) {final _that = this;
switch (_that) {
case _SupportTicketResponse() when $default != null:
return $default(_that.success,_that.message,_that.isNew,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupportTicketResponse implements SupportTicketResponse {
  const _SupportTicketResponse({required this.success, required this.message, this.isNew, required this.data});
  factory _SupportTicketResponse.fromJson(Map<String, dynamic> json) => _$SupportTicketResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override final  bool? isNew;
@override final  SupportTicket data;

/// Create a copy of SupportTicketResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportTicketResponseCopyWith<_SupportTicketResponse> get copyWith => __$SupportTicketResponseCopyWithImpl<_SupportTicketResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupportTicketResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportTicketResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.isNew, isNew) || other.isNew == isNew)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,isNew,data);

@override
String toString() {
  return 'SupportTicketResponse(success: $success, message: $message, isNew: $isNew, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SupportTicketResponseCopyWith<$Res> implements $SupportTicketResponseCopyWith<$Res> {
  factory _$SupportTicketResponseCopyWith(_SupportTicketResponse value, $Res Function(_SupportTicketResponse) _then) = __$SupportTicketResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, bool? isNew, SupportTicket data
});


@override $SupportTicketCopyWith<$Res> get data;

}
/// @nodoc
class __$SupportTicketResponseCopyWithImpl<$Res>
    implements _$SupportTicketResponseCopyWith<$Res> {
  __$SupportTicketResponseCopyWithImpl(this._self, this._then);

  final _SupportTicketResponse _self;
  final $Res Function(_SupportTicketResponse) _then;

/// Create a copy of SupportTicketResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? isNew = freezed,Object? data = null,}) {
  return _then(_SupportTicketResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isNew: freezed == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SupportTicket,
  ));
}

/// Create a copy of SupportTicketResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SupportTicketCopyWith<$Res> get data {
  
  return $SupportTicketCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$SupportTicketListResponse {

 bool get success;@JsonKey(readValue: _readTickets) List<SupportTicket> get data;
/// Create a copy of SupportTicketListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupportTicketListResponseCopyWith<SupportTicketListResponse> get copyWith => _$SupportTicketListResponseCopyWithImpl<SupportTicketListResponse>(this as SupportTicketListResponse, _$identity);

  /// Serializes this SupportTicketListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupportTicketListResponse&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'SupportTicketListResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $SupportTicketListResponseCopyWith<$Res>  {
  factory $SupportTicketListResponseCopyWith(SupportTicketListResponse value, $Res Function(SupportTicketListResponse) _then) = _$SupportTicketListResponseCopyWithImpl;
@useResult
$Res call({
 bool success,@JsonKey(readValue: _readTickets) List<SupportTicket> data
});




}
/// @nodoc
class _$SupportTicketListResponseCopyWithImpl<$Res>
    implements $SupportTicketListResponseCopyWith<$Res> {
  _$SupportTicketListResponseCopyWithImpl(this._self, this._then);

  final SupportTicketListResponse _self;
  final $Res Function(SupportTicketListResponse) _then;

/// Create a copy of SupportTicketListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<SupportTicket>,
  ));
}

}


/// Adds pattern-matching-related methods to [SupportTicketListResponse].
extension SupportTicketListResponsePatterns on SupportTicketListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupportTicketListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupportTicketListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupportTicketListResponse value)  $default,){
final _that = this;
switch (_that) {
case _SupportTicketListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupportTicketListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SupportTicketListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success, @JsonKey(readValue: _readTickets)  List<SupportTicket> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupportTicketListResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success, @JsonKey(readValue: _readTickets)  List<SupportTicket> data)  $default,) {final _that = this;
switch (_that) {
case _SupportTicketListResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success, @JsonKey(readValue: _readTickets)  List<SupportTicket> data)?  $default,) {final _that = this;
switch (_that) {
case _SupportTicketListResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupportTicketListResponse implements SupportTicketListResponse {
  const _SupportTicketListResponse({required this.success, @JsonKey(readValue: _readTickets) required final  List<SupportTicket> data}): _data = data;
  factory _SupportTicketListResponse.fromJson(Map<String, dynamic> json) => _$SupportTicketListResponseFromJson(json);

@override final  bool success;
 final  List<SupportTicket> _data;
@override@JsonKey(readValue: _readTickets) List<SupportTicket> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of SupportTicketListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportTicketListResponseCopyWith<_SupportTicketListResponse> get copyWith => __$SupportTicketListResponseCopyWithImpl<_SupportTicketListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupportTicketListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportTicketListResponse&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'SupportTicketListResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SupportTicketListResponseCopyWith<$Res> implements $SupportTicketListResponseCopyWith<$Res> {
  factory _$SupportTicketListResponseCopyWith(_SupportTicketListResponse value, $Res Function(_SupportTicketListResponse) _then) = __$SupportTicketListResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success,@JsonKey(readValue: _readTickets) List<SupportTicket> data
});




}
/// @nodoc
class __$SupportTicketListResponseCopyWithImpl<$Res>
    implements _$SupportTicketListResponseCopyWith<$Res> {
  __$SupportTicketListResponseCopyWithImpl(this._self, this._then);

  final _SupportTicketListResponse _self;
  final $Res Function(_SupportTicketListResponse) _then;

/// Create a copy of SupportTicketListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = null,}) {
  return _then(_SupportTicketListResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<SupportTicket>,
  ));
}


}

// dart format on
