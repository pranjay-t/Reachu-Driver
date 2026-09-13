// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginRequest {

 String get phone; String? get appSignature;
/// Create a copy of LoginRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginRequestCopyWith<LoginRequest> get copyWith => _$LoginRequestCopyWithImpl<LoginRequest>(this as LoginRequest, _$identity);

  /// Serializes this LoginRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginRequest&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.appSignature, appSignature) || other.appSignature == appSignature));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,appSignature);

@override
String toString() {
  return 'LoginRequest(phone: $phone, appSignature: $appSignature)';
}


}

/// @nodoc
abstract mixin class $LoginRequestCopyWith<$Res>  {
  factory $LoginRequestCopyWith(LoginRequest value, $Res Function(LoginRequest) _then) = _$LoginRequestCopyWithImpl;
@useResult
$Res call({
 String phone, String? appSignature
});




}
/// @nodoc
class _$LoginRequestCopyWithImpl<$Res>
    implements $LoginRequestCopyWith<$Res> {
  _$LoginRequestCopyWithImpl(this._self, this._then);

  final LoginRequest _self;
  final $Res Function(LoginRequest) _then;

/// Create a copy of LoginRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = null,Object? appSignature = freezed,}) {
  return _then(_self.copyWith(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,appSignature: freezed == appSignature ? _self.appSignature : appSignature // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginRequest].
extension LoginRequestPatterns on LoginRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginRequest value)  $default,){
final _that = this;
switch (_that) {
case _LoginRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginRequest value)?  $default,){
final _that = this;
switch (_that) {
case _LoginRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phone,  String? appSignature)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginRequest() when $default != null:
return $default(_that.phone,_that.appSignature);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phone,  String? appSignature)  $default,) {final _that = this;
switch (_that) {
case _LoginRequest():
return $default(_that.phone,_that.appSignature);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phone,  String? appSignature)?  $default,) {final _that = this;
switch (_that) {
case _LoginRequest() when $default != null:
return $default(_that.phone,_that.appSignature);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginRequest implements LoginRequest {
  const _LoginRequest({required this.phone, this.appSignature});
  factory _LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);

@override final  String phone;
@override final  String? appSignature;

/// Create a copy of LoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginRequestCopyWith<_LoginRequest> get copyWith => __$LoginRequestCopyWithImpl<_LoginRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginRequest&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.appSignature, appSignature) || other.appSignature == appSignature));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,appSignature);

@override
String toString() {
  return 'LoginRequest(phone: $phone, appSignature: $appSignature)';
}


}

/// @nodoc
abstract mixin class _$LoginRequestCopyWith<$Res> implements $LoginRequestCopyWith<$Res> {
  factory _$LoginRequestCopyWith(_LoginRequest value, $Res Function(_LoginRequest) _then) = __$LoginRequestCopyWithImpl;
@override @useResult
$Res call({
 String phone, String? appSignature
});




}
/// @nodoc
class __$LoginRequestCopyWithImpl<$Res>
    implements _$LoginRequestCopyWith<$Res> {
  __$LoginRequestCopyWithImpl(this._self, this._then);

  final _LoginRequest _self;
  final $Res Function(_LoginRequest) _then;

/// Create a copy of LoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? appSignature = freezed,}) {
  return _then(_LoginRequest(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,appSignature: freezed == appSignature ? _self.appSignature : appSignature // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LoginResponse {

 bool get success; String get message;
/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginResponseCopyWith<LoginResponse> get copyWith => _$LoginResponseCopyWithImpl<LoginResponse>(this as LoginResponse, _$identity);

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'LoginResponse(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class $LoginResponseCopyWith<$Res>  {
  factory $LoginResponseCopyWith(LoginResponse value, $Res Function(LoginResponse) _then) = _$LoginResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class _$LoginResponseCopyWithImpl<$Res>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._self, this._then);

  final LoginResponse _self;
  final $Res Function(LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginResponse].
extension LoginResponsePatterns on LoginResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginResponse value)  $default,){
final _that = this;
switch (_that) {
case _LoginResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that.success,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message)  $default,) {final _that = this;
switch (_that) {
case _LoginResponse():
return $default(_that.success,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message)?  $default,) {final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that.success,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginResponse implements LoginResponse {
  const _LoginResponse({required this.success, required this.message});
  factory _LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

@override final  bool success;
@override final  String message;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginResponseCopyWith<_LoginResponse> get copyWith => __$LoginResponseCopyWithImpl<_LoginResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'LoginResponse(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class _$LoginResponseCopyWith<$Res> implements $LoginResponseCopyWith<$Res> {
  factory _$LoginResponseCopyWith(_LoginResponse value, $Res Function(_LoginResponse) _then) = __$LoginResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class __$LoginResponseCopyWithImpl<$Res>
    implements _$LoginResponseCopyWith<$Res> {
  __$LoginResponseCopyWithImpl(this._self, this._then);

  final _LoginResponse _self;
  final $Res Function(_LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,}) {
  return _then(_LoginResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$VerifyOtpRequest {

 String get phone; String get otp;
/// Create a copy of VerifyOtpRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyOtpRequestCopyWith<VerifyOtpRequest> get copyWith => _$VerifyOtpRequestCopyWithImpl<VerifyOtpRequest>(this as VerifyOtpRequest, _$identity);

  /// Serializes this VerifyOtpRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyOtpRequest&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.otp, otp) || other.otp == otp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,otp);

@override
String toString() {
  return 'VerifyOtpRequest(phone: $phone, otp: $otp)';
}


}

/// @nodoc
abstract mixin class $VerifyOtpRequestCopyWith<$Res>  {
  factory $VerifyOtpRequestCopyWith(VerifyOtpRequest value, $Res Function(VerifyOtpRequest) _then) = _$VerifyOtpRequestCopyWithImpl;
@useResult
$Res call({
 String phone, String otp
});




}
/// @nodoc
class _$VerifyOtpRequestCopyWithImpl<$Res>
    implements $VerifyOtpRequestCopyWith<$Res> {
  _$VerifyOtpRequestCopyWithImpl(this._self, this._then);

  final VerifyOtpRequest _self;
  final $Res Function(VerifyOtpRequest) _then;

/// Create a copy of VerifyOtpRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = null,Object? otp = null,}) {
  return _then(_self.copyWith(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyOtpRequest].
extension VerifyOtpRequestPatterns on VerifyOtpRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyOtpRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyOtpRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyOtpRequest value)  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyOtpRequest value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phone,  String otp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyOtpRequest() when $default != null:
return $default(_that.phone,_that.otp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phone,  String otp)  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpRequest():
return $default(_that.phone,_that.otp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phone,  String otp)?  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpRequest() when $default != null:
return $default(_that.phone,_that.otp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyOtpRequest implements VerifyOtpRequest {
  const _VerifyOtpRequest({required this.phone, required this.otp});
  factory _VerifyOtpRequest.fromJson(Map<String, dynamic> json) => _$VerifyOtpRequestFromJson(json);

@override final  String phone;
@override final  String otp;

/// Create a copy of VerifyOtpRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyOtpRequestCopyWith<_VerifyOtpRequest> get copyWith => __$VerifyOtpRequestCopyWithImpl<_VerifyOtpRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyOtpRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyOtpRequest&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.otp, otp) || other.otp == otp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,otp);

@override
String toString() {
  return 'VerifyOtpRequest(phone: $phone, otp: $otp)';
}


}

/// @nodoc
abstract mixin class _$VerifyOtpRequestCopyWith<$Res> implements $VerifyOtpRequestCopyWith<$Res> {
  factory _$VerifyOtpRequestCopyWith(_VerifyOtpRequest value, $Res Function(_VerifyOtpRequest) _then) = __$VerifyOtpRequestCopyWithImpl;
@override @useResult
$Res call({
 String phone, String otp
});




}
/// @nodoc
class __$VerifyOtpRequestCopyWithImpl<$Res>
    implements _$VerifyOtpRequestCopyWith<$Res> {
  __$VerifyOtpRequestCopyWithImpl(this._self, this._then);

  final _VerifyOtpRequest _self;
  final $Res Function(_VerifyOtpRequest) _then;

/// Create a copy of VerifyOtpRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? otp = null,}) {
  return _then(_VerifyOtpRequest(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$VerifyOtpResponse {

 bool get success; String get message; DriverModel? get user; String? get token; String? get refreshToken;
/// Create a copy of VerifyOtpResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyOtpResponseCopyWith<VerifyOtpResponse> get copyWith => _$VerifyOtpResponseCopyWithImpl<VerifyOtpResponse>(this as VerifyOtpResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyOtpResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.user, user) || other.user == user)&&(identical(other.token, token) || other.token == token)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}


@override
int get hashCode => Object.hash(runtimeType,success,message,user,token,refreshToken);

@override
String toString() {
  return 'VerifyOtpResponse(success: $success, message: $message, user: $user, token: $token, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $VerifyOtpResponseCopyWith<$Res>  {
  factory $VerifyOtpResponseCopyWith(VerifyOtpResponse value, $Res Function(VerifyOtpResponse) _then) = _$VerifyOtpResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, DriverModel? user, String? token, String? refreshToken
});


$DriverModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$VerifyOtpResponseCopyWithImpl<$Res>
    implements $VerifyOtpResponseCopyWith<$Res> {
  _$VerifyOtpResponseCopyWithImpl(this._self, this._then);

  final VerifyOtpResponse _self;
  final $Res Function(VerifyOtpResponse) _then;

/// Create a copy of VerifyOtpResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? user = freezed,Object? token = freezed,Object? refreshToken = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as DriverModel?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of VerifyOtpResponse
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


/// Adds pattern-matching-related methods to [VerifyOtpResponse].
extension VerifyOtpResponsePatterns on VerifyOtpResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyOtpResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyOtpResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyOtpResponse value)  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyOtpResponse value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  DriverModel? user,  String? token,  String? refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyOtpResponse() when $default != null:
return $default(_that.success,_that.message,_that.user,_that.token,_that.refreshToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  DriverModel? user,  String? token,  String? refreshToken)  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpResponse():
return $default(_that.success,_that.message,_that.user,_that.token,_that.refreshToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  DriverModel? user,  String? token,  String? refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpResponse() when $default != null:
return $default(_that.success,_that.message,_that.user,_that.token,_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc


class _VerifyOtpResponse implements VerifyOtpResponse {
  const _VerifyOtpResponse({required this.success, required this.message, this.user, this.token, this.refreshToken});
  

@override final  bool success;
@override final  String message;
@override final  DriverModel? user;
@override final  String? token;
@override final  String? refreshToken;

/// Create a copy of VerifyOtpResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyOtpResponseCopyWith<_VerifyOtpResponse> get copyWith => __$VerifyOtpResponseCopyWithImpl<_VerifyOtpResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyOtpResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.user, user) || other.user == user)&&(identical(other.token, token) || other.token == token)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}


@override
int get hashCode => Object.hash(runtimeType,success,message,user,token,refreshToken);

@override
String toString() {
  return 'VerifyOtpResponse(success: $success, message: $message, user: $user, token: $token, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$VerifyOtpResponseCopyWith<$Res> implements $VerifyOtpResponseCopyWith<$Res> {
  factory _$VerifyOtpResponseCopyWith(_VerifyOtpResponse value, $Res Function(_VerifyOtpResponse) _then) = __$VerifyOtpResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, DriverModel? user, String? token, String? refreshToken
});


@override $DriverModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$VerifyOtpResponseCopyWithImpl<$Res>
    implements _$VerifyOtpResponseCopyWith<$Res> {
  __$VerifyOtpResponseCopyWithImpl(this._self, this._then);

  final _VerifyOtpResponse _self;
  final $Res Function(_VerifyOtpResponse) _then;

/// Create a copy of VerifyOtpResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? user = freezed,Object? token = freezed,Object? refreshToken = freezed,}) {
  return _then(_VerifyOtpResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as DriverModel?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of VerifyOtpResponse
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
mixin _$IsUserExistResponse {

 bool get success; DriverModel? get data;
/// Create a copy of IsUserExistResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IsUserExistResponseCopyWith<IsUserExistResponse> get copyWith => _$IsUserExistResponseCopyWithImpl<IsUserExistResponse>(this as IsUserExistResponse, _$identity);

  /// Serializes this IsUserExistResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IsUserExistResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'IsUserExistResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $IsUserExistResponseCopyWith<$Res>  {
  factory $IsUserExistResponseCopyWith(IsUserExistResponse value, $Res Function(IsUserExistResponse) _then) = _$IsUserExistResponseCopyWithImpl;
@useResult
$Res call({
 bool success, DriverModel? data
});


$DriverModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$IsUserExistResponseCopyWithImpl<$Res>
    implements $IsUserExistResponseCopyWith<$Res> {
  _$IsUserExistResponseCopyWithImpl(this._self, this._then);

  final IsUserExistResponse _self;
  final $Res Function(IsUserExistResponse) _then;

/// Create a copy of IsUserExistResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DriverModel?,
  ));
}
/// Create a copy of IsUserExistResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DriverModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [IsUserExistResponse].
extension IsUserExistResponsePatterns on IsUserExistResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IsUserExistResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IsUserExistResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IsUserExistResponse value)  $default,){
final _that = this;
switch (_that) {
case _IsUserExistResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IsUserExistResponse value)?  $default,){
final _that = this;
switch (_that) {
case _IsUserExistResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  DriverModel? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IsUserExistResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  DriverModel? data)  $default,) {final _that = this;
switch (_that) {
case _IsUserExistResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  DriverModel? data)?  $default,) {final _that = this;
switch (_that) {
case _IsUserExistResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IsUserExistResponse implements IsUserExistResponse {
  const _IsUserExistResponse({required this.success, this.data});
  factory _IsUserExistResponse.fromJson(Map<String, dynamic> json) => _$IsUserExistResponseFromJson(json);

@override final  bool success;
@override final  DriverModel? data;

/// Create a copy of IsUserExistResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IsUserExistResponseCopyWith<_IsUserExistResponse> get copyWith => __$IsUserExistResponseCopyWithImpl<_IsUserExistResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IsUserExistResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IsUserExistResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'IsUserExistResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$IsUserExistResponseCopyWith<$Res> implements $IsUserExistResponseCopyWith<$Res> {
  factory _$IsUserExistResponseCopyWith(_IsUserExistResponse value, $Res Function(_IsUserExistResponse) _then) = __$IsUserExistResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, DriverModel? data
});


@override $DriverModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$IsUserExistResponseCopyWithImpl<$Res>
    implements _$IsUserExistResponseCopyWith<$Res> {
  __$IsUserExistResponseCopyWithImpl(this._self, this._then);

  final _IsUserExistResponse _self;
  final $Res Function(_IsUserExistResponse) _then;

/// Create a copy of IsUserExistResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,}) {
  return _then(_IsUserExistResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DriverModel?,
  ));
}

/// Create a copy of IsUserExistResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DriverModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$UpdateProfileResponse {

 bool get success; String get message; DriverModel? get user;
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
 bool success, String message, DriverModel? user
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  DriverModel? user)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  DriverModel? user)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  DriverModel? user)?  $default,) {final _that = this;
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
  const _UpdateProfileResponse({required this.success, required this.message, this.user});
  factory _UpdateProfileResponse.fromJson(Map<String, dynamic> json) => _$UpdateProfileResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override final  DriverModel? user;

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
 bool success, String message, DriverModel? user
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


/// @nodoc
mixin _$RefreshTokenRequest {

 String get refreshToken;
/// Create a copy of RefreshTokenRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshTokenRequestCopyWith<RefreshTokenRequest> get copyWith => _$RefreshTokenRequestCopyWithImpl<RefreshTokenRequest>(this as RefreshTokenRequest, _$identity);

  /// Serializes this RefreshTokenRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshTokenRequest&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refreshToken);

@override
String toString() {
  return 'RefreshTokenRequest(refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $RefreshTokenRequestCopyWith<$Res>  {
  factory $RefreshTokenRequestCopyWith(RefreshTokenRequest value, $Res Function(RefreshTokenRequest) _then) = _$RefreshTokenRequestCopyWithImpl;
@useResult
$Res call({
 String refreshToken
});




}
/// @nodoc
class _$RefreshTokenRequestCopyWithImpl<$Res>
    implements $RefreshTokenRequestCopyWith<$Res> {
  _$RefreshTokenRequestCopyWithImpl(this._self, this._then);

  final RefreshTokenRequest _self;
  final $Res Function(RefreshTokenRequest) _then;

/// Create a copy of RefreshTokenRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? refreshToken = null,}) {
  return _then(_self.copyWith(
refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RefreshTokenRequest].
extension RefreshTokenRequestPatterns on RefreshTokenRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefreshTokenRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefreshTokenRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefreshTokenRequest value)  $default,){
final _that = this;
switch (_that) {
case _RefreshTokenRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefreshTokenRequest value)?  $default,){
final _that = this;
switch (_that) {
case _RefreshTokenRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefreshTokenRequest() when $default != null:
return $default(_that.refreshToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String refreshToken)  $default,) {final _that = this;
switch (_that) {
case _RefreshTokenRequest():
return $default(_that.refreshToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _RefreshTokenRequest() when $default != null:
return $default(_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefreshTokenRequest implements RefreshTokenRequest {
  const _RefreshTokenRequest({required this.refreshToken});
  factory _RefreshTokenRequest.fromJson(Map<String, dynamic> json) => _$RefreshTokenRequestFromJson(json);

@override final  String refreshToken;

/// Create a copy of RefreshTokenRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshTokenRequestCopyWith<_RefreshTokenRequest> get copyWith => __$RefreshTokenRequestCopyWithImpl<_RefreshTokenRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefreshTokenRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshTokenRequest&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refreshToken);

@override
String toString() {
  return 'RefreshTokenRequest(refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$RefreshTokenRequestCopyWith<$Res> implements $RefreshTokenRequestCopyWith<$Res> {
  factory _$RefreshTokenRequestCopyWith(_RefreshTokenRequest value, $Res Function(_RefreshTokenRequest) _then) = __$RefreshTokenRequestCopyWithImpl;
@override @useResult
$Res call({
 String refreshToken
});




}
/// @nodoc
class __$RefreshTokenRequestCopyWithImpl<$Res>
    implements _$RefreshTokenRequestCopyWith<$Res> {
  __$RefreshTokenRequestCopyWithImpl(this._self, this._then);

  final _RefreshTokenRequest _self;
  final $Res Function(_RefreshTokenRequest) _then;

/// Create a copy of RefreshTokenRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? refreshToken = null,}) {
  return _then(_RefreshTokenRequest(
refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RefreshTokenData {

 String get token; String get refreshToken;
/// Create a copy of RefreshTokenData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshTokenDataCopyWith<RefreshTokenData> get copyWith => _$RefreshTokenDataCopyWithImpl<RefreshTokenData>(this as RefreshTokenData, _$identity);

  /// Serializes this RefreshTokenData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshTokenData&&(identical(other.token, token) || other.token == token)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,refreshToken);

@override
String toString() {
  return 'RefreshTokenData(token: $token, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $RefreshTokenDataCopyWith<$Res>  {
  factory $RefreshTokenDataCopyWith(RefreshTokenData value, $Res Function(RefreshTokenData) _then) = _$RefreshTokenDataCopyWithImpl;
@useResult
$Res call({
 String token, String refreshToken
});




}
/// @nodoc
class _$RefreshTokenDataCopyWithImpl<$Res>
    implements $RefreshTokenDataCopyWith<$Res> {
  _$RefreshTokenDataCopyWithImpl(this._self, this._then);

  final RefreshTokenData _self;
  final $Res Function(RefreshTokenData) _then;

/// Create a copy of RefreshTokenData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? refreshToken = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RefreshTokenData].
extension RefreshTokenDataPatterns on RefreshTokenData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefreshTokenData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefreshTokenData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefreshTokenData value)  $default,){
final _that = this;
switch (_that) {
case _RefreshTokenData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefreshTokenData value)?  $default,){
final _that = this;
switch (_that) {
case _RefreshTokenData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token,  String refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefreshTokenData() when $default != null:
return $default(_that.token,_that.refreshToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token,  String refreshToken)  $default,) {final _that = this;
switch (_that) {
case _RefreshTokenData():
return $default(_that.token,_that.refreshToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token,  String refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _RefreshTokenData() when $default != null:
return $default(_that.token,_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefreshTokenData implements RefreshTokenData {
  const _RefreshTokenData({required this.token, required this.refreshToken});
  factory _RefreshTokenData.fromJson(Map<String, dynamic> json) => _$RefreshTokenDataFromJson(json);

@override final  String token;
@override final  String refreshToken;

/// Create a copy of RefreshTokenData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshTokenDataCopyWith<_RefreshTokenData> get copyWith => __$RefreshTokenDataCopyWithImpl<_RefreshTokenData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefreshTokenDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshTokenData&&(identical(other.token, token) || other.token == token)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,refreshToken);

@override
String toString() {
  return 'RefreshTokenData(token: $token, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$RefreshTokenDataCopyWith<$Res> implements $RefreshTokenDataCopyWith<$Res> {
  factory _$RefreshTokenDataCopyWith(_RefreshTokenData value, $Res Function(_RefreshTokenData) _then) = __$RefreshTokenDataCopyWithImpl;
@override @useResult
$Res call({
 String token, String refreshToken
});




}
/// @nodoc
class __$RefreshTokenDataCopyWithImpl<$Res>
    implements _$RefreshTokenDataCopyWith<$Res> {
  __$RefreshTokenDataCopyWithImpl(this._self, this._then);

  final _RefreshTokenData _self;
  final $Res Function(_RefreshTokenData) _then;

/// Create a copy of RefreshTokenData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? refreshToken = null,}) {
  return _then(_RefreshTokenData(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RefreshTokenResponse {

 bool get success; String get message; RefreshTokenData? get data;
/// Create a copy of RefreshTokenResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshTokenResponseCopyWith<RefreshTokenResponse> get copyWith => _$RefreshTokenResponseCopyWithImpl<RefreshTokenResponse>(this as RefreshTokenResponse, _$identity);

  /// Serializes this RefreshTokenResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshTokenResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'RefreshTokenResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $RefreshTokenResponseCopyWith<$Res>  {
  factory $RefreshTokenResponseCopyWith(RefreshTokenResponse value, $Res Function(RefreshTokenResponse) _then) = _$RefreshTokenResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, RefreshTokenData? data
});


$RefreshTokenDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$RefreshTokenResponseCopyWithImpl<$Res>
    implements $RefreshTokenResponseCopyWith<$Res> {
  _$RefreshTokenResponseCopyWithImpl(this._self, this._then);

  final RefreshTokenResponse _self;
  final $Res Function(RefreshTokenResponse) _then;

/// Create a copy of RefreshTokenResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RefreshTokenData?,
  ));
}
/// Create a copy of RefreshTokenResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RefreshTokenDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $RefreshTokenDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [RefreshTokenResponse].
extension RefreshTokenResponsePatterns on RefreshTokenResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefreshTokenResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefreshTokenResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefreshTokenResponse value)  $default,){
final _that = this;
switch (_that) {
case _RefreshTokenResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefreshTokenResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RefreshTokenResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  RefreshTokenData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefreshTokenResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  RefreshTokenData? data)  $default,) {final _that = this;
switch (_that) {
case _RefreshTokenResponse():
return $default(_that.success,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  RefreshTokenData? data)?  $default,) {final _that = this;
switch (_that) {
case _RefreshTokenResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefreshTokenResponse implements RefreshTokenResponse {
  const _RefreshTokenResponse({required this.success, required this.message, this.data});
  factory _RefreshTokenResponse.fromJson(Map<String, dynamic> json) => _$RefreshTokenResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override final  RefreshTokenData? data;

/// Create a copy of RefreshTokenResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshTokenResponseCopyWith<_RefreshTokenResponse> get copyWith => __$RefreshTokenResponseCopyWithImpl<_RefreshTokenResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefreshTokenResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshTokenResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'RefreshTokenResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$RefreshTokenResponseCopyWith<$Res> implements $RefreshTokenResponseCopyWith<$Res> {
  factory _$RefreshTokenResponseCopyWith(_RefreshTokenResponse value, $Res Function(_RefreshTokenResponse) _then) = __$RefreshTokenResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, RefreshTokenData? data
});


@override $RefreshTokenDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$RefreshTokenResponseCopyWithImpl<$Res>
    implements _$RefreshTokenResponseCopyWith<$Res> {
  __$RefreshTokenResponseCopyWithImpl(this._self, this._then);

  final _RefreshTokenResponse _self;
  final $Res Function(_RefreshTokenResponse) _then;

/// Create a copy of RefreshTokenResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_RefreshTokenResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RefreshTokenData?,
  ));
}

/// Create a copy of RefreshTokenResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RefreshTokenDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $RefreshTokenDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$LogoutResponse {

 bool get success; String get message;
/// Create a copy of LogoutResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogoutResponseCopyWith<LogoutResponse> get copyWith => _$LogoutResponseCopyWithImpl<LogoutResponse>(this as LogoutResponse, _$identity);

  /// Serializes this LogoutResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'LogoutResponse(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class $LogoutResponseCopyWith<$Res>  {
  factory $LogoutResponseCopyWith(LogoutResponse value, $Res Function(LogoutResponse) _then) = _$LogoutResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class _$LogoutResponseCopyWithImpl<$Res>
    implements $LogoutResponseCopyWith<$Res> {
  _$LogoutResponseCopyWithImpl(this._self, this._then);

  final LogoutResponse _self;
  final $Res Function(LogoutResponse) _then;

/// Create a copy of LogoutResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LogoutResponse].
extension LogoutResponsePatterns on LogoutResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogoutResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogoutResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogoutResponse value)  $default,){
final _that = this;
switch (_that) {
case _LogoutResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogoutResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LogoutResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogoutResponse() when $default != null:
return $default(_that.success,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message)  $default,) {final _that = this;
switch (_that) {
case _LogoutResponse():
return $default(_that.success,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message)?  $default,) {final _that = this;
switch (_that) {
case _LogoutResponse() when $default != null:
return $default(_that.success,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LogoutResponse implements LogoutResponse {
  const _LogoutResponse({required this.success, required this.message});
  factory _LogoutResponse.fromJson(Map<String, dynamic> json) => _$LogoutResponseFromJson(json);

@override final  bool success;
@override final  String message;

/// Create a copy of LogoutResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogoutResponseCopyWith<_LogoutResponse> get copyWith => __$LogoutResponseCopyWithImpl<_LogoutResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogoutResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'LogoutResponse(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class _$LogoutResponseCopyWith<$Res> implements $LogoutResponseCopyWith<$Res> {
  factory _$LogoutResponseCopyWith(_LogoutResponse value, $Res Function(_LogoutResponse) _then) = __$LogoutResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class __$LogoutResponseCopyWithImpl<$Res>
    implements _$LogoutResponseCopyWith<$Res> {
  __$LogoutResponseCopyWithImpl(this._self, this._then);

  final _LogoutResponse _self;
  final $Res Function(_LogoutResponse) _then;

/// Create a copy of LogoutResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,}) {
  return _then(_LogoutResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
