// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_responses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VehicleInfo {

@JsonKey(name: '_id') String get id; String get vehicleName; String get vehicleNumber; String? get vehicleType; String? get vehicleColor; String? get vehicleModel; int? get vehicleYear; double? get vehicleCapacity; String? get vehicleStatus; String? get driverId; String? get verificationStatus; bool? get disable;
/// Create a copy of VehicleInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleInfoCopyWith<VehicleInfo> get copyWith => _$VehicleInfoCopyWithImpl<VehicleInfo>(this as VehicleInfo, _$identity);

  /// Serializes this VehicleInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.vehicleName, vehicleName) || other.vehicleName == vehicleName)&&(identical(other.vehicleNumber, vehicleNumber) || other.vehicleNumber == vehicleNumber)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.vehicleColor, vehicleColor) || other.vehicleColor == vehicleColor)&&(identical(other.vehicleModel, vehicleModel) || other.vehicleModel == vehicleModel)&&(identical(other.vehicleYear, vehicleYear) || other.vehicleYear == vehicleYear)&&(identical(other.vehicleCapacity, vehicleCapacity) || other.vehicleCapacity == vehicleCapacity)&&(identical(other.vehicleStatus, vehicleStatus) || other.vehicleStatus == vehicleStatus)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.disable, disable) || other.disable == disable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,vehicleName,vehicleNumber,vehicleType,vehicleColor,vehicleModel,vehicleYear,vehicleCapacity,vehicleStatus,driverId,verificationStatus,disable);

@override
String toString() {
  return 'VehicleInfo(id: $id, vehicleName: $vehicleName, vehicleNumber: $vehicleNumber, vehicleType: $vehicleType, vehicleColor: $vehicleColor, vehicleModel: $vehicleModel, vehicleYear: $vehicleYear, vehicleCapacity: $vehicleCapacity, vehicleStatus: $vehicleStatus, driverId: $driverId, verificationStatus: $verificationStatus, disable: $disable)';
}


}

/// @nodoc
abstract mixin class $VehicleInfoCopyWith<$Res>  {
  factory $VehicleInfoCopyWith(VehicleInfo value, $Res Function(VehicleInfo) _then) = _$VehicleInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String vehicleName, String vehicleNumber, String? vehicleType, String? vehicleColor, String? vehicleModel, int? vehicleYear, double? vehicleCapacity, String? vehicleStatus, String? driverId, String? verificationStatus, bool? disable
});




}
/// @nodoc
class _$VehicleInfoCopyWithImpl<$Res>
    implements $VehicleInfoCopyWith<$Res> {
  _$VehicleInfoCopyWithImpl(this._self, this._then);

  final VehicleInfo _self;
  final $Res Function(VehicleInfo) _then;

/// Create a copy of VehicleInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? vehicleName = null,Object? vehicleNumber = null,Object? vehicleType = freezed,Object? vehicleColor = freezed,Object? vehicleModel = freezed,Object? vehicleYear = freezed,Object? vehicleCapacity = freezed,Object? vehicleStatus = freezed,Object? driverId = freezed,Object? verificationStatus = freezed,Object? disable = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vehicleName: null == vehicleName ? _self.vehicleName : vehicleName // ignore: cast_nullable_to_non_nullable
as String,vehicleNumber: null == vehicleNumber ? _self.vehicleNumber : vehicleNumber // ignore: cast_nullable_to_non_nullable
as String,vehicleType: freezed == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String?,vehicleColor: freezed == vehicleColor ? _self.vehicleColor : vehicleColor // ignore: cast_nullable_to_non_nullable
as String?,vehicleModel: freezed == vehicleModel ? _self.vehicleModel : vehicleModel // ignore: cast_nullable_to_non_nullable
as String?,vehicleYear: freezed == vehicleYear ? _self.vehicleYear : vehicleYear // ignore: cast_nullable_to_non_nullable
as int?,vehicleCapacity: freezed == vehicleCapacity ? _self.vehicleCapacity : vehicleCapacity // ignore: cast_nullable_to_non_nullable
as double?,vehicleStatus: freezed == vehicleStatus ? _self.vehicleStatus : vehicleStatus // ignore: cast_nullable_to_non_nullable
as String?,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,verificationStatus: freezed == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String?,disable: freezed == disable ? _self.disable : disable // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [VehicleInfo].
extension VehicleInfoPatterns on VehicleInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleInfo value)  $default,){
final _that = this;
switch (_that) {
case _VehicleInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleInfo value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String vehicleName,  String vehicleNumber,  String? vehicleType,  String? vehicleColor,  String? vehicleModel,  int? vehicleYear,  double? vehicleCapacity,  String? vehicleStatus,  String? driverId,  String? verificationStatus,  bool? disable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleInfo() when $default != null:
return $default(_that.id,_that.vehicleName,_that.vehicleNumber,_that.vehicleType,_that.vehicleColor,_that.vehicleModel,_that.vehicleYear,_that.vehicleCapacity,_that.vehicleStatus,_that.driverId,_that.verificationStatus,_that.disable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String vehicleName,  String vehicleNumber,  String? vehicleType,  String? vehicleColor,  String? vehicleModel,  int? vehicleYear,  double? vehicleCapacity,  String? vehicleStatus,  String? driverId,  String? verificationStatus,  bool? disable)  $default,) {final _that = this;
switch (_that) {
case _VehicleInfo():
return $default(_that.id,_that.vehicleName,_that.vehicleNumber,_that.vehicleType,_that.vehicleColor,_that.vehicleModel,_that.vehicleYear,_that.vehicleCapacity,_that.vehicleStatus,_that.driverId,_that.verificationStatus,_that.disable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String vehicleName,  String vehicleNumber,  String? vehicleType,  String? vehicleColor,  String? vehicleModel,  int? vehicleYear,  double? vehicleCapacity,  String? vehicleStatus,  String? driverId,  String? verificationStatus,  bool? disable)?  $default,) {final _that = this;
switch (_that) {
case _VehicleInfo() when $default != null:
return $default(_that.id,_that.vehicleName,_that.vehicleNumber,_that.vehicleType,_that.vehicleColor,_that.vehicleModel,_that.vehicleYear,_that.vehicleCapacity,_that.vehicleStatus,_that.driverId,_that.verificationStatus,_that.disable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleInfo implements VehicleInfo {
  const _VehicleInfo({@JsonKey(name: '_id') required this.id, required this.vehicleName, required this.vehicleNumber, this.vehicleType, this.vehicleColor, this.vehicleModel, this.vehicleYear, this.vehicleCapacity, this.vehicleStatus, this.driverId, this.verificationStatus, this.disable});
  factory _VehicleInfo.fromJson(Map<String, dynamic> json) => _$VehicleInfoFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String vehicleName;
@override final  String vehicleNumber;
@override final  String? vehicleType;
@override final  String? vehicleColor;
@override final  String? vehicleModel;
@override final  int? vehicleYear;
@override final  double? vehicleCapacity;
@override final  String? vehicleStatus;
@override final  String? driverId;
@override final  String? verificationStatus;
@override final  bool? disable;

/// Create a copy of VehicleInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleInfoCopyWith<_VehicleInfo> get copyWith => __$VehicleInfoCopyWithImpl<_VehicleInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.vehicleName, vehicleName) || other.vehicleName == vehicleName)&&(identical(other.vehicleNumber, vehicleNumber) || other.vehicleNumber == vehicleNumber)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.vehicleColor, vehicleColor) || other.vehicleColor == vehicleColor)&&(identical(other.vehicleModel, vehicleModel) || other.vehicleModel == vehicleModel)&&(identical(other.vehicleYear, vehicleYear) || other.vehicleYear == vehicleYear)&&(identical(other.vehicleCapacity, vehicleCapacity) || other.vehicleCapacity == vehicleCapacity)&&(identical(other.vehicleStatus, vehicleStatus) || other.vehicleStatus == vehicleStatus)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.disable, disable) || other.disable == disable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,vehicleName,vehicleNumber,vehicleType,vehicleColor,vehicleModel,vehicleYear,vehicleCapacity,vehicleStatus,driverId,verificationStatus,disable);

@override
String toString() {
  return 'VehicleInfo(id: $id, vehicleName: $vehicleName, vehicleNumber: $vehicleNumber, vehicleType: $vehicleType, vehicleColor: $vehicleColor, vehicleModel: $vehicleModel, vehicleYear: $vehicleYear, vehicleCapacity: $vehicleCapacity, vehicleStatus: $vehicleStatus, driverId: $driverId, verificationStatus: $verificationStatus, disable: $disable)';
}


}

/// @nodoc
abstract mixin class _$VehicleInfoCopyWith<$Res> implements $VehicleInfoCopyWith<$Res> {
  factory _$VehicleInfoCopyWith(_VehicleInfo value, $Res Function(_VehicleInfo) _then) = __$VehicleInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String vehicleName, String vehicleNumber, String? vehicleType, String? vehicleColor, String? vehicleModel, int? vehicleYear, double? vehicleCapacity, String? vehicleStatus, String? driverId, String? verificationStatus, bool? disable
});




}
/// @nodoc
class __$VehicleInfoCopyWithImpl<$Res>
    implements _$VehicleInfoCopyWith<$Res> {
  __$VehicleInfoCopyWithImpl(this._self, this._then);

  final _VehicleInfo _self;
  final $Res Function(_VehicleInfo) _then;

/// Create a copy of VehicleInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? vehicleName = null,Object? vehicleNumber = null,Object? vehicleType = freezed,Object? vehicleColor = freezed,Object? vehicleModel = freezed,Object? vehicleYear = freezed,Object? vehicleCapacity = freezed,Object? vehicleStatus = freezed,Object? driverId = freezed,Object? verificationStatus = freezed,Object? disable = freezed,}) {
  return _then(_VehicleInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vehicleName: null == vehicleName ? _self.vehicleName : vehicleName // ignore: cast_nullable_to_non_nullable
as String,vehicleNumber: null == vehicleNumber ? _self.vehicleNumber : vehicleNumber // ignore: cast_nullable_to_non_nullable
as String,vehicleType: freezed == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String?,vehicleColor: freezed == vehicleColor ? _self.vehicleColor : vehicleColor // ignore: cast_nullable_to_non_nullable
as String?,vehicleModel: freezed == vehicleModel ? _self.vehicleModel : vehicleModel // ignore: cast_nullable_to_non_nullable
as String?,vehicleYear: freezed == vehicleYear ? _self.vehicleYear : vehicleYear // ignore: cast_nullable_to_non_nullable
as int?,vehicleCapacity: freezed == vehicleCapacity ? _self.vehicleCapacity : vehicleCapacity // ignore: cast_nullable_to_non_nullable
as double?,vehicleStatus: freezed == vehicleStatus ? _self.vehicleStatus : vehicleStatus // ignore: cast_nullable_to_non_nullable
as String?,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,verificationStatus: freezed == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String?,disable: freezed == disable ? _self.disable : disable // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$CreateVehicleResponse {

 bool get success; String get message; List<VehicleInfo> get vehicle;
/// Create a copy of CreateVehicleResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateVehicleResponseCopyWith<CreateVehicleResponse> get copyWith => _$CreateVehicleResponseCopyWithImpl<CreateVehicleResponse>(this as CreateVehicleResponse, _$identity);

  /// Serializes this CreateVehicleResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateVehicleResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.vehicle, vehicle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(vehicle));

@override
String toString() {
  return 'CreateVehicleResponse(success: $success, message: $message, vehicle: $vehicle)';
}


}

/// @nodoc
abstract mixin class $CreateVehicleResponseCopyWith<$Res>  {
  factory $CreateVehicleResponseCopyWith(CreateVehicleResponse value, $Res Function(CreateVehicleResponse) _then) = _$CreateVehicleResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, List<VehicleInfo> vehicle
});




}
/// @nodoc
class _$CreateVehicleResponseCopyWithImpl<$Res>
    implements $CreateVehicleResponseCopyWith<$Res> {
  _$CreateVehicleResponseCopyWithImpl(this._self, this._then);

  final CreateVehicleResponse _self;
  final $Res Function(CreateVehicleResponse) _then;

/// Create a copy of CreateVehicleResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? vehicle = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,vehicle: null == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as List<VehicleInfo>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateVehicleResponse].
extension CreateVehicleResponsePatterns on CreateVehicleResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateVehicleResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateVehicleResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateVehicleResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreateVehicleResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateVehicleResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreateVehicleResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  List<VehicleInfo> vehicle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateVehicleResponse() when $default != null:
return $default(_that.success,_that.message,_that.vehicle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  List<VehicleInfo> vehicle)  $default,) {final _that = this;
switch (_that) {
case _CreateVehicleResponse():
return $default(_that.success,_that.message,_that.vehicle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  List<VehicleInfo> vehicle)?  $default,) {final _that = this;
switch (_that) {
case _CreateVehicleResponse() when $default != null:
return $default(_that.success,_that.message,_that.vehicle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateVehicleResponse implements CreateVehicleResponse {
  const _CreateVehicleResponse({required this.success, required this.message, required final  List<VehicleInfo> vehicle}): _vehicle = vehicle;
  factory _CreateVehicleResponse.fromJson(Map<String, dynamic> json) => _$CreateVehicleResponseFromJson(json);

@override final  bool success;
@override final  String message;
 final  List<VehicleInfo> _vehicle;
@override List<VehicleInfo> get vehicle {
  if (_vehicle is EqualUnmodifiableListView) return _vehicle;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_vehicle);
}


/// Create a copy of CreateVehicleResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateVehicleResponseCopyWith<_CreateVehicleResponse> get copyWith => __$CreateVehicleResponseCopyWithImpl<_CreateVehicleResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateVehicleResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateVehicleResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._vehicle, _vehicle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_vehicle));

@override
String toString() {
  return 'CreateVehicleResponse(success: $success, message: $message, vehicle: $vehicle)';
}


}

/// @nodoc
abstract mixin class _$CreateVehicleResponseCopyWith<$Res> implements $CreateVehicleResponseCopyWith<$Res> {
  factory _$CreateVehicleResponseCopyWith(_CreateVehicleResponse value, $Res Function(_CreateVehicleResponse) _then) = __$CreateVehicleResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, List<VehicleInfo> vehicle
});




}
/// @nodoc
class __$CreateVehicleResponseCopyWithImpl<$Res>
    implements _$CreateVehicleResponseCopyWith<$Res> {
  __$CreateVehicleResponseCopyWithImpl(this._self, this._then);

  final _CreateVehicleResponse _self;
  final $Res Function(_CreateVehicleResponse) _then;

/// Create a copy of CreateVehicleResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? vehicle = null,}) {
  return _then(_CreateVehicleResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,vehicle: null == vehicle ? _self._vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as List<VehicleInfo>,
  ));
}


}


/// @nodoc
mixin _$RegisterProfileResponse {

 bool get success; String get message; DriverModel get data;
/// Create a copy of RegisterProfileResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterProfileResponseCopyWith<RegisterProfileResponse> get copyWith => _$RegisterProfileResponseCopyWithImpl<RegisterProfileResponse>(this as RegisterProfileResponse, _$identity);

  /// Serializes this RegisterProfileResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterProfileResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'RegisterProfileResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $RegisterProfileResponseCopyWith<$Res>  {
  factory $RegisterProfileResponseCopyWith(RegisterProfileResponse value, $Res Function(RegisterProfileResponse) _then) = _$RegisterProfileResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, DriverModel data
});


$DriverModelCopyWith<$Res> get data;

}
/// @nodoc
class _$RegisterProfileResponseCopyWithImpl<$Res>
    implements $RegisterProfileResponseCopyWith<$Res> {
  _$RegisterProfileResponseCopyWithImpl(this._self, this._then);

  final RegisterProfileResponse _self;
  final $Res Function(RegisterProfileResponse) _then;

/// Create a copy of RegisterProfileResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DriverModel,
  ));
}
/// Create a copy of RegisterProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverModelCopyWith<$Res> get data {
  
  return $DriverModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegisterProfileResponse].
extension RegisterProfileResponsePatterns on RegisterProfileResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterProfileResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterProfileResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterProfileResponse value)  $default,){
final _that = this;
switch (_that) {
case _RegisterProfileResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterProfileResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterProfileResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  DriverModel data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterProfileResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  DriverModel data)  $default,) {final _that = this;
switch (_that) {
case _RegisterProfileResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  DriverModel data)?  $default,) {final _that = this;
switch (_that) {
case _RegisterProfileResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterProfileResponse implements RegisterProfileResponse {
  const _RegisterProfileResponse({required this.success, required this.message, required this.data});
  factory _RegisterProfileResponse.fromJson(Map<String, dynamic> json) => _$RegisterProfileResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override final  DriverModel data;

/// Create a copy of RegisterProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterProfileResponseCopyWith<_RegisterProfileResponse> get copyWith => __$RegisterProfileResponseCopyWithImpl<_RegisterProfileResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterProfileResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterProfileResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'RegisterProfileResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$RegisterProfileResponseCopyWith<$Res> implements $RegisterProfileResponseCopyWith<$Res> {
  factory _$RegisterProfileResponseCopyWith(_RegisterProfileResponse value, $Res Function(_RegisterProfileResponse) _then) = __$RegisterProfileResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, DriverModel data
});


@override $DriverModelCopyWith<$Res> get data;

}
/// @nodoc
class __$RegisterProfileResponseCopyWithImpl<$Res>
    implements _$RegisterProfileResponseCopyWith<$Res> {
  __$RegisterProfileResponseCopyWithImpl(this._self, this._then);

  final _RegisterProfileResponse _self;
  final $Res Function(_RegisterProfileResponse) _then;

/// Create a copy of RegisterProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_RegisterProfileResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DriverModel,
  ));
}

/// Create a copy of RegisterProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverModelCopyWith<$Res> get data {
  
  return $DriverModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$DriverImageUploadResponse {

 bool get success; String get message; DriverModel get driver;
/// Create a copy of DriverImageUploadResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DriverImageUploadResponseCopyWith<DriverImageUploadResponse> get copyWith => _$DriverImageUploadResponseCopyWithImpl<DriverImageUploadResponse>(this as DriverImageUploadResponse, _$identity);

  /// Serializes this DriverImageUploadResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriverImageUploadResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.driver, driver) || other.driver == driver));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,driver);

@override
String toString() {
  return 'DriverImageUploadResponse(success: $success, message: $message, driver: $driver)';
}


}

/// @nodoc
abstract mixin class $DriverImageUploadResponseCopyWith<$Res>  {
  factory $DriverImageUploadResponseCopyWith(DriverImageUploadResponse value, $Res Function(DriverImageUploadResponse) _then) = _$DriverImageUploadResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, DriverModel driver
});


$DriverModelCopyWith<$Res> get driver;

}
/// @nodoc
class _$DriverImageUploadResponseCopyWithImpl<$Res>
    implements $DriverImageUploadResponseCopyWith<$Res> {
  _$DriverImageUploadResponseCopyWithImpl(this._self, this._then);

  final DriverImageUploadResponse _self;
  final $Res Function(DriverImageUploadResponse) _then;

/// Create a copy of DriverImageUploadResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? driver = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,driver: null == driver ? _self.driver : driver // ignore: cast_nullable_to_non_nullable
as DriverModel,
  ));
}
/// Create a copy of DriverImageUploadResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverModelCopyWith<$Res> get driver {
  
  return $DriverModelCopyWith<$Res>(_self.driver, (value) {
    return _then(_self.copyWith(driver: value));
  });
}
}


/// Adds pattern-matching-related methods to [DriverImageUploadResponse].
extension DriverImageUploadResponsePatterns on DriverImageUploadResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DriverImageUploadResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DriverImageUploadResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DriverImageUploadResponse value)  $default,){
final _that = this;
switch (_that) {
case _DriverImageUploadResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DriverImageUploadResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DriverImageUploadResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  DriverModel driver)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DriverImageUploadResponse() when $default != null:
return $default(_that.success,_that.message,_that.driver);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  DriverModel driver)  $default,) {final _that = this;
switch (_that) {
case _DriverImageUploadResponse():
return $default(_that.success,_that.message,_that.driver);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  DriverModel driver)?  $default,) {final _that = this;
switch (_that) {
case _DriverImageUploadResponse() when $default != null:
return $default(_that.success,_that.message,_that.driver);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DriverImageUploadResponse implements DriverImageUploadResponse {
  const _DriverImageUploadResponse({required this.success, required this.message, required this.driver});
  factory _DriverImageUploadResponse.fromJson(Map<String, dynamic> json) => _$DriverImageUploadResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override final  DriverModel driver;

/// Create a copy of DriverImageUploadResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DriverImageUploadResponseCopyWith<_DriverImageUploadResponse> get copyWith => __$DriverImageUploadResponseCopyWithImpl<_DriverImageUploadResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DriverImageUploadResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DriverImageUploadResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.driver, driver) || other.driver == driver));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,driver);

@override
String toString() {
  return 'DriverImageUploadResponse(success: $success, message: $message, driver: $driver)';
}


}

/// @nodoc
abstract mixin class _$DriverImageUploadResponseCopyWith<$Res> implements $DriverImageUploadResponseCopyWith<$Res> {
  factory _$DriverImageUploadResponseCopyWith(_DriverImageUploadResponse value, $Res Function(_DriverImageUploadResponse) _then) = __$DriverImageUploadResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, DriverModel driver
});


@override $DriverModelCopyWith<$Res> get driver;

}
/// @nodoc
class __$DriverImageUploadResponseCopyWithImpl<$Res>
    implements _$DriverImageUploadResponseCopyWith<$Res> {
  __$DriverImageUploadResponseCopyWithImpl(this._self, this._then);

  final _DriverImageUploadResponse _self;
  final $Res Function(_DriverImageUploadResponse) _then;

/// Create a copy of DriverImageUploadResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? driver = null,}) {
  return _then(_DriverImageUploadResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,driver: null == driver ? _self.driver : driver // ignore: cast_nullable_to_non_nullable
as DriverModel,
  ));
}

/// Create a copy of DriverImageUploadResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverModelCopyWith<$Res> get driver {
  
  return $DriverModelCopyWith<$Res>(_self.driver, (value) {
    return _then(_self.copyWith(driver: value));
  });
}
}


/// @nodoc
mixin _$CheckVerificationResponse {

 bool get success; String get message; String get status;// 'draft' | 'pending' | 'verified' | 'rejected'
 bool get isDriver; Map<String, dynamic>? get data; String? get token; String? get driverId;
/// Create a copy of CheckVerificationResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckVerificationResponseCopyWith<CheckVerificationResponse> get copyWith => _$CheckVerificationResponseCopyWithImpl<CheckVerificationResponse>(this as CheckVerificationResponse, _$identity);

  /// Serializes this CheckVerificationResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckVerificationResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.status, status) || other.status == status)&&(identical(other.isDriver, isDriver) || other.isDriver == isDriver)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.token, token) || other.token == token)&&(identical(other.driverId, driverId) || other.driverId == driverId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,status,isDriver,const DeepCollectionEquality().hash(data),token,driverId);

@override
String toString() {
  return 'CheckVerificationResponse(success: $success, message: $message, status: $status, isDriver: $isDriver, data: $data, token: $token, driverId: $driverId)';
}


}

/// @nodoc
abstract mixin class $CheckVerificationResponseCopyWith<$Res>  {
  factory $CheckVerificationResponseCopyWith(CheckVerificationResponse value, $Res Function(CheckVerificationResponse) _then) = _$CheckVerificationResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, String status, bool isDriver, Map<String, dynamic>? data, String? token, String? driverId
});




}
/// @nodoc
class _$CheckVerificationResponseCopyWithImpl<$Res>
    implements $CheckVerificationResponseCopyWith<$Res> {
  _$CheckVerificationResponseCopyWithImpl(this._self, this._then);

  final CheckVerificationResponse _self;
  final $Res Function(CheckVerificationResponse) _then;

/// Create a copy of CheckVerificationResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? status = null,Object? isDriver = null,Object? data = freezed,Object? token = freezed,Object? driverId = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isDriver: null == isDriver ? _self.isDriver : isDriver // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckVerificationResponse].
extension CheckVerificationResponsePatterns on CheckVerificationResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckVerificationResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckVerificationResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckVerificationResponse value)  $default,){
final _that = this;
switch (_that) {
case _CheckVerificationResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckVerificationResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CheckVerificationResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  String status,  bool isDriver,  Map<String, dynamic>? data,  String? token,  String? driverId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckVerificationResponse() when $default != null:
return $default(_that.success,_that.message,_that.status,_that.isDriver,_that.data,_that.token,_that.driverId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  String status,  bool isDriver,  Map<String, dynamic>? data,  String? token,  String? driverId)  $default,) {final _that = this;
switch (_that) {
case _CheckVerificationResponse():
return $default(_that.success,_that.message,_that.status,_that.isDriver,_that.data,_that.token,_that.driverId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  String status,  bool isDriver,  Map<String, dynamic>? data,  String? token,  String? driverId)?  $default,) {final _that = this;
switch (_that) {
case _CheckVerificationResponse() when $default != null:
return $default(_that.success,_that.message,_that.status,_that.isDriver,_that.data,_that.token,_that.driverId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckVerificationResponse implements CheckVerificationResponse {
  const _CheckVerificationResponse({required this.success, required this.message, required this.status, required this.isDriver, final  Map<String, dynamic>? data, this.token, this.driverId}): _data = data;
  factory _CheckVerificationResponse.fromJson(Map<String, dynamic> json) => _$CheckVerificationResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override final  String status;
// 'draft' | 'pending' | 'verified' | 'rejected'
@override final  bool isDriver;
 final  Map<String, dynamic>? _data;
@override Map<String, dynamic>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? token;
@override final  String? driverId;

/// Create a copy of CheckVerificationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckVerificationResponseCopyWith<_CheckVerificationResponse> get copyWith => __$CheckVerificationResponseCopyWithImpl<_CheckVerificationResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckVerificationResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckVerificationResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.status, status) || other.status == status)&&(identical(other.isDriver, isDriver) || other.isDriver == isDriver)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.token, token) || other.token == token)&&(identical(other.driverId, driverId) || other.driverId == driverId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,status,isDriver,const DeepCollectionEquality().hash(_data),token,driverId);

@override
String toString() {
  return 'CheckVerificationResponse(success: $success, message: $message, status: $status, isDriver: $isDriver, data: $data, token: $token, driverId: $driverId)';
}


}

/// @nodoc
abstract mixin class _$CheckVerificationResponseCopyWith<$Res> implements $CheckVerificationResponseCopyWith<$Res> {
  factory _$CheckVerificationResponseCopyWith(_CheckVerificationResponse value, $Res Function(_CheckVerificationResponse) _then) = __$CheckVerificationResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, String status, bool isDriver, Map<String, dynamic>? data, String? token, String? driverId
});




}
/// @nodoc
class __$CheckVerificationResponseCopyWithImpl<$Res>
    implements _$CheckVerificationResponseCopyWith<$Res> {
  __$CheckVerificationResponseCopyWithImpl(this._self, this._then);

  final _CheckVerificationResponse _self;
  final $Res Function(_CheckVerificationResponse) _then;

/// Create a copy of CheckVerificationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? status = null,Object? isDriver = null,Object? data = freezed,Object? token = freezed,Object? driverId = freezed,}) {
  return _then(_CheckVerificationResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isDriver: null == isDriver ? _self.isDriver : isDriver // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
