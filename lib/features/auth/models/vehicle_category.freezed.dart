// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VehicleCategory {

@JsonKey(name: '_id') String get id; String? get cityId; String get name; String? get image; double? get minimumPrice; double? get baseFare; bool? get disable; List<String>? get requiredDocuments;
/// Create a copy of VehicleCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleCategoryCopyWith<VehicleCategory> get copyWith => _$VehicleCategoryCopyWithImpl<VehicleCategory>(this as VehicleCategory, _$identity);

  /// Serializes this VehicleCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.minimumPrice, minimumPrice) || other.minimumPrice == minimumPrice)&&(identical(other.baseFare, baseFare) || other.baseFare == baseFare)&&(identical(other.disable, disable) || other.disable == disable)&&const DeepCollectionEquality().equals(other.requiredDocuments, requiredDocuments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,cityId,name,image,minimumPrice,baseFare,disable,const DeepCollectionEquality().hash(requiredDocuments));

@override
String toString() {
  return 'VehicleCategory(id: $id, cityId: $cityId, name: $name, image: $image, minimumPrice: $minimumPrice, baseFare: $baseFare, disable: $disable, requiredDocuments: $requiredDocuments)';
}


}

/// @nodoc
abstract mixin class $VehicleCategoryCopyWith<$Res>  {
  factory $VehicleCategoryCopyWith(VehicleCategory value, $Res Function(VehicleCategory) _then) = _$VehicleCategoryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String? cityId, String name, String? image, double? minimumPrice, double? baseFare, bool? disable, List<String>? requiredDocuments
});




}
/// @nodoc
class _$VehicleCategoryCopyWithImpl<$Res>
    implements $VehicleCategoryCopyWith<$Res> {
  _$VehicleCategoryCopyWithImpl(this._self, this._then);

  final VehicleCategory _self;
  final $Res Function(VehicleCategory) _then;

/// Create a copy of VehicleCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? cityId = freezed,Object? name = null,Object? image = freezed,Object? minimumPrice = freezed,Object? baseFare = freezed,Object? disable = freezed,Object? requiredDocuments = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,cityId: freezed == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,minimumPrice: freezed == minimumPrice ? _self.minimumPrice : minimumPrice // ignore: cast_nullable_to_non_nullable
as double?,baseFare: freezed == baseFare ? _self.baseFare : baseFare // ignore: cast_nullable_to_non_nullable
as double?,disable: freezed == disable ? _self.disable : disable // ignore: cast_nullable_to_non_nullable
as bool?,requiredDocuments: freezed == requiredDocuments ? _self.requiredDocuments : requiredDocuments // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [VehicleCategory].
extension VehicleCategoryPatterns on VehicleCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleCategory value)  $default,){
final _that = this;
switch (_that) {
case _VehicleCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleCategory value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String? cityId,  String name,  String? image,  double? minimumPrice,  double? baseFare,  bool? disable,  List<String>? requiredDocuments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleCategory() when $default != null:
return $default(_that.id,_that.cityId,_that.name,_that.image,_that.minimumPrice,_that.baseFare,_that.disable,_that.requiredDocuments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String? cityId,  String name,  String? image,  double? minimumPrice,  double? baseFare,  bool? disable,  List<String>? requiredDocuments)  $default,) {final _that = this;
switch (_that) {
case _VehicleCategory():
return $default(_that.id,_that.cityId,_that.name,_that.image,_that.minimumPrice,_that.baseFare,_that.disable,_that.requiredDocuments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String? cityId,  String name,  String? image,  double? minimumPrice,  double? baseFare,  bool? disable,  List<String>? requiredDocuments)?  $default,) {final _that = this;
switch (_that) {
case _VehicleCategory() when $default != null:
return $default(_that.id,_that.cityId,_that.name,_that.image,_that.minimumPrice,_that.baseFare,_that.disable,_that.requiredDocuments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleCategory implements VehicleCategory {
  const _VehicleCategory({@JsonKey(name: '_id') required this.id, this.cityId, required this.name, this.image, this.minimumPrice, this.baseFare, this.disable, final  List<String>? requiredDocuments}): _requiredDocuments = requiredDocuments;
  factory _VehicleCategory.fromJson(Map<String, dynamic> json) => _$VehicleCategoryFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String? cityId;
@override final  String name;
@override final  String? image;
@override final  double? minimumPrice;
@override final  double? baseFare;
@override final  bool? disable;
 final  List<String>? _requiredDocuments;
@override List<String>? get requiredDocuments {
  final value = _requiredDocuments;
  if (value == null) return null;
  if (_requiredDocuments is EqualUnmodifiableListView) return _requiredDocuments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of VehicleCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleCategoryCopyWith<_VehicleCategory> get copyWith => __$VehicleCategoryCopyWithImpl<_VehicleCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.minimumPrice, minimumPrice) || other.minimumPrice == minimumPrice)&&(identical(other.baseFare, baseFare) || other.baseFare == baseFare)&&(identical(other.disable, disable) || other.disable == disable)&&const DeepCollectionEquality().equals(other._requiredDocuments, _requiredDocuments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,cityId,name,image,minimumPrice,baseFare,disable,const DeepCollectionEquality().hash(_requiredDocuments));

@override
String toString() {
  return 'VehicleCategory(id: $id, cityId: $cityId, name: $name, image: $image, minimumPrice: $minimumPrice, baseFare: $baseFare, disable: $disable, requiredDocuments: $requiredDocuments)';
}


}

/// @nodoc
abstract mixin class _$VehicleCategoryCopyWith<$Res> implements $VehicleCategoryCopyWith<$Res> {
  factory _$VehicleCategoryCopyWith(_VehicleCategory value, $Res Function(_VehicleCategory) _then) = __$VehicleCategoryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String? cityId, String name, String? image, double? minimumPrice, double? baseFare, bool? disable, List<String>? requiredDocuments
});




}
/// @nodoc
class __$VehicleCategoryCopyWithImpl<$Res>
    implements _$VehicleCategoryCopyWith<$Res> {
  __$VehicleCategoryCopyWithImpl(this._self, this._then);

  final _VehicleCategory _self;
  final $Res Function(_VehicleCategory) _then;

/// Create a copy of VehicleCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? cityId = freezed,Object? name = null,Object? image = freezed,Object? minimumPrice = freezed,Object? baseFare = freezed,Object? disable = freezed,Object? requiredDocuments = freezed,}) {
  return _then(_VehicleCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,cityId: freezed == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,minimumPrice: freezed == minimumPrice ? _self.minimumPrice : minimumPrice // ignore: cast_nullable_to_non_nullable
as double?,baseFare: freezed == baseFare ? _self.baseFare : baseFare // ignore: cast_nullable_to_non_nullable
as double?,disable: freezed == disable ? _self.disable : disable // ignore: cast_nullable_to_non_nullable
as bool?,requiredDocuments: freezed == requiredDocuments ? _self._requiredDocuments : requiredDocuments // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$GetAllVehicleCategoriesResponse {

 bool get success; String get message; List<VehicleCategory> get data;
/// Create a copy of GetAllVehicleCategoriesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetAllVehicleCategoriesResponseCopyWith<GetAllVehicleCategoriesResponse> get copyWith => _$GetAllVehicleCategoriesResponseCopyWithImpl<GetAllVehicleCategoriesResponse>(this as GetAllVehicleCategoriesResponse, _$identity);

  /// Serializes this GetAllVehicleCategoriesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllVehicleCategoriesResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'GetAllVehicleCategoriesResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $GetAllVehicleCategoriesResponseCopyWith<$Res>  {
  factory $GetAllVehicleCategoriesResponseCopyWith(GetAllVehicleCategoriesResponse value, $Res Function(GetAllVehicleCategoriesResponse) _then) = _$GetAllVehicleCategoriesResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, List<VehicleCategory> data
});




}
/// @nodoc
class _$GetAllVehicleCategoriesResponseCopyWithImpl<$Res>
    implements $GetAllVehicleCategoriesResponseCopyWith<$Res> {
  _$GetAllVehicleCategoriesResponseCopyWithImpl(this._self, this._then);

  final GetAllVehicleCategoriesResponse _self;
  final $Res Function(GetAllVehicleCategoriesResponse) _then;

/// Create a copy of GetAllVehicleCategoriesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<VehicleCategory>,
  ));
}

}


/// Adds pattern-matching-related methods to [GetAllVehicleCategoriesResponse].
extension GetAllVehicleCategoriesResponsePatterns on GetAllVehicleCategoriesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetAllVehicleCategoriesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetAllVehicleCategoriesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetAllVehicleCategoriesResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetAllVehicleCategoriesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetAllVehicleCategoriesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetAllVehicleCategoriesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  List<VehicleCategory> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetAllVehicleCategoriesResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  List<VehicleCategory> data)  $default,) {final _that = this;
switch (_that) {
case _GetAllVehicleCategoriesResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  List<VehicleCategory> data)?  $default,) {final _that = this;
switch (_that) {
case _GetAllVehicleCategoriesResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetAllVehicleCategoriesResponse implements GetAllVehicleCategoriesResponse {
  const _GetAllVehicleCategoriesResponse({required this.success, required this.message, required final  List<VehicleCategory> data}): _data = data;
  factory _GetAllVehicleCategoriesResponse.fromJson(Map<String, dynamic> json) => _$GetAllVehicleCategoriesResponseFromJson(json);

@override final  bool success;
@override final  String message;
 final  List<VehicleCategory> _data;
@override List<VehicleCategory> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of GetAllVehicleCategoriesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetAllVehicleCategoriesResponseCopyWith<_GetAllVehicleCategoriesResponse> get copyWith => __$GetAllVehicleCategoriesResponseCopyWithImpl<_GetAllVehicleCategoriesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetAllVehicleCategoriesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetAllVehicleCategoriesResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'GetAllVehicleCategoriesResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$GetAllVehicleCategoriesResponseCopyWith<$Res> implements $GetAllVehicleCategoriesResponseCopyWith<$Res> {
  factory _$GetAllVehicleCategoriesResponseCopyWith(_GetAllVehicleCategoriesResponse value, $Res Function(_GetAllVehicleCategoriesResponse) _then) = __$GetAllVehicleCategoriesResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, List<VehicleCategory> data
});




}
/// @nodoc
class __$GetAllVehicleCategoriesResponseCopyWithImpl<$Res>
    implements _$GetAllVehicleCategoriesResponseCopyWith<$Res> {
  __$GetAllVehicleCategoriesResponseCopyWithImpl(this._self, this._then);

  final _GetAllVehicleCategoriesResponse _self;
  final $Res Function(_GetAllVehicleCategoriesResponse) _then;

/// Create a copy of GetAllVehicleCategoriesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_GetAllVehicleCategoriesResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<VehicleCategory>,
  ));
}


}


/// @nodoc
mixin _$VehicleSubCategory {

@JsonKey(name: '_id') String get id; String get name; String? get image; double? get minimumPrice; double? get baseFare; bool? get disable; String? get cityId; dynamic get vehicleCategoryId;// Can be String ID or nested VehicleCategory Map
 List<String>? get requiredDocuments;
/// Create a copy of VehicleSubCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleSubCategoryCopyWith<VehicleSubCategory> get copyWith => _$VehicleSubCategoryCopyWithImpl<VehicleSubCategory>(this as VehicleSubCategory, _$identity);

  /// Serializes this VehicleSubCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleSubCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.minimumPrice, minimumPrice) || other.minimumPrice == minimumPrice)&&(identical(other.baseFare, baseFare) || other.baseFare == baseFare)&&(identical(other.disable, disable) || other.disable == disable)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&const DeepCollectionEquality().equals(other.vehicleCategoryId, vehicleCategoryId)&&const DeepCollectionEquality().equals(other.requiredDocuments, requiredDocuments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image,minimumPrice,baseFare,disable,cityId,const DeepCollectionEquality().hash(vehicleCategoryId),const DeepCollectionEquality().hash(requiredDocuments));

@override
String toString() {
  return 'VehicleSubCategory(id: $id, name: $name, image: $image, minimumPrice: $minimumPrice, baseFare: $baseFare, disable: $disable, cityId: $cityId, vehicleCategoryId: $vehicleCategoryId, requiredDocuments: $requiredDocuments)';
}


}

/// @nodoc
abstract mixin class $VehicleSubCategoryCopyWith<$Res>  {
  factory $VehicleSubCategoryCopyWith(VehicleSubCategory value, $Res Function(VehicleSubCategory) _then) = _$VehicleSubCategoryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String name, String? image, double? minimumPrice, double? baseFare, bool? disable, String? cityId, dynamic vehicleCategoryId, List<String>? requiredDocuments
});




}
/// @nodoc
class _$VehicleSubCategoryCopyWithImpl<$Res>
    implements $VehicleSubCategoryCopyWith<$Res> {
  _$VehicleSubCategoryCopyWithImpl(this._self, this._then);

  final VehicleSubCategory _self;
  final $Res Function(VehicleSubCategory) _then;

/// Create a copy of VehicleSubCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? image = freezed,Object? minimumPrice = freezed,Object? baseFare = freezed,Object? disable = freezed,Object? cityId = freezed,Object? vehicleCategoryId = freezed,Object? requiredDocuments = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,minimumPrice: freezed == minimumPrice ? _self.minimumPrice : minimumPrice // ignore: cast_nullable_to_non_nullable
as double?,baseFare: freezed == baseFare ? _self.baseFare : baseFare // ignore: cast_nullable_to_non_nullable
as double?,disable: freezed == disable ? _self.disable : disable // ignore: cast_nullable_to_non_nullable
as bool?,cityId: freezed == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as String?,vehicleCategoryId: freezed == vehicleCategoryId ? _self.vehicleCategoryId : vehicleCategoryId // ignore: cast_nullable_to_non_nullable
as dynamic,requiredDocuments: freezed == requiredDocuments ? _self.requiredDocuments : requiredDocuments // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [VehicleSubCategory].
extension VehicleSubCategoryPatterns on VehicleSubCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleSubCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleSubCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleSubCategory value)  $default,){
final _that = this;
switch (_that) {
case _VehicleSubCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleSubCategory value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleSubCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String name,  String? image,  double? minimumPrice,  double? baseFare,  bool? disable,  String? cityId,  dynamic vehicleCategoryId,  List<String>? requiredDocuments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleSubCategory() when $default != null:
return $default(_that.id,_that.name,_that.image,_that.minimumPrice,_that.baseFare,_that.disable,_that.cityId,_that.vehicleCategoryId,_that.requiredDocuments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String name,  String? image,  double? minimumPrice,  double? baseFare,  bool? disable,  String? cityId,  dynamic vehicleCategoryId,  List<String>? requiredDocuments)  $default,) {final _that = this;
switch (_that) {
case _VehicleSubCategory():
return $default(_that.id,_that.name,_that.image,_that.minimumPrice,_that.baseFare,_that.disable,_that.cityId,_that.vehicleCategoryId,_that.requiredDocuments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String name,  String? image,  double? minimumPrice,  double? baseFare,  bool? disable,  String? cityId,  dynamic vehicleCategoryId,  List<String>? requiredDocuments)?  $default,) {final _that = this;
switch (_that) {
case _VehicleSubCategory() when $default != null:
return $default(_that.id,_that.name,_that.image,_that.minimumPrice,_that.baseFare,_that.disable,_that.cityId,_that.vehicleCategoryId,_that.requiredDocuments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleSubCategory extends VehicleSubCategory {
  const _VehicleSubCategory({@JsonKey(name: '_id') required this.id, required this.name, this.image, this.minimumPrice, this.baseFare, this.disable, this.cityId, this.vehicleCategoryId, final  List<String>? requiredDocuments}): _requiredDocuments = requiredDocuments,super._();
  factory _VehicleSubCategory.fromJson(Map<String, dynamic> json) => _$VehicleSubCategoryFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String name;
@override final  String? image;
@override final  double? minimumPrice;
@override final  double? baseFare;
@override final  bool? disable;
@override final  String? cityId;
@override final  dynamic vehicleCategoryId;
// Can be String ID or nested VehicleCategory Map
 final  List<String>? _requiredDocuments;
// Can be String ID or nested VehicleCategory Map
@override List<String>? get requiredDocuments {
  final value = _requiredDocuments;
  if (value == null) return null;
  if (_requiredDocuments is EqualUnmodifiableListView) return _requiredDocuments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of VehicleSubCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleSubCategoryCopyWith<_VehicleSubCategory> get copyWith => __$VehicleSubCategoryCopyWithImpl<_VehicleSubCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleSubCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleSubCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.minimumPrice, minimumPrice) || other.minimumPrice == minimumPrice)&&(identical(other.baseFare, baseFare) || other.baseFare == baseFare)&&(identical(other.disable, disable) || other.disable == disable)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&const DeepCollectionEquality().equals(other.vehicleCategoryId, vehicleCategoryId)&&const DeepCollectionEquality().equals(other._requiredDocuments, _requiredDocuments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image,minimumPrice,baseFare,disable,cityId,const DeepCollectionEquality().hash(vehicleCategoryId),const DeepCollectionEquality().hash(_requiredDocuments));

@override
String toString() {
  return 'VehicleSubCategory(id: $id, name: $name, image: $image, minimumPrice: $minimumPrice, baseFare: $baseFare, disable: $disable, cityId: $cityId, vehicleCategoryId: $vehicleCategoryId, requiredDocuments: $requiredDocuments)';
}


}

/// @nodoc
abstract mixin class _$VehicleSubCategoryCopyWith<$Res> implements $VehicleSubCategoryCopyWith<$Res> {
  factory _$VehicleSubCategoryCopyWith(_VehicleSubCategory value, $Res Function(_VehicleSubCategory) _then) = __$VehicleSubCategoryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String name, String? image, double? minimumPrice, double? baseFare, bool? disable, String? cityId, dynamic vehicleCategoryId, List<String>? requiredDocuments
});




}
/// @nodoc
class __$VehicleSubCategoryCopyWithImpl<$Res>
    implements _$VehicleSubCategoryCopyWith<$Res> {
  __$VehicleSubCategoryCopyWithImpl(this._self, this._then);

  final _VehicleSubCategory _self;
  final $Res Function(_VehicleSubCategory) _then;

/// Create a copy of VehicleSubCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? image = freezed,Object? minimumPrice = freezed,Object? baseFare = freezed,Object? disable = freezed,Object? cityId = freezed,Object? vehicleCategoryId = freezed,Object? requiredDocuments = freezed,}) {
  return _then(_VehicleSubCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,minimumPrice: freezed == minimumPrice ? _self.minimumPrice : minimumPrice // ignore: cast_nullable_to_non_nullable
as double?,baseFare: freezed == baseFare ? _self.baseFare : baseFare // ignore: cast_nullable_to_non_nullable
as double?,disable: freezed == disable ? _self.disable : disable // ignore: cast_nullable_to_non_nullable
as bool?,cityId: freezed == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as String?,vehicleCategoryId: freezed == vehicleCategoryId ? _self.vehicleCategoryId : vehicleCategoryId // ignore: cast_nullable_to_non_nullable
as dynamic,requiredDocuments: freezed == requiredDocuments ? _self._requiredDocuments : requiredDocuments // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$GetAllSubVehicleCategoriesResponse {

 bool get success; String get message; List<VehicleSubCategory> get data;
/// Create a copy of GetAllSubVehicleCategoriesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetAllSubVehicleCategoriesResponseCopyWith<GetAllSubVehicleCategoriesResponse> get copyWith => _$GetAllSubVehicleCategoriesResponseCopyWithImpl<GetAllSubVehicleCategoriesResponse>(this as GetAllSubVehicleCategoriesResponse, _$identity);

  /// Serializes this GetAllSubVehicleCategoriesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllSubVehicleCategoriesResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'GetAllSubVehicleCategoriesResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $GetAllSubVehicleCategoriesResponseCopyWith<$Res>  {
  factory $GetAllSubVehicleCategoriesResponseCopyWith(GetAllSubVehicleCategoriesResponse value, $Res Function(GetAllSubVehicleCategoriesResponse) _then) = _$GetAllSubVehicleCategoriesResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, List<VehicleSubCategory> data
});




}
/// @nodoc
class _$GetAllSubVehicleCategoriesResponseCopyWithImpl<$Res>
    implements $GetAllSubVehicleCategoriesResponseCopyWith<$Res> {
  _$GetAllSubVehicleCategoriesResponseCopyWithImpl(this._self, this._then);

  final GetAllSubVehicleCategoriesResponse _self;
  final $Res Function(GetAllSubVehicleCategoriesResponse) _then;

/// Create a copy of GetAllSubVehicleCategoriesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<VehicleSubCategory>,
  ));
}

}


/// Adds pattern-matching-related methods to [GetAllSubVehicleCategoriesResponse].
extension GetAllSubVehicleCategoriesResponsePatterns on GetAllSubVehicleCategoriesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetAllSubVehicleCategoriesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetAllSubVehicleCategoriesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetAllSubVehicleCategoriesResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetAllSubVehicleCategoriesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetAllSubVehicleCategoriesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetAllSubVehicleCategoriesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  List<VehicleSubCategory> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetAllSubVehicleCategoriesResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  List<VehicleSubCategory> data)  $default,) {final _that = this;
switch (_that) {
case _GetAllSubVehicleCategoriesResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  List<VehicleSubCategory> data)?  $default,) {final _that = this;
switch (_that) {
case _GetAllSubVehicleCategoriesResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetAllSubVehicleCategoriesResponse implements GetAllSubVehicleCategoriesResponse {
  const _GetAllSubVehicleCategoriesResponse({required this.success, required this.message, required final  List<VehicleSubCategory> data}): _data = data;
  factory _GetAllSubVehicleCategoriesResponse.fromJson(Map<String, dynamic> json) => _$GetAllSubVehicleCategoriesResponseFromJson(json);

@override final  bool success;
@override final  String message;
 final  List<VehicleSubCategory> _data;
@override List<VehicleSubCategory> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of GetAllSubVehicleCategoriesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetAllSubVehicleCategoriesResponseCopyWith<_GetAllSubVehicleCategoriesResponse> get copyWith => __$GetAllSubVehicleCategoriesResponseCopyWithImpl<_GetAllSubVehicleCategoriesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetAllSubVehicleCategoriesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetAllSubVehicleCategoriesResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'GetAllSubVehicleCategoriesResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$GetAllSubVehicleCategoriesResponseCopyWith<$Res> implements $GetAllSubVehicleCategoriesResponseCopyWith<$Res> {
  factory _$GetAllSubVehicleCategoriesResponseCopyWith(_GetAllSubVehicleCategoriesResponse value, $Res Function(_GetAllSubVehicleCategoriesResponse) _then) = __$GetAllSubVehicleCategoriesResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, List<VehicleSubCategory> data
});




}
/// @nodoc
class __$GetAllSubVehicleCategoriesResponseCopyWithImpl<$Res>
    implements _$GetAllSubVehicleCategoriesResponseCopyWith<$Res> {
  __$GetAllSubVehicleCategoriesResponseCopyWithImpl(this._self, this._then);

  final _GetAllSubVehicleCategoriesResponse _self;
  final $Res Function(_GetAllSubVehicleCategoriesResponse) _then;

/// Create a copy of GetAllSubVehicleCategoriesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_GetAllSubVehicleCategoriesResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<VehicleSubCategory>,
  ));
}


}

// dart format on
