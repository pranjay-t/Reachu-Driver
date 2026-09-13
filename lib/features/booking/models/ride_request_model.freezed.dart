// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ride_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LatLngModel {

@JsonKey(fromJson: _doubleFromJson) double get latitude;@JsonKey(fromJson: _doubleFromJson) double get longitude;
/// Create a copy of LatLngModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LatLngModelCopyWith<LatLngModel> get copyWith => _$LatLngModelCopyWithImpl<LatLngModel>(this as LatLngModel, _$identity);

  /// Serializes this LatLngModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LatLngModel&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude);

@override
String toString() {
  return 'LatLngModel(latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $LatLngModelCopyWith<$Res>  {
  factory $LatLngModelCopyWith(LatLngModel value, $Res Function(LatLngModel) _then) = _$LatLngModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _doubleFromJson) double latitude,@JsonKey(fromJson: _doubleFromJson) double longitude
});




}
/// @nodoc
class _$LatLngModelCopyWithImpl<$Res>
    implements $LatLngModelCopyWith<$Res> {
  _$LatLngModelCopyWithImpl(this._self, this._then);

  final LatLngModel _self;
  final $Res Function(LatLngModel) _then;

/// Create a copy of LatLngModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,}) {
  return _then(_self.copyWith(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [LatLngModel].
extension LatLngModelPatterns on LatLngModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LatLngModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LatLngModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LatLngModel value)  $default,){
final _that = this;
switch (_that) {
case _LatLngModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LatLngModel value)?  $default,){
final _that = this;
switch (_that) {
case _LatLngModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _doubleFromJson)  double latitude, @JsonKey(fromJson: _doubleFromJson)  double longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LatLngModel() when $default != null:
return $default(_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _doubleFromJson)  double latitude, @JsonKey(fromJson: _doubleFromJson)  double longitude)  $default,) {final _that = this;
switch (_that) {
case _LatLngModel():
return $default(_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _doubleFromJson)  double latitude, @JsonKey(fromJson: _doubleFromJson)  double longitude)?  $default,) {final _that = this;
switch (_that) {
case _LatLngModel() when $default != null:
return $default(_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LatLngModel implements LatLngModel {
  const _LatLngModel({@JsonKey(fromJson: _doubleFromJson) required this.latitude, @JsonKey(fromJson: _doubleFromJson) required this.longitude});
  factory _LatLngModel.fromJson(Map<String, dynamic> json) => _$LatLngModelFromJson(json);

@override@JsonKey(fromJson: _doubleFromJson) final  double latitude;
@override@JsonKey(fromJson: _doubleFromJson) final  double longitude;

/// Create a copy of LatLngModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LatLngModelCopyWith<_LatLngModel> get copyWith => __$LatLngModelCopyWithImpl<_LatLngModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LatLngModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LatLngModel&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude);

@override
String toString() {
  return 'LatLngModel(latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$LatLngModelCopyWith<$Res> implements $LatLngModelCopyWith<$Res> {
  factory _$LatLngModelCopyWith(_LatLngModel value, $Res Function(_LatLngModel) _then) = __$LatLngModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _doubleFromJson) double latitude,@JsonKey(fromJson: _doubleFromJson) double longitude
});




}
/// @nodoc
class __$LatLngModelCopyWithImpl<$Res>
    implements _$LatLngModelCopyWith<$Res> {
  __$LatLngModelCopyWithImpl(this._self, this._then);

  final _LatLngModel _self;
  final $Res Function(_LatLngModel) _then;

/// Create a copy of LatLngModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,}) {
  return _then(_LatLngModel(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$LocationDetailsModel {

 String get address; String get type; List<double> get coordinates;
/// Create a copy of LocationDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationDetailsModelCopyWith<LocationDetailsModel> get copyWith => _$LocationDetailsModelCopyWithImpl<LocationDetailsModel>(this as LocationDetailsModel, _$identity);

  /// Serializes this LocationDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationDetailsModel&&(identical(other.address, address) || other.address == address)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.coordinates, coordinates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,type,const DeepCollectionEquality().hash(coordinates));

@override
String toString() {
  return 'LocationDetailsModel(address: $address, type: $type, coordinates: $coordinates)';
}


}

/// @nodoc
abstract mixin class $LocationDetailsModelCopyWith<$Res>  {
  factory $LocationDetailsModelCopyWith(LocationDetailsModel value, $Res Function(LocationDetailsModel) _then) = _$LocationDetailsModelCopyWithImpl;
@useResult
$Res call({
 String address, String type, List<double> coordinates
});




}
/// @nodoc
class _$LocationDetailsModelCopyWithImpl<$Res>
    implements $LocationDetailsModelCopyWith<$Res> {
  _$LocationDetailsModelCopyWithImpl(this._self, this._then);

  final LocationDetailsModel _self;
  final $Res Function(LocationDetailsModel) _then;

/// Create a copy of LocationDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? type = null,Object? coordinates = null,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationDetailsModel].
extension LocationDetailsModelPatterns on LocationDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _LocationDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _LocationDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String address,  String type,  List<double> coordinates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationDetailsModel() when $default != null:
return $default(_that.address,_that.type,_that.coordinates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String address,  String type,  List<double> coordinates)  $default,) {final _that = this;
switch (_that) {
case _LocationDetailsModel():
return $default(_that.address,_that.type,_that.coordinates);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String address,  String type,  List<double> coordinates)?  $default,) {final _that = this;
switch (_that) {
case _LocationDetailsModel() when $default != null:
return $default(_that.address,_that.type,_that.coordinates);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocationDetailsModel implements LocationDetailsModel {
  const _LocationDetailsModel({required this.address, required this.type, required final  List<double> coordinates}): _coordinates = coordinates;
  factory _LocationDetailsModel.fromJson(Map<String, dynamic> json) => _$LocationDetailsModelFromJson(json);

@override final  String address;
@override final  String type;
 final  List<double> _coordinates;
@override List<double> get coordinates {
  if (_coordinates is EqualUnmodifiableListView) return _coordinates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_coordinates);
}


/// Create a copy of LocationDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationDetailsModelCopyWith<_LocationDetailsModel> get copyWith => __$LocationDetailsModelCopyWithImpl<_LocationDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationDetailsModel&&(identical(other.address, address) || other.address == address)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._coordinates, _coordinates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,type,const DeepCollectionEquality().hash(_coordinates));

@override
String toString() {
  return 'LocationDetailsModel(address: $address, type: $type, coordinates: $coordinates)';
}


}

/// @nodoc
abstract mixin class _$LocationDetailsModelCopyWith<$Res> implements $LocationDetailsModelCopyWith<$Res> {
  factory _$LocationDetailsModelCopyWith(_LocationDetailsModel value, $Res Function(_LocationDetailsModel) _then) = __$LocationDetailsModelCopyWithImpl;
@override @useResult
$Res call({
 String address, String type, List<double> coordinates
});




}
/// @nodoc
class __$LocationDetailsModelCopyWithImpl<$Res>
    implements _$LocationDetailsModelCopyWith<$Res> {
  __$LocationDetailsModelCopyWithImpl(this._self, this._then);

  final _LocationDetailsModel _self;
  final $Res Function(_LocationDetailsModel) _then;

/// Create a copy of LocationDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? type = null,Object? coordinates = null,}) {
  return _then(_LocationDetailsModel(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,coordinates: null == coordinates ? _self._coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}


}


/// @nodoc
mixin _$FareBreakdownModel {

 String get currency;@JsonKey(fromJson: _doubleFromJson) double get baseFare;@JsonKey(fromJson: _doubleFromJson) double get weatherSurcharge;@JsonKey(fromJson: _doubleFromJson) double get trafficSurcharge;@JsonKey(fromJson: _doubleFromJson) double get waitingCharge; double? get rental;@JsonKey(fromJson: _doubleFromJson) double get grossFare; String? get promoCode;@JsonKey(fromJson: _doubleFromJson) double get promoCodeDiscount;@JsonKey(fromJson: _doubleFromJson) double get pendingDue;@JsonKey(fromJson: _doubleFromJson) double get netPayable;
/// Create a copy of FareBreakdownModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FareBreakdownModelCopyWith<FareBreakdownModel> get copyWith => _$FareBreakdownModelCopyWithImpl<FareBreakdownModel>(this as FareBreakdownModel, _$identity);

  /// Serializes this FareBreakdownModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FareBreakdownModel&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.baseFare, baseFare) || other.baseFare == baseFare)&&(identical(other.weatherSurcharge, weatherSurcharge) || other.weatherSurcharge == weatherSurcharge)&&(identical(other.trafficSurcharge, trafficSurcharge) || other.trafficSurcharge == trafficSurcharge)&&(identical(other.waitingCharge, waitingCharge) || other.waitingCharge == waitingCharge)&&(identical(other.rental, rental) || other.rental == rental)&&(identical(other.grossFare, grossFare) || other.grossFare == grossFare)&&(identical(other.promoCode, promoCode) || other.promoCode == promoCode)&&(identical(other.promoCodeDiscount, promoCodeDiscount) || other.promoCodeDiscount == promoCodeDiscount)&&(identical(other.pendingDue, pendingDue) || other.pendingDue == pendingDue)&&(identical(other.netPayable, netPayable) || other.netPayable == netPayable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currency,baseFare,weatherSurcharge,trafficSurcharge,waitingCharge,rental,grossFare,promoCode,promoCodeDiscount,pendingDue,netPayable);

@override
String toString() {
  return 'FareBreakdownModel(currency: $currency, baseFare: $baseFare, weatherSurcharge: $weatherSurcharge, trafficSurcharge: $trafficSurcharge, waitingCharge: $waitingCharge, rental: $rental, grossFare: $grossFare, promoCode: $promoCode, promoCodeDiscount: $promoCodeDiscount, pendingDue: $pendingDue, netPayable: $netPayable)';
}


}

/// @nodoc
abstract mixin class $FareBreakdownModelCopyWith<$Res>  {
  factory $FareBreakdownModelCopyWith(FareBreakdownModel value, $Res Function(FareBreakdownModel) _then) = _$FareBreakdownModelCopyWithImpl;
@useResult
$Res call({
 String currency,@JsonKey(fromJson: _doubleFromJson) double baseFare,@JsonKey(fromJson: _doubleFromJson) double weatherSurcharge,@JsonKey(fromJson: _doubleFromJson) double trafficSurcharge,@JsonKey(fromJson: _doubleFromJson) double waitingCharge, double? rental,@JsonKey(fromJson: _doubleFromJson) double grossFare, String? promoCode,@JsonKey(fromJson: _doubleFromJson) double promoCodeDiscount,@JsonKey(fromJson: _doubleFromJson) double pendingDue,@JsonKey(fromJson: _doubleFromJson) double netPayable
});




}
/// @nodoc
class _$FareBreakdownModelCopyWithImpl<$Res>
    implements $FareBreakdownModelCopyWith<$Res> {
  _$FareBreakdownModelCopyWithImpl(this._self, this._then);

  final FareBreakdownModel _self;
  final $Res Function(FareBreakdownModel) _then;

/// Create a copy of FareBreakdownModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currency = null,Object? baseFare = null,Object? weatherSurcharge = null,Object? trafficSurcharge = null,Object? waitingCharge = null,Object? rental = freezed,Object? grossFare = null,Object? promoCode = freezed,Object? promoCodeDiscount = null,Object? pendingDue = null,Object? netPayable = null,}) {
  return _then(_self.copyWith(
currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,baseFare: null == baseFare ? _self.baseFare : baseFare // ignore: cast_nullable_to_non_nullable
as double,weatherSurcharge: null == weatherSurcharge ? _self.weatherSurcharge : weatherSurcharge // ignore: cast_nullable_to_non_nullable
as double,trafficSurcharge: null == trafficSurcharge ? _self.trafficSurcharge : trafficSurcharge // ignore: cast_nullable_to_non_nullable
as double,waitingCharge: null == waitingCharge ? _self.waitingCharge : waitingCharge // ignore: cast_nullable_to_non_nullable
as double,rental: freezed == rental ? _self.rental : rental // ignore: cast_nullable_to_non_nullable
as double?,grossFare: null == grossFare ? _self.grossFare : grossFare // ignore: cast_nullable_to_non_nullable
as double,promoCode: freezed == promoCode ? _self.promoCode : promoCode // ignore: cast_nullable_to_non_nullable
as String?,promoCodeDiscount: null == promoCodeDiscount ? _self.promoCodeDiscount : promoCodeDiscount // ignore: cast_nullable_to_non_nullable
as double,pendingDue: null == pendingDue ? _self.pendingDue : pendingDue // ignore: cast_nullable_to_non_nullable
as double,netPayable: null == netPayable ? _self.netPayable : netPayable // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [FareBreakdownModel].
extension FareBreakdownModelPatterns on FareBreakdownModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FareBreakdownModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FareBreakdownModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FareBreakdownModel value)  $default,){
final _that = this;
switch (_that) {
case _FareBreakdownModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FareBreakdownModel value)?  $default,){
final _that = this;
switch (_that) {
case _FareBreakdownModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String currency, @JsonKey(fromJson: _doubleFromJson)  double baseFare, @JsonKey(fromJson: _doubleFromJson)  double weatherSurcharge, @JsonKey(fromJson: _doubleFromJson)  double trafficSurcharge, @JsonKey(fromJson: _doubleFromJson)  double waitingCharge,  double? rental, @JsonKey(fromJson: _doubleFromJson)  double grossFare,  String? promoCode, @JsonKey(fromJson: _doubleFromJson)  double promoCodeDiscount, @JsonKey(fromJson: _doubleFromJson)  double pendingDue, @JsonKey(fromJson: _doubleFromJson)  double netPayable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FareBreakdownModel() when $default != null:
return $default(_that.currency,_that.baseFare,_that.weatherSurcharge,_that.trafficSurcharge,_that.waitingCharge,_that.rental,_that.grossFare,_that.promoCode,_that.promoCodeDiscount,_that.pendingDue,_that.netPayable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String currency, @JsonKey(fromJson: _doubleFromJson)  double baseFare, @JsonKey(fromJson: _doubleFromJson)  double weatherSurcharge, @JsonKey(fromJson: _doubleFromJson)  double trafficSurcharge, @JsonKey(fromJson: _doubleFromJson)  double waitingCharge,  double? rental, @JsonKey(fromJson: _doubleFromJson)  double grossFare,  String? promoCode, @JsonKey(fromJson: _doubleFromJson)  double promoCodeDiscount, @JsonKey(fromJson: _doubleFromJson)  double pendingDue, @JsonKey(fromJson: _doubleFromJson)  double netPayable)  $default,) {final _that = this;
switch (_that) {
case _FareBreakdownModel():
return $default(_that.currency,_that.baseFare,_that.weatherSurcharge,_that.trafficSurcharge,_that.waitingCharge,_that.rental,_that.grossFare,_that.promoCode,_that.promoCodeDiscount,_that.pendingDue,_that.netPayable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String currency, @JsonKey(fromJson: _doubleFromJson)  double baseFare, @JsonKey(fromJson: _doubleFromJson)  double weatherSurcharge, @JsonKey(fromJson: _doubleFromJson)  double trafficSurcharge, @JsonKey(fromJson: _doubleFromJson)  double waitingCharge,  double? rental, @JsonKey(fromJson: _doubleFromJson)  double grossFare,  String? promoCode, @JsonKey(fromJson: _doubleFromJson)  double promoCodeDiscount, @JsonKey(fromJson: _doubleFromJson)  double pendingDue, @JsonKey(fromJson: _doubleFromJson)  double netPayable)?  $default,) {final _that = this;
switch (_that) {
case _FareBreakdownModel() when $default != null:
return $default(_that.currency,_that.baseFare,_that.weatherSurcharge,_that.trafficSurcharge,_that.waitingCharge,_that.rental,_that.grossFare,_that.promoCode,_that.promoCodeDiscount,_that.pendingDue,_that.netPayable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FareBreakdownModel implements FareBreakdownModel {
  const _FareBreakdownModel({required this.currency, @JsonKey(fromJson: _doubleFromJson) required this.baseFare, @JsonKey(fromJson: _doubleFromJson) required this.weatherSurcharge, @JsonKey(fromJson: _doubleFromJson) required this.trafficSurcharge, @JsonKey(fromJson: _doubleFromJson) required this.waitingCharge, this.rental, @JsonKey(fromJson: _doubleFromJson) required this.grossFare, this.promoCode, @JsonKey(fromJson: _doubleFromJson) required this.promoCodeDiscount, @JsonKey(fromJson: _doubleFromJson) required this.pendingDue, @JsonKey(fromJson: _doubleFromJson) required this.netPayable});
  factory _FareBreakdownModel.fromJson(Map<String, dynamic> json) => _$FareBreakdownModelFromJson(json);

@override final  String currency;
@override@JsonKey(fromJson: _doubleFromJson) final  double baseFare;
@override@JsonKey(fromJson: _doubleFromJson) final  double weatherSurcharge;
@override@JsonKey(fromJson: _doubleFromJson) final  double trafficSurcharge;
@override@JsonKey(fromJson: _doubleFromJson) final  double waitingCharge;
@override final  double? rental;
@override@JsonKey(fromJson: _doubleFromJson) final  double grossFare;
@override final  String? promoCode;
@override@JsonKey(fromJson: _doubleFromJson) final  double promoCodeDiscount;
@override@JsonKey(fromJson: _doubleFromJson) final  double pendingDue;
@override@JsonKey(fromJson: _doubleFromJson) final  double netPayable;

/// Create a copy of FareBreakdownModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FareBreakdownModelCopyWith<_FareBreakdownModel> get copyWith => __$FareBreakdownModelCopyWithImpl<_FareBreakdownModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FareBreakdownModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FareBreakdownModel&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.baseFare, baseFare) || other.baseFare == baseFare)&&(identical(other.weatherSurcharge, weatherSurcharge) || other.weatherSurcharge == weatherSurcharge)&&(identical(other.trafficSurcharge, trafficSurcharge) || other.trafficSurcharge == trafficSurcharge)&&(identical(other.waitingCharge, waitingCharge) || other.waitingCharge == waitingCharge)&&(identical(other.rental, rental) || other.rental == rental)&&(identical(other.grossFare, grossFare) || other.grossFare == grossFare)&&(identical(other.promoCode, promoCode) || other.promoCode == promoCode)&&(identical(other.promoCodeDiscount, promoCodeDiscount) || other.promoCodeDiscount == promoCodeDiscount)&&(identical(other.pendingDue, pendingDue) || other.pendingDue == pendingDue)&&(identical(other.netPayable, netPayable) || other.netPayable == netPayable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currency,baseFare,weatherSurcharge,trafficSurcharge,waitingCharge,rental,grossFare,promoCode,promoCodeDiscount,pendingDue,netPayable);

@override
String toString() {
  return 'FareBreakdownModel(currency: $currency, baseFare: $baseFare, weatherSurcharge: $weatherSurcharge, trafficSurcharge: $trafficSurcharge, waitingCharge: $waitingCharge, rental: $rental, grossFare: $grossFare, promoCode: $promoCode, promoCodeDiscount: $promoCodeDiscount, pendingDue: $pendingDue, netPayable: $netPayable)';
}


}

/// @nodoc
abstract mixin class _$FareBreakdownModelCopyWith<$Res> implements $FareBreakdownModelCopyWith<$Res> {
  factory _$FareBreakdownModelCopyWith(_FareBreakdownModel value, $Res Function(_FareBreakdownModel) _then) = __$FareBreakdownModelCopyWithImpl;
@override @useResult
$Res call({
 String currency,@JsonKey(fromJson: _doubleFromJson) double baseFare,@JsonKey(fromJson: _doubleFromJson) double weatherSurcharge,@JsonKey(fromJson: _doubleFromJson) double trafficSurcharge,@JsonKey(fromJson: _doubleFromJson) double waitingCharge, double? rental,@JsonKey(fromJson: _doubleFromJson) double grossFare, String? promoCode,@JsonKey(fromJson: _doubleFromJson) double promoCodeDiscount,@JsonKey(fromJson: _doubleFromJson) double pendingDue,@JsonKey(fromJson: _doubleFromJson) double netPayable
});




}
/// @nodoc
class __$FareBreakdownModelCopyWithImpl<$Res>
    implements _$FareBreakdownModelCopyWith<$Res> {
  __$FareBreakdownModelCopyWithImpl(this._self, this._then);

  final _FareBreakdownModel _self;
  final $Res Function(_FareBreakdownModel) _then;

/// Create a copy of FareBreakdownModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currency = null,Object? baseFare = null,Object? weatherSurcharge = null,Object? trafficSurcharge = null,Object? waitingCharge = null,Object? rental = freezed,Object? grossFare = null,Object? promoCode = freezed,Object? promoCodeDiscount = null,Object? pendingDue = null,Object? netPayable = null,}) {
  return _then(_FareBreakdownModel(
currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,baseFare: null == baseFare ? _self.baseFare : baseFare // ignore: cast_nullable_to_non_nullable
as double,weatherSurcharge: null == weatherSurcharge ? _self.weatherSurcharge : weatherSurcharge // ignore: cast_nullable_to_non_nullable
as double,trafficSurcharge: null == trafficSurcharge ? _self.trafficSurcharge : trafficSurcharge // ignore: cast_nullable_to_non_nullable
as double,waitingCharge: null == waitingCharge ? _self.waitingCharge : waitingCharge // ignore: cast_nullable_to_non_nullable
as double,rental: freezed == rental ? _self.rental : rental // ignore: cast_nullable_to_non_nullable
as double?,grossFare: null == grossFare ? _self.grossFare : grossFare // ignore: cast_nullable_to_non_nullable
as double,promoCode: freezed == promoCode ? _self.promoCode : promoCode // ignore: cast_nullable_to_non_nullable
as String?,promoCodeDiscount: null == promoCodeDiscount ? _self.promoCodeDiscount : promoCodeDiscount // ignore: cast_nullable_to_non_nullable
as double,pendingDue: null == pendingDue ? _self.pendingDue : pendingDue // ignore: cast_nullable_to_non_nullable
as double,netPayable: null == netPayable ? _self.netPayable : netPayable // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$GoodsDetailsModel {

 String get goodsType; String get description;@JsonKey(fromJson: _doubleFromJson) double get estimatedWeight;@JsonKey(fromJson: _doubleFromJson) double get quantity;@JsonKey(fromJson: _doubleFromJson) double get worth; bool get isFragile;
/// Create a copy of GoodsDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoodsDetailsModelCopyWith<GoodsDetailsModel> get copyWith => _$GoodsDetailsModelCopyWithImpl<GoodsDetailsModel>(this as GoodsDetailsModel, _$identity);

  /// Serializes this GoodsDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoodsDetailsModel&&(identical(other.goodsType, goodsType) || other.goodsType == goodsType)&&(identical(other.description, description) || other.description == description)&&(identical(other.estimatedWeight, estimatedWeight) || other.estimatedWeight == estimatedWeight)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.worth, worth) || other.worth == worth)&&(identical(other.isFragile, isFragile) || other.isFragile == isFragile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,goodsType,description,estimatedWeight,quantity,worth,isFragile);

@override
String toString() {
  return 'GoodsDetailsModel(goodsType: $goodsType, description: $description, estimatedWeight: $estimatedWeight, quantity: $quantity, worth: $worth, isFragile: $isFragile)';
}


}

/// @nodoc
abstract mixin class $GoodsDetailsModelCopyWith<$Res>  {
  factory $GoodsDetailsModelCopyWith(GoodsDetailsModel value, $Res Function(GoodsDetailsModel) _then) = _$GoodsDetailsModelCopyWithImpl;
@useResult
$Res call({
 String goodsType, String description,@JsonKey(fromJson: _doubleFromJson) double estimatedWeight,@JsonKey(fromJson: _doubleFromJson) double quantity,@JsonKey(fromJson: _doubleFromJson) double worth, bool isFragile
});




}
/// @nodoc
class _$GoodsDetailsModelCopyWithImpl<$Res>
    implements $GoodsDetailsModelCopyWith<$Res> {
  _$GoodsDetailsModelCopyWithImpl(this._self, this._then);

  final GoodsDetailsModel _self;
  final $Res Function(GoodsDetailsModel) _then;

/// Create a copy of GoodsDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? goodsType = null,Object? description = null,Object? estimatedWeight = null,Object? quantity = null,Object? worth = null,Object? isFragile = null,}) {
  return _then(_self.copyWith(
goodsType: null == goodsType ? _self.goodsType : goodsType // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,estimatedWeight: null == estimatedWeight ? _self.estimatedWeight : estimatedWeight // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,worth: null == worth ? _self.worth : worth // ignore: cast_nullable_to_non_nullable
as double,isFragile: null == isFragile ? _self.isFragile : isFragile // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GoodsDetailsModel].
extension GoodsDetailsModelPatterns on GoodsDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoodsDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoodsDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoodsDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _GoodsDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoodsDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _GoodsDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String goodsType,  String description, @JsonKey(fromJson: _doubleFromJson)  double estimatedWeight, @JsonKey(fromJson: _doubleFromJson)  double quantity, @JsonKey(fromJson: _doubleFromJson)  double worth,  bool isFragile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoodsDetailsModel() when $default != null:
return $default(_that.goodsType,_that.description,_that.estimatedWeight,_that.quantity,_that.worth,_that.isFragile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String goodsType,  String description, @JsonKey(fromJson: _doubleFromJson)  double estimatedWeight, @JsonKey(fromJson: _doubleFromJson)  double quantity, @JsonKey(fromJson: _doubleFromJson)  double worth,  bool isFragile)  $default,) {final _that = this;
switch (_that) {
case _GoodsDetailsModel():
return $default(_that.goodsType,_that.description,_that.estimatedWeight,_that.quantity,_that.worth,_that.isFragile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String goodsType,  String description, @JsonKey(fromJson: _doubleFromJson)  double estimatedWeight, @JsonKey(fromJson: _doubleFromJson)  double quantity, @JsonKey(fromJson: _doubleFromJson)  double worth,  bool isFragile)?  $default,) {final _that = this;
switch (_that) {
case _GoodsDetailsModel() when $default != null:
return $default(_that.goodsType,_that.description,_that.estimatedWeight,_that.quantity,_that.worth,_that.isFragile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoodsDetailsModel implements GoodsDetailsModel {
  const _GoodsDetailsModel({required this.goodsType, required this.description, @JsonKey(fromJson: _doubleFromJson) required this.estimatedWeight, @JsonKey(fromJson: _doubleFromJson) required this.quantity, @JsonKey(fromJson: _doubleFromJson) required this.worth, required this.isFragile});
  factory _GoodsDetailsModel.fromJson(Map<String, dynamic> json) => _$GoodsDetailsModelFromJson(json);

@override final  String goodsType;
@override final  String description;
@override@JsonKey(fromJson: _doubleFromJson) final  double estimatedWeight;
@override@JsonKey(fromJson: _doubleFromJson) final  double quantity;
@override@JsonKey(fromJson: _doubleFromJson) final  double worth;
@override final  bool isFragile;

/// Create a copy of GoodsDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoodsDetailsModelCopyWith<_GoodsDetailsModel> get copyWith => __$GoodsDetailsModelCopyWithImpl<_GoodsDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoodsDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoodsDetailsModel&&(identical(other.goodsType, goodsType) || other.goodsType == goodsType)&&(identical(other.description, description) || other.description == description)&&(identical(other.estimatedWeight, estimatedWeight) || other.estimatedWeight == estimatedWeight)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.worth, worth) || other.worth == worth)&&(identical(other.isFragile, isFragile) || other.isFragile == isFragile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,goodsType,description,estimatedWeight,quantity,worth,isFragile);

@override
String toString() {
  return 'GoodsDetailsModel(goodsType: $goodsType, description: $description, estimatedWeight: $estimatedWeight, quantity: $quantity, worth: $worth, isFragile: $isFragile)';
}


}

/// @nodoc
abstract mixin class _$GoodsDetailsModelCopyWith<$Res> implements $GoodsDetailsModelCopyWith<$Res> {
  factory _$GoodsDetailsModelCopyWith(_GoodsDetailsModel value, $Res Function(_GoodsDetailsModel) _then) = __$GoodsDetailsModelCopyWithImpl;
@override @useResult
$Res call({
 String goodsType, String description,@JsonKey(fromJson: _doubleFromJson) double estimatedWeight,@JsonKey(fromJson: _doubleFromJson) double quantity,@JsonKey(fromJson: _doubleFromJson) double worth, bool isFragile
});




}
/// @nodoc
class __$GoodsDetailsModelCopyWithImpl<$Res>
    implements _$GoodsDetailsModelCopyWith<$Res> {
  __$GoodsDetailsModelCopyWithImpl(this._self, this._then);

  final _GoodsDetailsModel _self;
  final $Res Function(_GoodsDetailsModel) _then;

/// Create a copy of GoodsDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? goodsType = null,Object? description = null,Object? estimatedWeight = null,Object? quantity = null,Object? worth = null,Object? isFragile = null,}) {
  return _then(_GoodsDetailsModel(
goodsType: null == goodsType ? _self.goodsType : goodsType // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,estimatedWeight: null == estimatedWeight ? _self.estimatedWeight : estimatedWeight // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,worth: null == worth ? _self.worth : worth // ignore: cast_nullable_to_non_nullable
as double,isFragile: null == isFragile ? _self.isFragile : isFragile // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$StopModel {

 String get address; String get type; List<double> get coordinates; String get receiverName;@JsonKey(fromJson: _stringFromJson) String get receiverPhone; String get instructions; String get otp; bool get otpVerified;@JsonKey(name: '_id') String get id;
/// Create a copy of StopModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StopModelCopyWith<StopModel> get copyWith => _$StopModelCopyWithImpl<StopModel>(this as StopModel, _$identity);

  /// Serializes this StopModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StopModel&&(identical(other.address, address) || other.address == address)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.coordinates, coordinates)&&(identical(other.receiverName, receiverName) || other.receiverName == receiverName)&&(identical(other.receiverPhone, receiverPhone) || other.receiverPhone == receiverPhone)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.otpVerified, otpVerified) || other.otpVerified == otpVerified)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,type,const DeepCollectionEquality().hash(coordinates),receiverName,receiverPhone,instructions,otp,otpVerified,id);

@override
String toString() {
  return 'StopModel(address: $address, type: $type, coordinates: $coordinates, receiverName: $receiverName, receiverPhone: $receiverPhone, instructions: $instructions, otp: $otp, otpVerified: $otpVerified, id: $id)';
}


}

/// @nodoc
abstract mixin class $StopModelCopyWith<$Res>  {
  factory $StopModelCopyWith(StopModel value, $Res Function(StopModel) _then) = _$StopModelCopyWithImpl;
@useResult
$Res call({
 String address, String type, List<double> coordinates, String receiverName,@JsonKey(fromJson: _stringFromJson) String receiverPhone, String instructions, String otp, bool otpVerified,@JsonKey(name: '_id') String id
});




}
/// @nodoc
class _$StopModelCopyWithImpl<$Res>
    implements $StopModelCopyWith<$Res> {
  _$StopModelCopyWithImpl(this._self, this._then);

  final StopModel _self;
  final $Res Function(StopModel) _then;

/// Create a copy of StopModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? type = null,Object? coordinates = null,Object? receiverName = null,Object? receiverPhone = null,Object? instructions = null,Object? otp = null,Object? otpVerified = null,Object? id = null,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as List<double>,receiverName: null == receiverName ? _self.receiverName : receiverName // ignore: cast_nullable_to_non_nullable
as String,receiverPhone: null == receiverPhone ? _self.receiverPhone : receiverPhone // ignore: cast_nullable_to_non_nullable
as String,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,otpVerified: null == otpVerified ? _self.otpVerified : otpVerified // ignore: cast_nullable_to_non_nullable
as bool,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StopModel].
extension StopModelPatterns on StopModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StopModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StopModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StopModel value)  $default,){
final _that = this;
switch (_that) {
case _StopModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StopModel value)?  $default,){
final _that = this;
switch (_that) {
case _StopModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String address,  String type,  List<double> coordinates,  String receiverName, @JsonKey(fromJson: _stringFromJson)  String receiverPhone,  String instructions,  String otp,  bool otpVerified, @JsonKey(name: '_id')  String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StopModel() when $default != null:
return $default(_that.address,_that.type,_that.coordinates,_that.receiverName,_that.receiverPhone,_that.instructions,_that.otp,_that.otpVerified,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String address,  String type,  List<double> coordinates,  String receiverName, @JsonKey(fromJson: _stringFromJson)  String receiverPhone,  String instructions,  String otp,  bool otpVerified, @JsonKey(name: '_id')  String id)  $default,) {final _that = this;
switch (_that) {
case _StopModel():
return $default(_that.address,_that.type,_that.coordinates,_that.receiverName,_that.receiverPhone,_that.instructions,_that.otp,_that.otpVerified,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String address,  String type,  List<double> coordinates,  String receiverName, @JsonKey(fromJson: _stringFromJson)  String receiverPhone,  String instructions,  String otp,  bool otpVerified, @JsonKey(name: '_id')  String id)?  $default,) {final _that = this;
switch (_that) {
case _StopModel() when $default != null:
return $default(_that.address,_that.type,_that.coordinates,_that.receiverName,_that.receiverPhone,_that.instructions,_that.otp,_that.otpVerified,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StopModel implements StopModel {
  const _StopModel({required this.address, required this.type, required final  List<double> coordinates, required this.receiverName, @JsonKey(fromJson: _stringFromJson) required this.receiverPhone, required this.instructions, required this.otp, required this.otpVerified, @JsonKey(name: '_id') required this.id}): _coordinates = coordinates;
  factory _StopModel.fromJson(Map<String, dynamic> json) => _$StopModelFromJson(json);

@override final  String address;
@override final  String type;
 final  List<double> _coordinates;
@override List<double> get coordinates {
  if (_coordinates is EqualUnmodifiableListView) return _coordinates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_coordinates);
}

@override final  String receiverName;
@override@JsonKey(fromJson: _stringFromJson) final  String receiverPhone;
@override final  String instructions;
@override final  String otp;
@override final  bool otpVerified;
@override@JsonKey(name: '_id') final  String id;

/// Create a copy of StopModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StopModelCopyWith<_StopModel> get copyWith => __$StopModelCopyWithImpl<_StopModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StopModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StopModel&&(identical(other.address, address) || other.address == address)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._coordinates, _coordinates)&&(identical(other.receiverName, receiverName) || other.receiverName == receiverName)&&(identical(other.receiverPhone, receiverPhone) || other.receiverPhone == receiverPhone)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.otpVerified, otpVerified) || other.otpVerified == otpVerified)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,type,const DeepCollectionEquality().hash(_coordinates),receiverName,receiverPhone,instructions,otp,otpVerified,id);

@override
String toString() {
  return 'StopModel(address: $address, type: $type, coordinates: $coordinates, receiverName: $receiverName, receiverPhone: $receiverPhone, instructions: $instructions, otp: $otp, otpVerified: $otpVerified, id: $id)';
}


}

/// @nodoc
abstract mixin class _$StopModelCopyWith<$Res> implements $StopModelCopyWith<$Res> {
  factory _$StopModelCopyWith(_StopModel value, $Res Function(_StopModel) _then) = __$StopModelCopyWithImpl;
@override @useResult
$Res call({
 String address, String type, List<double> coordinates, String receiverName,@JsonKey(fromJson: _stringFromJson) String receiverPhone, String instructions, String otp, bool otpVerified,@JsonKey(name: '_id') String id
});




}
/// @nodoc
class __$StopModelCopyWithImpl<$Res>
    implements _$StopModelCopyWith<$Res> {
  __$StopModelCopyWithImpl(this._self, this._then);

  final _StopModel _self;
  final $Res Function(_StopModel) _then;

/// Create a copy of StopModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? type = null,Object? coordinates = null,Object? receiverName = null,Object? receiverPhone = null,Object? instructions = null,Object? otp = null,Object? otpVerified = null,Object? id = null,}) {
  return _then(_StopModel(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,coordinates: null == coordinates ? _self._coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as List<double>,receiverName: null == receiverName ? _self.receiverName : receiverName // ignore: cast_nullable_to_non_nullable
as String,receiverPhone: null == receiverPhone ? _self.receiverPhone : receiverPhone // ignore: cast_nullable_to_non_nullable
as String,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,otpVerified: null == otpVerified ? _self.otpVerified : otpVerified // ignore: cast_nullable_to_non_nullable
as bool,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ContactDetailsModel {

 String get name;@JsonKey(fromJson: _stringFromJson) String get phone; String get instructions;
/// Create a copy of ContactDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactDetailsModelCopyWith<ContactDetailsModel> get copyWith => _$ContactDetailsModelCopyWithImpl<ContactDetailsModel>(this as ContactDetailsModel, _$identity);

  /// Serializes this ContactDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactDetailsModel&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.instructions, instructions) || other.instructions == instructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,instructions);

@override
String toString() {
  return 'ContactDetailsModel(name: $name, phone: $phone, instructions: $instructions)';
}


}

/// @nodoc
abstract mixin class $ContactDetailsModelCopyWith<$Res>  {
  factory $ContactDetailsModelCopyWith(ContactDetailsModel value, $Res Function(ContactDetailsModel) _then) = _$ContactDetailsModelCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(fromJson: _stringFromJson) String phone, String instructions
});




}
/// @nodoc
class _$ContactDetailsModelCopyWithImpl<$Res>
    implements $ContactDetailsModelCopyWith<$Res> {
  _$ContactDetailsModelCopyWithImpl(this._self, this._then);

  final ContactDetailsModel _self;
  final $Res Function(ContactDetailsModel) _then;

/// Create a copy of ContactDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? phone = null,Object? instructions = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ContactDetailsModel].
extension ContactDetailsModelPatterns on ContactDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _ContactDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _ContactDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(fromJson: _stringFromJson)  String phone,  String instructions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactDetailsModel() when $default != null:
return $default(_that.name,_that.phone,_that.instructions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(fromJson: _stringFromJson)  String phone,  String instructions)  $default,) {final _that = this;
switch (_that) {
case _ContactDetailsModel():
return $default(_that.name,_that.phone,_that.instructions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(fromJson: _stringFromJson)  String phone,  String instructions)?  $default,) {final _that = this;
switch (_that) {
case _ContactDetailsModel() when $default != null:
return $default(_that.name,_that.phone,_that.instructions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContactDetailsModel implements ContactDetailsModel {
  const _ContactDetailsModel({required this.name, @JsonKey(fromJson: _stringFromJson) required this.phone, required this.instructions});
  factory _ContactDetailsModel.fromJson(Map<String, dynamic> json) => _$ContactDetailsModelFromJson(json);

@override final  String name;
@override@JsonKey(fromJson: _stringFromJson) final  String phone;
@override final  String instructions;

/// Create a copy of ContactDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactDetailsModelCopyWith<_ContactDetailsModel> get copyWith => __$ContactDetailsModelCopyWithImpl<_ContactDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContactDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactDetailsModel&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.instructions, instructions) || other.instructions == instructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,instructions);

@override
String toString() {
  return 'ContactDetailsModel(name: $name, phone: $phone, instructions: $instructions)';
}


}

/// @nodoc
abstract mixin class _$ContactDetailsModelCopyWith<$Res> implements $ContactDetailsModelCopyWith<$Res> {
  factory _$ContactDetailsModelCopyWith(_ContactDetailsModel value, $Res Function(_ContactDetailsModel) _then) = __$ContactDetailsModelCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(fromJson: _stringFromJson) String phone, String instructions
});




}
/// @nodoc
class __$ContactDetailsModelCopyWithImpl<$Res>
    implements _$ContactDetailsModelCopyWith<$Res> {
  __$ContactDetailsModelCopyWithImpl(this._self, this._then);

  final _ContactDetailsModel _self;
  final $Res Function(_ContactDetailsModel) _then;

/// Create a copy of ContactDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? phone = null,Object? instructions = null,}) {
  return _then(_ContactDetailsModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RideRequestModel {

 String get rideId; String get riderId; String get riderName;@JsonKey(fromJson: _stringFromJson) String get riderNumber; LatLngModel get pickup; LatLngModel get destination; String get rideType;@JsonKey(fromJson: _doubleFromJson) double get driverDistance;@JsonKey(fromJson: _intFromJson) int get timestamp;@JsonKey(fromJson: _intFromJson) int get timeout; LocationDetailsModel get startLocation; LocationDetailsModel get endLocation;@JsonKey(fromJson: _doubleFromJson) double get totalFare;@JsonKey(fromJson: _doubleFromJson) double get distance; bool get isScheduled; DateTime? get scheduledStartTime;@JsonKey(fromJson: _doubleFromJson) double get pendingDue; int? get rentalDurationHours; String get goodsType;@JsonKey(fromJson: _doubleFromJson) double get estimatedWeight; bool get isFragile;@JsonKey(fromJson: _intFromJson) int get stopsCount; String get senderName; String get receiverName; FareBreakdownModel get fareBreakdown; GoodsDetailsModel get goodsDetails; List<StopModel> get stops; ContactDetailsModel get senderDetails; ContactDetailsModel get receiverDetails;
/// Create a copy of RideRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RideRequestModelCopyWith<RideRequestModel> get copyWith => _$RideRequestModelCopyWithImpl<RideRequestModel>(this as RideRequestModel, _$identity);

  /// Serializes this RideRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RideRequestModel&&(identical(other.rideId, rideId) || other.rideId == rideId)&&(identical(other.riderId, riderId) || other.riderId == riderId)&&(identical(other.riderName, riderName) || other.riderName == riderName)&&(identical(other.riderNumber, riderNumber) || other.riderNumber == riderNumber)&&(identical(other.pickup, pickup) || other.pickup == pickup)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.rideType, rideType) || other.rideType == rideType)&&(identical(other.driverDistance, driverDistance) || other.driverDistance == driverDistance)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.timeout, timeout) || other.timeout == timeout)&&(identical(other.startLocation, startLocation) || other.startLocation == startLocation)&&(identical(other.endLocation, endLocation) || other.endLocation == endLocation)&&(identical(other.totalFare, totalFare) || other.totalFare == totalFare)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.isScheduled, isScheduled) || other.isScheduled == isScheduled)&&(identical(other.scheduledStartTime, scheduledStartTime) || other.scheduledStartTime == scheduledStartTime)&&(identical(other.pendingDue, pendingDue) || other.pendingDue == pendingDue)&&(identical(other.rentalDurationHours, rentalDurationHours) || other.rentalDurationHours == rentalDurationHours)&&(identical(other.goodsType, goodsType) || other.goodsType == goodsType)&&(identical(other.estimatedWeight, estimatedWeight) || other.estimatedWeight == estimatedWeight)&&(identical(other.isFragile, isFragile) || other.isFragile == isFragile)&&(identical(other.stopsCount, stopsCount) || other.stopsCount == stopsCount)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.receiverName, receiverName) || other.receiverName == receiverName)&&(identical(other.fareBreakdown, fareBreakdown) || other.fareBreakdown == fareBreakdown)&&(identical(other.goodsDetails, goodsDetails) || other.goodsDetails == goodsDetails)&&const DeepCollectionEquality().equals(other.stops, stops)&&(identical(other.senderDetails, senderDetails) || other.senderDetails == senderDetails)&&(identical(other.receiverDetails, receiverDetails) || other.receiverDetails == receiverDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,rideId,riderId,riderName,riderNumber,pickup,destination,rideType,driverDistance,timestamp,timeout,startLocation,endLocation,totalFare,distance,isScheduled,scheduledStartTime,pendingDue,rentalDurationHours,goodsType,estimatedWeight,isFragile,stopsCount,senderName,receiverName,fareBreakdown,goodsDetails,const DeepCollectionEquality().hash(stops),senderDetails,receiverDetails]);

@override
String toString() {
  return 'RideRequestModel(rideId: $rideId, riderId: $riderId, riderName: $riderName, riderNumber: $riderNumber, pickup: $pickup, destination: $destination, rideType: $rideType, driverDistance: $driverDistance, timestamp: $timestamp, timeout: $timeout, startLocation: $startLocation, endLocation: $endLocation, totalFare: $totalFare, distance: $distance, isScheduled: $isScheduled, scheduledStartTime: $scheduledStartTime, pendingDue: $pendingDue, rentalDurationHours: $rentalDurationHours, goodsType: $goodsType, estimatedWeight: $estimatedWeight, isFragile: $isFragile, stopsCount: $stopsCount, senderName: $senderName, receiverName: $receiverName, fareBreakdown: $fareBreakdown, goodsDetails: $goodsDetails, stops: $stops, senderDetails: $senderDetails, receiverDetails: $receiverDetails)';
}


}

/// @nodoc
abstract mixin class $RideRequestModelCopyWith<$Res>  {
  factory $RideRequestModelCopyWith(RideRequestModel value, $Res Function(RideRequestModel) _then) = _$RideRequestModelCopyWithImpl;
@useResult
$Res call({
 String rideId, String riderId, String riderName,@JsonKey(fromJson: _stringFromJson) String riderNumber, LatLngModel pickup, LatLngModel destination, String rideType,@JsonKey(fromJson: _doubleFromJson) double driverDistance,@JsonKey(fromJson: _intFromJson) int timestamp,@JsonKey(fromJson: _intFromJson) int timeout, LocationDetailsModel startLocation, LocationDetailsModel endLocation,@JsonKey(fromJson: _doubleFromJson) double totalFare,@JsonKey(fromJson: _doubleFromJson) double distance, bool isScheduled, DateTime? scheduledStartTime,@JsonKey(fromJson: _doubleFromJson) double pendingDue, int? rentalDurationHours, String goodsType,@JsonKey(fromJson: _doubleFromJson) double estimatedWeight, bool isFragile,@JsonKey(fromJson: _intFromJson) int stopsCount, String senderName, String receiverName, FareBreakdownModel fareBreakdown, GoodsDetailsModel goodsDetails, List<StopModel> stops, ContactDetailsModel senderDetails, ContactDetailsModel receiverDetails
});


$LatLngModelCopyWith<$Res> get pickup;$LatLngModelCopyWith<$Res> get destination;$LocationDetailsModelCopyWith<$Res> get startLocation;$LocationDetailsModelCopyWith<$Res> get endLocation;$FareBreakdownModelCopyWith<$Res> get fareBreakdown;$GoodsDetailsModelCopyWith<$Res> get goodsDetails;$ContactDetailsModelCopyWith<$Res> get senderDetails;$ContactDetailsModelCopyWith<$Res> get receiverDetails;

}
/// @nodoc
class _$RideRequestModelCopyWithImpl<$Res>
    implements $RideRequestModelCopyWith<$Res> {
  _$RideRequestModelCopyWithImpl(this._self, this._then);

  final RideRequestModel _self;
  final $Res Function(RideRequestModel) _then;

/// Create a copy of RideRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rideId = null,Object? riderId = null,Object? riderName = null,Object? riderNumber = null,Object? pickup = null,Object? destination = null,Object? rideType = null,Object? driverDistance = null,Object? timestamp = null,Object? timeout = null,Object? startLocation = null,Object? endLocation = null,Object? totalFare = null,Object? distance = null,Object? isScheduled = null,Object? scheduledStartTime = freezed,Object? pendingDue = null,Object? rentalDurationHours = freezed,Object? goodsType = null,Object? estimatedWeight = null,Object? isFragile = null,Object? stopsCount = null,Object? senderName = null,Object? receiverName = null,Object? fareBreakdown = null,Object? goodsDetails = null,Object? stops = null,Object? senderDetails = null,Object? receiverDetails = null,}) {
  return _then(_self.copyWith(
rideId: null == rideId ? _self.rideId : rideId // ignore: cast_nullable_to_non_nullable
as String,riderId: null == riderId ? _self.riderId : riderId // ignore: cast_nullable_to_non_nullable
as String,riderName: null == riderName ? _self.riderName : riderName // ignore: cast_nullable_to_non_nullable
as String,riderNumber: null == riderNumber ? _self.riderNumber : riderNumber // ignore: cast_nullable_to_non_nullable
as String,pickup: null == pickup ? _self.pickup : pickup // ignore: cast_nullable_to_non_nullable
as LatLngModel,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as LatLngModel,rideType: null == rideType ? _self.rideType : rideType // ignore: cast_nullable_to_non_nullable
as String,driverDistance: null == driverDistance ? _self.driverDistance : driverDistance // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,timeout: null == timeout ? _self.timeout : timeout // ignore: cast_nullable_to_non_nullable
as int,startLocation: null == startLocation ? _self.startLocation : startLocation // ignore: cast_nullable_to_non_nullable
as LocationDetailsModel,endLocation: null == endLocation ? _self.endLocation : endLocation // ignore: cast_nullable_to_non_nullable
as LocationDetailsModel,totalFare: null == totalFare ? _self.totalFare : totalFare // ignore: cast_nullable_to_non_nullable
as double,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,isScheduled: null == isScheduled ? _self.isScheduled : isScheduled // ignore: cast_nullable_to_non_nullable
as bool,scheduledStartTime: freezed == scheduledStartTime ? _self.scheduledStartTime : scheduledStartTime // ignore: cast_nullable_to_non_nullable
as DateTime?,pendingDue: null == pendingDue ? _self.pendingDue : pendingDue // ignore: cast_nullable_to_non_nullable
as double,rentalDurationHours: freezed == rentalDurationHours ? _self.rentalDurationHours : rentalDurationHours // ignore: cast_nullable_to_non_nullable
as int?,goodsType: null == goodsType ? _self.goodsType : goodsType // ignore: cast_nullable_to_non_nullable
as String,estimatedWeight: null == estimatedWeight ? _self.estimatedWeight : estimatedWeight // ignore: cast_nullable_to_non_nullable
as double,isFragile: null == isFragile ? _self.isFragile : isFragile // ignore: cast_nullable_to_non_nullable
as bool,stopsCount: null == stopsCount ? _self.stopsCount : stopsCount // ignore: cast_nullable_to_non_nullable
as int,senderName: null == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String,receiverName: null == receiverName ? _self.receiverName : receiverName // ignore: cast_nullable_to_non_nullable
as String,fareBreakdown: null == fareBreakdown ? _self.fareBreakdown : fareBreakdown // ignore: cast_nullable_to_non_nullable
as FareBreakdownModel,goodsDetails: null == goodsDetails ? _self.goodsDetails : goodsDetails // ignore: cast_nullable_to_non_nullable
as GoodsDetailsModel,stops: null == stops ? _self.stops : stops // ignore: cast_nullable_to_non_nullable
as List<StopModel>,senderDetails: null == senderDetails ? _self.senderDetails : senderDetails // ignore: cast_nullable_to_non_nullable
as ContactDetailsModel,receiverDetails: null == receiverDetails ? _self.receiverDetails : receiverDetails // ignore: cast_nullable_to_non_nullable
as ContactDetailsModel,
  ));
}
/// Create a copy of RideRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LatLngModelCopyWith<$Res> get pickup {
  
  return $LatLngModelCopyWith<$Res>(_self.pickup, (value) {
    return _then(_self.copyWith(pickup: value));
  });
}/// Create a copy of RideRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LatLngModelCopyWith<$Res> get destination {
  
  return $LatLngModelCopyWith<$Res>(_self.destination, (value) {
    return _then(_self.copyWith(destination: value));
  });
}/// Create a copy of RideRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationDetailsModelCopyWith<$Res> get startLocation {
  
  return $LocationDetailsModelCopyWith<$Res>(_self.startLocation, (value) {
    return _then(_self.copyWith(startLocation: value));
  });
}/// Create a copy of RideRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationDetailsModelCopyWith<$Res> get endLocation {
  
  return $LocationDetailsModelCopyWith<$Res>(_self.endLocation, (value) {
    return _then(_self.copyWith(endLocation: value));
  });
}/// Create a copy of RideRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FareBreakdownModelCopyWith<$Res> get fareBreakdown {
  
  return $FareBreakdownModelCopyWith<$Res>(_self.fareBreakdown, (value) {
    return _then(_self.copyWith(fareBreakdown: value));
  });
}/// Create a copy of RideRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoodsDetailsModelCopyWith<$Res> get goodsDetails {
  
  return $GoodsDetailsModelCopyWith<$Res>(_self.goodsDetails, (value) {
    return _then(_self.copyWith(goodsDetails: value));
  });
}/// Create a copy of RideRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactDetailsModelCopyWith<$Res> get senderDetails {
  
  return $ContactDetailsModelCopyWith<$Res>(_self.senderDetails, (value) {
    return _then(_self.copyWith(senderDetails: value));
  });
}/// Create a copy of RideRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactDetailsModelCopyWith<$Res> get receiverDetails {
  
  return $ContactDetailsModelCopyWith<$Res>(_self.receiverDetails, (value) {
    return _then(_self.copyWith(receiverDetails: value));
  });
}
}


/// Adds pattern-matching-related methods to [RideRequestModel].
extension RideRequestModelPatterns on RideRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RideRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RideRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RideRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _RideRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RideRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _RideRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String rideId,  String riderId,  String riderName, @JsonKey(fromJson: _stringFromJson)  String riderNumber,  LatLngModel pickup,  LatLngModel destination,  String rideType, @JsonKey(fromJson: _doubleFromJson)  double driverDistance, @JsonKey(fromJson: _intFromJson)  int timestamp, @JsonKey(fromJson: _intFromJson)  int timeout,  LocationDetailsModel startLocation,  LocationDetailsModel endLocation, @JsonKey(fromJson: _doubleFromJson)  double totalFare, @JsonKey(fromJson: _doubleFromJson)  double distance,  bool isScheduled,  DateTime? scheduledStartTime, @JsonKey(fromJson: _doubleFromJson)  double pendingDue,  int? rentalDurationHours,  String goodsType, @JsonKey(fromJson: _doubleFromJson)  double estimatedWeight,  bool isFragile, @JsonKey(fromJson: _intFromJson)  int stopsCount,  String senderName,  String receiverName,  FareBreakdownModel fareBreakdown,  GoodsDetailsModel goodsDetails,  List<StopModel> stops,  ContactDetailsModel senderDetails,  ContactDetailsModel receiverDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RideRequestModel() when $default != null:
return $default(_that.rideId,_that.riderId,_that.riderName,_that.riderNumber,_that.pickup,_that.destination,_that.rideType,_that.driverDistance,_that.timestamp,_that.timeout,_that.startLocation,_that.endLocation,_that.totalFare,_that.distance,_that.isScheduled,_that.scheduledStartTime,_that.pendingDue,_that.rentalDurationHours,_that.goodsType,_that.estimatedWeight,_that.isFragile,_that.stopsCount,_that.senderName,_that.receiverName,_that.fareBreakdown,_that.goodsDetails,_that.stops,_that.senderDetails,_that.receiverDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String rideId,  String riderId,  String riderName, @JsonKey(fromJson: _stringFromJson)  String riderNumber,  LatLngModel pickup,  LatLngModel destination,  String rideType, @JsonKey(fromJson: _doubleFromJson)  double driverDistance, @JsonKey(fromJson: _intFromJson)  int timestamp, @JsonKey(fromJson: _intFromJson)  int timeout,  LocationDetailsModel startLocation,  LocationDetailsModel endLocation, @JsonKey(fromJson: _doubleFromJson)  double totalFare, @JsonKey(fromJson: _doubleFromJson)  double distance,  bool isScheduled,  DateTime? scheduledStartTime, @JsonKey(fromJson: _doubleFromJson)  double pendingDue,  int? rentalDurationHours,  String goodsType, @JsonKey(fromJson: _doubleFromJson)  double estimatedWeight,  bool isFragile, @JsonKey(fromJson: _intFromJson)  int stopsCount,  String senderName,  String receiverName,  FareBreakdownModel fareBreakdown,  GoodsDetailsModel goodsDetails,  List<StopModel> stops,  ContactDetailsModel senderDetails,  ContactDetailsModel receiverDetails)  $default,) {final _that = this;
switch (_that) {
case _RideRequestModel():
return $default(_that.rideId,_that.riderId,_that.riderName,_that.riderNumber,_that.pickup,_that.destination,_that.rideType,_that.driverDistance,_that.timestamp,_that.timeout,_that.startLocation,_that.endLocation,_that.totalFare,_that.distance,_that.isScheduled,_that.scheduledStartTime,_that.pendingDue,_that.rentalDurationHours,_that.goodsType,_that.estimatedWeight,_that.isFragile,_that.stopsCount,_that.senderName,_that.receiverName,_that.fareBreakdown,_that.goodsDetails,_that.stops,_that.senderDetails,_that.receiverDetails);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String rideId,  String riderId,  String riderName, @JsonKey(fromJson: _stringFromJson)  String riderNumber,  LatLngModel pickup,  LatLngModel destination,  String rideType, @JsonKey(fromJson: _doubleFromJson)  double driverDistance, @JsonKey(fromJson: _intFromJson)  int timestamp, @JsonKey(fromJson: _intFromJson)  int timeout,  LocationDetailsModel startLocation,  LocationDetailsModel endLocation, @JsonKey(fromJson: _doubleFromJson)  double totalFare, @JsonKey(fromJson: _doubleFromJson)  double distance,  bool isScheduled,  DateTime? scheduledStartTime, @JsonKey(fromJson: _doubleFromJson)  double pendingDue,  int? rentalDurationHours,  String goodsType, @JsonKey(fromJson: _doubleFromJson)  double estimatedWeight,  bool isFragile, @JsonKey(fromJson: _intFromJson)  int stopsCount,  String senderName,  String receiverName,  FareBreakdownModel fareBreakdown,  GoodsDetailsModel goodsDetails,  List<StopModel> stops,  ContactDetailsModel senderDetails,  ContactDetailsModel receiverDetails)?  $default,) {final _that = this;
switch (_that) {
case _RideRequestModel() when $default != null:
return $default(_that.rideId,_that.riderId,_that.riderName,_that.riderNumber,_that.pickup,_that.destination,_that.rideType,_that.driverDistance,_that.timestamp,_that.timeout,_that.startLocation,_that.endLocation,_that.totalFare,_that.distance,_that.isScheduled,_that.scheduledStartTime,_that.pendingDue,_that.rentalDurationHours,_that.goodsType,_that.estimatedWeight,_that.isFragile,_that.stopsCount,_that.senderName,_that.receiverName,_that.fareBreakdown,_that.goodsDetails,_that.stops,_that.senderDetails,_that.receiverDetails);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RideRequestModel implements RideRequestModel {
  const _RideRequestModel({required this.rideId, required this.riderId, required this.riderName, @JsonKey(fromJson: _stringFromJson) required this.riderNumber, required this.pickup, required this.destination, required this.rideType, @JsonKey(fromJson: _doubleFromJson) required this.driverDistance, @JsonKey(fromJson: _intFromJson) required this.timestamp, @JsonKey(fromJson: _intFromJson) required this.timeout, required this.startLocation, required this.endLocation, @JsonKey(fromJson: _doubleFromJson) required this.totalFare, @JsonKey(fromJson: _doubleFromJson) required this.distance, required this.isScheduled, this.scheduledStartTime, @JsonKey(fromJson: _doubleFromJson) required this.pendingDue, this.rentalDurationHours, required this.goodsType, @JsonKey(fromJson: _doubleFromJson) required this.estimatedWeight, required this.isFragile, @JsonKey(fromJson: _intFromJson) required this.stopsCount, required this.senderName, required this.receiverName, required this.fareBreakdown, required this.goodsDetails, required final  List<StopModel> stops, required this.senderDetails, required this.receiverDetails}): _stops = stops;
  factory _RideRequestModel.fromJson(Map<String, dynamic> json) => _$RideRequestModelFromJson(json);

@override final  String rideId;
@override final  String riderId;
@override final  String riderName;
@override@JsonKey(fromJson: _stringFromJson) final  String riderNumber;
@override final  LatLngModel pickup;
@override final  LatLngModel destination;
@override final  String rideType;
@override@JsonKey(fromJson: _doubleFromJson) final  double driverDistance;
@override@JsonKey(fromJson: _intFromJson) final  int timestamp;
@override@JsonKey(fromJson: _intFromJson) final  int timeout;
@override final  LocationDetailsModel startLocation;
@override final  LocationDetailsModel endLocation;
@override@JsonKey(fromJson: _doubleFromJson) final  double totalFare;
@override@JsonKey(fromJson: _doubleFromJson) final  double distance;
@override final  bool isScheduled;
@override final  DateTime? scheduledStartTime;
@override@JsonKey(fromJson: _doubleFromJson) final  double pendingDue;
@override final  int? rentalDurationHours;
@override final  String goodsType;
@override@JsonKey(fromJson: _doubleFromJson) final  double estimatedWeight;
@override final  bool isFragile;
@override@JsonKey(fromJson: _intFromJson) final  int stopsCount;
@override final  String senderName;
@override final  String receiverName;
@override final  FareBreakdownModel fareBreakdown;
@override final  GoodsDetailsModel goodsDetails;
 final  List<StopModel> _stops;
@override List<StopModel> get stops {
  if (_stops is EqualUnmodifiableListView) return _stops;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stops);
}

@override final  ContactDetailsModel senderDetails;
@override final  ContactDetailsModel receiverDetails;

/// Create a copy of RideRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RideRequestModelCopyWith<_RideRequestModel> get copyWith => __$RideRequestModelCopyWithImpl<_RideRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RideRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RideRequestModel&&(identical(other.rideId, rideId) || other.rideId == rideId)&&(identical(other.riderId, riderId) || other.riderId == riderId)&&(identical(other.riderName, riderName) || other.riderName == riderName)&&(identical(other.riderNumber, riderNumber) || other.riderNumber == riderNumber)&&(identical(other.pickup, pickup) || other.pickup == pickup)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.rideType, rideType) || other.rideType == rideType)&&(identical(other.driverDistance, driverDistance) || other.driverDistance == driverDistance)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.timeout, timeout) || other.timeout == timeout)&&(identical(other.startLocation, startLocation) || other.startLocation == startLocation)&&(identical(other.endLocation, endLocation) || other.endLocation == endLocation)&&(identical(other.totalFare, totalFare) || other.totalFare == totalFare)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.isScheduled, isScheduled) || other.isScheduled == isScheduled)&&(identical(other.scheduledStartTime, scheduledStartTime) || other.scheduledStartTime == scheduledStartTime)&&(identical(other.pendingDue, pendingDue) || other.pendingDue == pendingDue)&&(identical(other.rentalDurationHours, rentalDurationHours) || other.rentalDurationHours == rentalDurationHours)&&(identical(other.goodsType, goodsType) || other.goodsType == goodsType)&&(identical(other.estimatedWeight, estimatedWeight) || other.estimatedWeight == estimatedWeight)&&(identical(other.isFragile, isFragile) || other.isFragile == isFragile)&&(identical(other.stopsCount, stopsCount) || other.stopsCount == stopsCount)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.receiverName, receiverName) || other.receiverName == receiverName)&&(identical(other.fareBreakdown, fareBreakdown) || other.fareBreakdown == fareBreakdown)&&(identical(other.goodsDetails, goodsDetails) || other.goodsDetails == goodsDetails)&&const DeepCollectionEquality().equals(other._stops, _stops)&&(identical(other.senderDetails, senderDetails) || other.senderDetails == senderDetails)&&(identical(other.receiverDetails, receiverDetails) || other.receiverDetails == receiverDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,rideId,riderId,riderName,riderNumber,pickup,destination,rideType,driverDistance,timestamp,timeout,startLocation,endLocation,totalFare,distance,isScheduled,scheduledStartTime,pendingDue,rentalDurationHours,goodsType,estimatedWeight,isFragile,stopsCount,senderName,receiverName,fareBreakdown,goodsDetails,const DeepCollectionEquality().hash(_stops),senderDetails,receiverDetails]);

@override
String toString() {
  return 'RideRequestModel(rideId: $rideId, riderId: $riderId, riderName: $riderName, riderNumber: $riderNumber, pickup: $pickup, destination: $destination, rideType: $rideType, driverDistance: $driverDistance, timestamp: $timestamp, timeout: $timeout, startLocation: $startLocation, endLocation: $endLocation, totalFare: $totalFare, distance: $distance, isScheduled: $isScheduled, scheduledStartTime: $scheduledStartTime, pendingDue: $pendingDue, rentalDurationHours: $rentalDurationHours, goodsType: $goodsType, estimatedWeight: $estimatedWeight, isFragile: $isFragile, stopsCount: $stopsCount, senderName: $senderName, receiverName: $receiverName, fareBreakdown: $fareBreakdown, goodsDetails: $goodsDetails, stops: $stops, senderDetails: $senderDetails, receiverDetails: $receiverDetails)';
}


}

/// @nodoc
abstract mixin class _$RideRequestModelCopyWith<$Res> implements $RideRequestModelCopyWith<$Res> {
  factory _$RideRequestModelCopyWith(_RideRequestModel value, $Res Function(_RideRequestModel) _then) = __$RideRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String rideId, String riderId, String riderName,@JsonKey(fromJson: _stringFromJson) String riderNumber, LatLngModel pickup, LatLngModel destination, String rideType,@JsonKey(fromJson: _doubleFromJson) double driverDistance,@JsonKey(fromJson: _intFromJson) int timestamp,@JsonKey(fromJson: _intFromJson) int timeout, LocationDetailsModel startLocation, LocationDetailsModel endLocation,@JsonKey(fromJson: _doubleFromJson) double totalFare,@JsonKey(fromJson: _doubleFromJson) double distance, bool isScheduled, DateTime? scheduledStartTime,@JsonKey(fromJson: _doubleFromJson) double pendingDue, int? rentalDurationHours, String goodsType,@JsonKey(fromJson: _doubleFromJson) double estimatedWeight, bool isFragile,@JsonKey(fromJson: _intFromJson) int stopsCount, String senderName, String receiverName, FareBreakdownModel fareBreakdown, GoodsDetailsModel goodsDetails, List<StopModel> stops, ContactDetailsModel senderDetails, ContactDetailsModel receiverDetails
});


@override $LatLngModelCopyWith<$Res> get pickup;@override $LatLngModelCopyWith<$Res> get destination;@override $LocationDetailsModelCopyWith<$Res> get startLocation;@override $LocationDetailsModelCopyWith<$Res> get endLocation;@override $FareBreakdownModelCopyWith<$Res> get fareBreakdown;@override $GoodsDetailsModelCopyWith<$Res> get goodsDetails;@override $ContactDetailsModelCopyWith<$Res> get senderDetails;@override $ContactDetailsModelCopyWith<$Res> get receiverDetails;

}
/// @nodoc
class __$RideRequestModelCopyWithImpl<$Res>
    implements _$RideRequestModelCopyWith<$Res> {
  __$RideRequestModelCopyWithImpl(this._self, this._then);

  final _RideRequestModel _self;
  final $Res Function(_RideRequestModel) _then;

/// Create a copy of RideRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rideId = null,Object? riderId = null,Object? riderName = null,Object? riderNumber = null,Object? pickup = null,Object? destination = null,Object? rideType = null,Object? driverDistance = null,Object? timestamp = null,Object? timeout = null,Object? startLocation = null,Object? endLocation = null,Object? totalFare = null,Object? distance = null,Object? isScheduled = null,Object? scheduledStartTime = freezed,Object? pendingDue = null,Object? rentalDurationHours = freezed,Object? goodsType = null,Object? estimatedWeight = null,Object? isFragile = null,Object? stopsCount = null,Object? senderName = null,Object? receiverName = null,Object? fareBreakdown = null,Object? goodsDetails = null,Object? stops = null,Object? senderDetails = null,Object? receiverDetails = null,}) {
  return _then(_RideRequestModel(
rideId: null == rideId ? _self.rideId : rideId // ignore: cast_nullable_to_non_nullable
as String,riderId: null == riderId ? _self.riderId : riderId // ignore: cast_nullable_to_non_nullable
as String,riderName: null == riderName ? _self.riderName : riderName // ignore: cast_nullable_to_non_nullable
as String,riderNumber: null == riderNumber ? _self.riderNumber : riderNumber // ignore: cast_nullable_to_non_nullable
as String,pickup: null == pickup ? _self.pickup : pickup // ignore: cast_nullable_to_non_nullable
as LatLngModel,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as LatLngModel,rideType: null == rideType ? _self.rideType : rideType // ignore: cast_nullable_to_non_nullable
as String,driverDistance: null == driverDistance ? _self.driverDistance : driverDistance // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,timeout: null == timeout ? _self.timeout : timeout // ignore: cast_nullable_to_non_nullable
as int,startLocation: null == startLocation ? _self.startLocation : startLocation // ignore: cast_nullable_to_non_nullable
as LocationDetailsModel,endLocation: null == endLocation ? _self.endLocation : endLocation // ignore: cast_nullable_to_non_nullable
as LocationDetailsModel,totalFare: null == totalFare ? _self.totalFare : totalFare // ignore: cast_nullable_to_non_nullable
as double,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,isScheduled: null == isScheduled ? _self.isScheduled : isScheduled // ignore: cast_nullable_to_non_nullable
as bool,scheduledStartTime: freezed == scheduledStartTime ? _self.scheduledStartTime : scheduledStartTime // ignore: cast_nullable_to_non_nullable
as DateTime?,pendingDue: null == pendingDue ? _self.pendingDue : pendingDue // ignore: cast_nullable_to_non_nullable
as double,rentalDurationHours: freezed == rentalDurationHours ? _self.rentalDurationHours : rentalDurationHours // ignore: cast_nullable_to_non_nullable
as int?,goodsType: null == goodsType ? _self.goodsType : goodsType // ignore: cast_nullable_to_non_nullable
as String,estimatedWeight: null == estimatedWeight ? _self.estimatedWeight : estimatedWeight // ignore: cast_nullable_to_non_nullable
as double,isFragile: null == isFragile ? _self.isFragile : isFragile // ignore: cast_nullable_to_non_nullable
as bool,stopsCount: null == stopsCount ? _self.stopsCount : stopsCount // ignore: cast_nullable_to_non_nullable
as int,senderName: null == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String,receiverName: null == receiverName ? _self.receiverName : receiverName // ignore: cast_nullable_to_non_nullable
as String,fareBreakdown: null == fareBreakdown ? _self.fareBreakdown : fareBreakdown // ignore: cast_nullable_to_non_nullable
as FareBreakdownModel,goodsDetails: null == goodsDetails ? _self.goodsDetails : goodsDetails // ignore: cast_nullable_to_non_nullable
as GoodsDetailsModel,stops: null == stops ? _self._stops : stops // ignore: cast_nullable_to_non_nullable
as List<StopModel>,senderDetails: null == senderDetails ? _self.senderDetails : senderDetails // ignore: cast_nullable_to_non_nullable
as ContactDetailsModel,receiverDetails: null == receiverDetails ? _self.receiverDetails : receiverDetails // ignore: cast_nullable_to_non_nullable
as ContactDetailsModel,
  ));
}

/// Create a copy of RideRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LatLngModelCopyWith<$Res> get pickup {
  
  return $LatLngModelCopyWith<$Res>(_self.pickup, (value) {
    return _then(_self.copyWith(pickup: value));
  });
}/// Create a copy of RideRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LatLngModelCopyWith<$Res> get destination {
  
  return $LatLngModelCopyWith<$Res>(_self.destination, (value) {
    return _then(_self.copyWith(destination: value));
  });
}/// Create a copy of RideRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationDetailsModelCopyWith<$Res> get startLocation {
  
  return $LocationDetailsModelCopyWith<$Res>(_self.startLocation, (value) {
    return _then(_self.copyWith(startLocation: value));
  });
}/// Create a copy of RideRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationDetailsModelCopyWith<$Res> get endLocation {
  
  return $LocationDetailsModelCopyWith<$Res>(_self.endLocation, (value) {
    return _then(_self.copyWith(endLocation: value));
  });
}/// Create a copy of RideRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FareBreakdownModelCopyWith<$Res> get fareBreakdown {
  
  return $FareBreakdownModelCopyWith<$Res>(_self.fareBreakdown, (value) {
    return _then(_self.copyWith(fareBreakdown: value));
  });
}/// Create a copy of RideRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoodsDetailsModelCopyWith<$Res> get goodsDetails {
  
  return $GoodsDetailsModelCopyWith<$Res>(_self.goodsDetails, (value) {
    return _then(_self.copyWith(goodsDetails: value));
  });
}/// Create a copy of RideRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactDetailsModelCopyWith<$Res> get senderDetails {
  
  return $ContactDetailsModelCopyWith<$Res>(_self.senderDetails, (value) {
    return _then(_self.copyWith(senderDetails: value));
  });
}/// Create a copy of RideRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactDetailsModelCopyWith<$Res> get receiverDetails {
  
  return $ContactDetailsModelCopyWith<$Res>(_self.receiverDetails, (value) {
    return _then(_self.copyWith(receiverDetails: value));
  });
}
}

// dart format on
