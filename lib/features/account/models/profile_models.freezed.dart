// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetUserResponse {

 bool get success; String get message;@JsonKey(name: 'driver') DriverModel? get user;
/// Create a copy of GetUserResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetUserResponseCopyWith<GetUserResponse> get copyWith => _$GetUserResponseCopyWithImpl<GetUserResponse>(this as GetUserResponse, _$identity);

  /// Serializes this GetUserResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetUserResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,user);

@override
String toString() {
  return 'GetUserResponse(success: $success, message: $message, user: $user)';
}


}

/// @nodoc
abstract mixin class $GetUserResponseCopyWith<$Res>  {
  factory $GetUserResponseCopyWith(GetUserResponse value, $Res Function(GetUserResponse) _then) = _$GetUserResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message,@JsonKey(name: 'driver') DriverModel? user
});


$DriverModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$GetUserResponseCopyWithImpl<$Res>
    implements $GetUserResponseCopyWith<$Res> {
  _$GetUserResponseCopyWithImpl(this._self, this._then);

  final GetUserResponse _self;
  final $Res Function(GetUserResponse) _then;

/// Create a copy of GetUserResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? user = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as DriverModel?,
  ));
}
/// Create a copy of GetUserResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $DriverModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [GetUserResponse].
extension GetUserResponsePatterns on GetUserResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetUserResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetUserResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetUserResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetUserResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetUserResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetUserResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message, @JsonKey(name: 'driver')  DriverModel? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetUserResponse() when $default != null:
return $default(_that.success,_that.message,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message, @JsonKey(name: 'driver')  DriverModel? user)  $default,) {final _that = this;
switch (_that) {
case _GetUserResponse():
return $default(_that.success,_that.message,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message, @JsonKey(name: 'driver')  DriverModel? user)?  $default,) {final _that = this;
switch (_that) {
case _GetUserResponse() when $default != null:
return $default(_that.success,_that.message,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetUserResponse implements GetUserResponse {
  const _GetUserResponse({required this.success, required this.message, @JsonKey(name: 'driver') this.user});
  factory _GetUserResponse.fromJson(Map<String, dynamic> json) => _$GetUserResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override@JsonKey(name: 'driver') final  DriverModel? user;

/// Create a copy of GetUserResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetUserResponseCopyWith<_GetUserResponse> get copyWith => __$GetUserResponseCopyWithImpl<_GetUserResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetUserResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetUserResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,user);

@override
String toString() {
  return 'GetUserResponse(success: $success, message: $message, user: $user)';
}


}

/// @nodoc
abstract mixin class _$GetUserResponseCopyWith<$Res> implements $GetUserResponseCopyWith<$Res> {
  factory _$GetUserResponseCopyWith(_GetUserResponse value, $Res Function(_GetUserResponse) _then) = __$GetUserResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message,@JsonKey(name: 'driver') DriverModel? user
});


@override $DriverModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$GetUserResponseCopyWithImpl<$Res>
    implements _$GetUserResponseCopyWith<$Res> {
  __$GetUserResponseCopyWithImpl(this._self, this._then);

  final _GetUserResponse _self;
  final $Res Function(_GetUserResponse) _then;

/// Create a copy of GetUserResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? user = freezed,}) {
  return _then(_GetUserResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as DriverModel?,
  ));
}

/// Create a copy of GetUserResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $DriverModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$UpdateProfileResponse {

 bool get success; String get message;@JsonKey(name: 'driver') DriverModel? get user;
/// Create a copy of UpdateProfileResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfileResponseCopyWith<UpdateProfileResponse> get copyWith => _$UpdateProfileResponseCopyWithImpl<UpdateProfileResponse>(this as UpdateProfileResponse, _$identity);

  /// Serializes this UpdateProfileResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,user);

@override
String toString() {
  return 'UpdateProfileResponse(success: $success, message: $message, user: $user)';
}


}

/// @nodoc
abstract mixin class $UpdateProfileResponseCopyWith<$Res>  {
  factory $UpdateProfileResponseCopyWith(UpdateProfileResponse value, $Res Function(UpdateProfileResponse) _then) = _$UpdateProfileResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message,@JsonKey(name: 'driver') DriverModel? user
});


$DriverModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$UpdateProfileResponseCopyWithImpl<$Res>
    implements $UpdateProfileResponseCopyWith<$Res> {
  _$UpdateProfileResponseCopyWithImpl(this._self, this._then);

  final UpdateProfileResponse _self;
  final $Res Function(UpdateProfileResponse) _then;

/// Create a copy of UpdateProfileResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? user = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as DriverModel?,
  ));
}
/// Create a copy of UpdateProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $DriverModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [UpdateProfileResponse].
extension UpdateProfileResponsePatterns on UpdateProfileResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateProfileResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateProfileResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateProfileResponse value)  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateProfileResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message, @JsonKey(name: 'driver')  DriverModel? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateProfileResponse() when $default != null:
return $default(_that.success,_that.message,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message, @JsonKey(name: 'driver')  DriverModel? user)  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileResponse():
return $default(_that.success,_that.message,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message, @JsonKey(name: 'driver')  DriverModel? user)?  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileResponse() when $default != null:
return $default(_that.success,_that.message,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateProfileResponse implements UpdateProfileResponse {
  const _UpdateProfileResponse({required this.success, required this.message, @JsonKey(name: 'driver') this.user});
  factory _UpdateProfileResponse.fromJson(Map<String, dynamic> json) => _$UpdateProfileResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override@JsonKey(name: 'driver') final  DriverModel? user;

/// Create a copy of UpdateProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProfileResponseCopyWith<_UpdateProfileResponse> get copyWith => __$UpdateProfileResponseCopyWithImpl<_UpdateProfileResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateProfileResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfileResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,user);

@override
String toString() {
  return 'UpdateProfileResponse(success: $success, message: $message, user: $user)';
}


}

/// @nodoc
abstract mixin class _$UpdateProfileResponseCopyWith<$Res> implements $UpdateProfileResponseCopyWith<$Res> {
  factory _$UpdateProfileResponseCopyWith(_UpdateProfileResponse value, $Res Function(_UpdateProfileResponse) _then) = __$UpdateProfileResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message,@JsonKey(name: 'driver') DriverModel? user
});


@override $DriverModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$UpdateProfileResponseCopyWithImpl<$Res>
    implements _$UpdateProfileResponseCopyWith<$Res> {
  __$UpdateProfileResponseCopyWithImpl(this._self, this._then);

  final _UpdateProfileResponse _self;
  final $Res Function(_UpdateProfileResponse) _then;

/// Create a copy of UpdateProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? user = freezed,}) {
  return _then(_UpdateProfileResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as DriverModel?,
  ));
}

/// Create a copy of UpdateProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $DriverModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
