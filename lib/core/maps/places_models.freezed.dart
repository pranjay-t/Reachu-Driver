// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'places_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlaceAutocompleteResult {

 String get placeId; String get primaryText; String get secondaryText; String get fullText;
/// Create a copy of PlaceAutocompleteResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceAutocompleteResultCopyWith<PlaceAutocompleteResult> get copyWith => _$PlaceAutocompleteResultCopyWithImpl<PlaceAutocompleteResult>(this as PlaceAutocompleteResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceAutocompleteResult&&(identical(other.placeId, placeId) || other.placeId == placeId)&&(identical(other.primaryText, primaryText) || other.primaryText == primaryText)&&(identical(other.secondaryText, secondaryText) || other.secondaryText == secondaryText)&&(identical(other.fullText, fullText) || other.fullText == fullText));
}


@override
int get hashCode => Object.hash(runtimeType,placeId,primaryText,secondaryText,fullText);

@override
String toString() {
  return 'PlaceAutocompleteResult(placeId: $placeId, primaryText: $primaryText, secondaryText: $secondaryText, fullText: $fullText)';
}


}

/// @nodoc
abstract mixin class $PlaceAutocompleteResultCopyWith<$Res>  {
  factory $PlaceAutocompleteResultCopyWith(PlaceAutocompleteResult value, $Res Function(PlaceAutocompleteResult) _then) = _$PlaceAutocompleteResultCopyWithImpl;
@useResult
$Res call({
 String placeId, String primaryText, String secondaryText, String fullText
});




}
/// @nodoc
class _$PlaceAutocompleteResultCopyWithImpl<$Res>
    implements $PlaceAutocompleteResultCopyWith<$Res> {
  _$PlaceAutocompleteResultCopyWithImpl(this._self, this._then);

  final PlaceAutocompleteResult _self;
  final $Res Function(PlaceAutocompleteResult) _then;

/// Create a copy of PlaceAutocompleteResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? placeId = null,Object? primaryText = null,Object? secondaryText = null,Object? fullText = null,}) {
  return _then(_self.copyWith(
placeId: null == placeId ? _self.placeId : placeId // ignore: cast_nullable_to_non_nullable
as String,primaryText: null == primaryText ? _self.primaryText : primaryText // ignore: cast_nullable_to_non_nullable
as String,secondaryText: null == secondaryText ? _self.secondaryText : secondaryText // ignore: cast_nullable_to_non_nullable
as String,fullText: null == fullText ? _self.fullText : fullText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaceAutocompleteResult].
extension PlaceAutocompleteResultPatterns on PlaceAutocompleteResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaceAutocompleteResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaceAutocompleteResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaceAutocompleteResult value)  $default,){
final _that = this;
switch (_that) {
case _PlaceAutocompleteResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaceAutocompleteResult value)?  $default,){
final _that = this;
switch (_that) {
case _PlaceAutocompleteResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String placeId,  String primaryText,  String secondaryText,  String fullText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaceAutocompleteResult() when $default != null:
return $default(_that.placeId,_that.primaryText,_that.secondaryText,_that.fullText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String placeId,  String primaryText,  String secondaryText,  String fullText)  $default,) {final _that = this;
switch (_that) {
case _PlaceAutocompleteResult():
return $default(_that.placeId,_that.primaryText,_that.secondaryText,_that.fullText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String placeId,  String primaryText,  String secondaryText,  String fullText)?  $default,) {final _that = this;
switch (_that) {
case _PlaceAutocompleteResult() when $default != null:
return $default(_that.placeId,_that.primaryText,_that.secondaryText,_that.fullText);case _:
  return null;

}
}

}

/// @nodoc


class _PlaceAutocompleteResult extends PlaceAutocompleteResult {
  const _PlaceAutocompleteResult({required this.placeId, required this.primaryText, required this.secondaryText, required this.fullText}): super._();
  

@override final  String placeId;
@override final  String primaryText;
@override final  String secondaryText;
@override final  String fullText;

/// Create a copy of PlaceAutocompleteResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceAutocompleteResultCopyWith<_PlaceAutocompleteResult> get copyWith => __$PlaceAutocompleteResultCopyWithImpl<_PlaceAutocompleteResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaceAutocompleteResult&&(identical(other.placeId, placeId) || other.placeId == placeId)&&(identical(other.primaryText, primaryText) || other.primaryText == primaryText)&&(identical(other.secondaryText, secondaryText) || other.secondaryText == secondaryText)&&(identical(other.fullText, fullText) || other.fullText == fullText));
}


@override
int get hashCode => Object.hash(runtimeType,placeId,primaryText,secondaryText,fullText);

@override
String toString() {
  return 'PlaceAutocompleteResult(placeId: $placeId, primaryText: $primaryText, secondaryText: $secondaryText, fullText: $fullText)';
}


}

/// @nodoc
abstract mixin class _$PlaceAutocompleteResultCopyWith<$Res> implements $PlaceAutocompleteResultCopyWith<$Res> {
  factory _$PlaceAutocompleteResultCopyWith(_PlaceAutocompleteResult value, $Res Function(_PlaceAutocompleteResult) _then) = __$PlaceAutocompleteResultCopyWithImpl;
@override @useResult
$Res call({
 String placeId, String primaryText, String secondaryText, String fullText
});




}
/// @nodoc
class __$PlaceAutocompleteResultCopyWithImpl<$Res>
    implements _$PlaceAutocompleteResultCopyWith<$Res> {
  __$PlaceAutocompleteResultCopyWithImpl(this._self, this._then);

  final _PlaceAutocompleteResult _self;
  final $Res Function(_PlaceAutocompleteResult) _then;

/// Create a copy of PlaceAutocompleteResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? placeId = null,Object? primaryText = null,Object? secondaryText = null,Object? fullText = null,}) {
  return _then(_PlaceAutocompleteResult(
placeId: null == placeId ? _self.placeId : placeId // ignore: cast_nullable_to_non_nullable
as String,primaryText: null == primaryText ? _self.primaryText : primaryText // ignore: cast_nullable_to_non_nullable
as String,secondaryText: null == secondaryText ? _self.secondaryText : secondaryText // ignore: cast_nullable_to_non_nullable
as String,fullText: null == fullText ? _self.fullText : fullText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$PlaceDetails {

 String get placeId; String get name; String get formattedAddress; double get latitude; double get longitude;
/// Create a copy of PlaceDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceDetailsCopyWith<PlaceDetails> get copyWith => _$PlaceDetailsCopyWithImpl<PlaceDetails>(this as PlaceDetails, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceDetails&&(identical(other.placeId, placeId) || other.placeId == placeId)&&(identical(other.name, name) || other.name == name)&&(identical(other.formattedAddress, formattedAddress) || other.formattedAddress == formattedAddress)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,placeId,name,formattedAddress,latitude,longitude);

@override
String toString() {
  return 'PlaceDetails(placeId: $placeId, name: $name, formattedAddress: $formattedAddress, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $PlaceDetailsCopyWith<$Res>  {
  factory $PlaceDetailsCopyWith(PlaceDetails value, $Res Function(PlaceDetails) _then) = _$PlaceDetailsCopyWithImpl;
@useResult
$Res call({
 String placeId, String name, String formattedAddress, double latitude, double longitude
});




}
/// @nodoc
class _$PlaceDetailsCopyWithImpl<$Res>
    implements $PlaceDetailsCopyWith<$Res> {
  _$PlaceDetailsCopyWithImpl(this._self, this._then);

  final PlaceDetails _self;
  final $Res Function(PlaceDetails) _then;

/// Create a copy of PlaceDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? placeId = null,Object? name = null,Object? formattedAddress = null,Object? latitude = null,Object? longitude = null,}) {
  return _then(_self.copyWith(
placeId: null == placeId ? _self.placeId : placeId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,formattedAddress: null == formattedAddress ? _self.formattedAddress : formattedAddress // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaceDetails].
extension PlaceDetailsPatterns on PlaceDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaceDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaceDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaceDetails value)  $default,){
final _that = this;
switch (_that) {
case _PlaceDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaceDetails value)?  $default,){
final _that = this;
switch (_that) {
case _PlaceDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String placeId,  String name,  String formattedAddress,  double latitude,  double longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaceDetails() when $default != null:
return $default(_that.placeId,_that.name,_that.formattedAddress,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String placeId,  String name,  String formattedAddress,  double latitude,  double longitude)  $default,) {final _that = this;
switch (_that) {
case _PlaceDetails():
return $default(_that.placeId,_that.name,_that.formattedAddress,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String placeId,  String name,  String formattedAddress,  double latitude,  double longitude)?  $default,) {final _that = this;
switch (_that) {
case _PlaceDetails() when $default != null:
return $default(_that.placeId,_that.name,_that.formattedAddress,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc


class _PlaceDetails extends PlaceDetails {
  const _PlaceDetails({required this.placeId, required this.name, required this.formattedAddress, required this.latitude, required this.longitude}): super._();
  

@override final  String placeId;
@override final  String name;
@override final  String formattedAddress;
@override final  double latitude;
@override final  double longitude;

/// Create a copy of PlaceDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceDetailsCopyWith<_PlaceDetails> get copyWith => __$PlaceDetailsCopyWithImpl<_PlaceDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaceDetails&&(identical(other.placeId, placeId) || other.placeId == placeId)&&(identical(other.name, name) || other.name == name)&&(identical(other.formattedAddress, formattedAddress) || other.formattedAddress == formattedAddress)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,placeId,name,formattedAddress,latitude,longitude);

@override
String toString() {
  return 'PlaceDetails(placeId: $placeId, name: $name, formattedAddress: $formattedAddress, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$PlaceDetailsCopyWith<$Res> implements $PlaceDetailsCopyWith<$Res> {
  factory _$PlaceDetailsCopyWith(_PlaceDetails value, $Res Function(_PlaceDetails) _then) = __$PlaceDetailsCopyWithImpl;
@override @useResult
$Res call({
 String placeId, String name, String formattedAddress, double latitude, double longitude
});




}
/// @nodoc
class __$PlaceDetailsCopyWithImpl<$Res>
    implements _$PlaceDetailsCopyWith<$Res> {
  __$PlaceDetailsCopyWithImpl(this._self, this._then);

  final _PlaceDetails _self;
  final $Res Function(_PlaceDetails) _then;

/// Create a copy of PlaceDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? placeId = null,Object? name = null,Object? formattedAddress = null,Object? latitude = null,Object? longitude = null,}) {
  return _then(_PlaceDetails(
placeId: null == placeId ? _self.placeId : placeId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,formattedAddress: null == formattedAddress ? _self.formattedAddress : formattedAddress // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
