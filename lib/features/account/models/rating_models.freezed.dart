// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewRatingResponse {

 bool? get success; String? get message; List<ReviewRating>? get data;
/// Create a copy of ReviewRatingResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewRatingResponseCopyWith<ReviewRatingResponse> get copyWith => _$ReviewRatingResponseCopyWithImpl<ReviewRatingResponse>(this as ReviewRatingResponse, _$identity);

  /// Serializes this ReviewRatingResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewRatingResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ReviewRatingResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $ReviewRatingResponseCopyWith<$Res>  {
  factory $ReviewRatingResponseCopyWith(ReviewRatingResponse value, $Res Function(ReviewRatingResponse) _then) = _$ReviewRatingResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, List<ReviewRating>? data
});




}
/// @nodoc
class _$ReviewRatingResponseCopyWithImpl<$Res>
    implements $ReviewRatingResponseCopyWith<$Res> {
  _$ReviewRatingResponseCopyWithImpl(this._self, this._then);

  final ReviewRatingResponse _self;
  final $Res Function(ReviewRatingResponse) _then;

/// Create a copy of ReviewRatingResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<ReviewRating>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReviewRatingResponse].
extension ReviewRatingResponsePatterns on ReviewRatingResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewRatingResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewRatingResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewRatingResponse value)  $default,){
final _that = this;
switch (_that) {
case _ReviewRatingResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewRatingResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewRatingResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<ReviewRating>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewRatingResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<ReviewRating>? data)  $default,) {final _that = this;
switch (_that) {
case _ReviewRatingResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  List<ReviewRating>? data)?  $default,) {final _that = this;
switch (_that) {
case _ReviewRatingResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReviewRatingResponse implements ReviewRatingResponse {
  const _ReviewRatingResponse({this.success, this.message, final  List<ReviewRating>? data}): _data = data;
  factory _ReviewRatingResponse.fromJson(Map<String, dynamic> json) => _$ReviewRatingResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
 final  List<ReviewRating>? _data;
@override List<ReviewRating>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ReviewRatingResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewRatingResponseCopyWith<_ReviewRatingResponse> get copyWith => __$ReviewRatingResponseCopyWithImpl<_ReviewRatingResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewRatingResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewRatingResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'ReviewRatingResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ReviewRatingResponseCopyWith<$Res> implements $ReviewRatingResponseCopyWith<$Res> {
  factory _$ReviewRatingResponseCopyWith(_ReviewRatingResponse value, $Res Function(_ReviewRatingResponse) _then) = __$ReviewRatingResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, List<ReviewRating>? data
});




}
/// @nodoc
class __$ReviewRatingResponseCopyWithImpl<$Res>
    implements _$ReviewRatingResponseCopyWith<$Res> {
  __$ReviewRatingResponseCopyWithImpl(this._self, this._then);

  final _ReviewRatingResponse _self;
  final $Res Function(_ReviewRatingResponse) _then;

/// Create a copy of ReviewRatingResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_ReviewRatingResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<ReviewRating>?,
  ));
}


}


/// @nodoc
mixin _$ReviewRating {

@JsonKey(name: '_id') String? get id; String? get orderId;@JsonKey(name: 'userId') ReviewUser? get user; String? get driverId;@JsonKey(name: 'expreienceType') String? get experienceType;@JsonKey(name: 'exprerienceDescription') String? get experienceDescription; int? get rating;
/// Create a copy of ReviewRating
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewRatingCopyWith<ReviewRating> get copyWith => _$ReviewRatingCopyWithImpl<ReviewRating>(this as ReviewRating, _$identity);

  /// Serializes this ReviewRating to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewRating&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.user, user) || other.user == user)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.experienceType, experienceType) || other.experienceType == experienceType)&&(identical(other.experienceDescription, experienceDescription) || other.experienceDescription == experienceDescription)&&(identical(other.rating, rating) || other.rating == rating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,user,driverId,experienceType,experienceDescription,rating);

@override
String toString() {
  return 'ReviewRating(id: $id, orderId: $orderId, user: $user, driverId: $driverId, experienceType: $experienceType, experienceDescription: $experienceDescription, rating: $rating)';
}


}

/// @nodoc
abstract mixin class $ReviewRatingCopyWith<$Res>  {
  factory $ReviewRatingCopyWith(ReviewRating value, $Res Function(ReviewRating) _then) = _$ReviewRatingCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? orderId,@JsonKey(name: 'userId') ReviewUser? user, String? driverId,@JsonKey(name: 'expreienceType') String? experienceType,@JsonKey(name: 'exprerienceDescription') String? experienceDescription, int? rating
});


$ReviewUserCopyWith<$Res>? get user;

}
/// @nodoc
class _$ReviewRatingCopyWithImpl<$Res>
    implements $ReviewRatingCopyWith<$Res> {
  _$ReviewRatingCopyWithImpl(this._self, this._then);

  final ReviewRating _self;
  final $Res Function(ReviewRating) _then;

/// Create a copy of ReviewRating
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? orderId = freezed,Object? user = freezed,Object? driverId = freezed,Object? experienceType = freezed,Object? experienceDescription = freezed,Object? rating = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ReviewUser?,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,experienceType: freezed == experienceType ? _self.experienceType : experienceType // ignore: cast_nullable_to_non_nullable
as String?,experienceDescription: freezed == experienceDescription ? _self.experienceDescription : experienceDescription // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of ReviewRating
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $ReviewUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReviewRating].
extension ReviewRatingPatterns on ReviewRating {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewRating value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewRating() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewRating value)  $default,){
final _that = this;
switch (_that) {
case _ReviewRating():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewRating value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewRating() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? orderId, @JsonKey(name: 'userId')  ReviewUser? user,  String? driverId, @JsonKey(name: 'expreienceType')  String? experienceType, @JsonKey(name: 'exprerienceDescription')  String? experienceDescription,  int? rating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewRating() when $default != null:
return $default(_that.id,_that.orderId,_that.user,_that.driverId,_that.experienceType,_that.experienceDescription,_that.rating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? orderId, @JsonKey(name: 'userId')  ReviewUser? user,  String? driverId, @JsonKey(name: 'expreienceType')  String? experienceType, @JsonKey(name: 'exprerienceDescription')  String? experienceDescription,  int? rating)  $default,) {final _that = this;
switch (_that) {
case _ReviewRating():
return $default(_that.id,_that.orderId,_that.user,_that.driverId,_that.experienceType,_that.experienceDescription,_that.rating);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? orderId, @JsonKey(name: 'userId')  ReviewUser? user,  String? driverId, @JsonKey(name: 'expreienceType')  String? experienceType, @JsonKey(name: 'exprerienceDescription')  String? experienceDescription,  int? rating)?  $default,) {final _that = this;
switch (_that) {
case _ReviewRating() when $default != null:
return $default(_that.id,_that.orderId,_that.user,_that.driverId,_that.experienceType,_that.experienceDescription,_that.rating);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReviewRating implements ReviewRating {
  const _ReviewRating({@JsonKey(name: '_id') this.id, this.orderId, @JsonKey(name: 'userId') this.user, this.driverId, @JsonKey(name: 'expreienceType') this.experienceType, @JsonKey(name: 'exprerienceDescription') this.experienceDescription, this.rating});
  factory _ReviewRating.fromJson(Map<String, dynamic> json) => _$ReviewRatingFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? orderId;
@override@JsonKey(name: 'userId') final  ReviewUser? user;
@override final  String? driverId;
@override@JsonKey(name: 'expreienceType') final  String? experienceType;
@override@JsonKey(name: 'exprerienceDescription') final  String? experienceDescription;
@override final  int? rating;

/// Create a copy of ReviewRating
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewRatingCopyWith<_ReviewRating> get copyWith => __$ReviewRatingCopyWithImpl<_ReviewRating>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewRatingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewRating&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.user, user) || other.user == user)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.experienceType, experienceType) || other.experienceType == experienceType)&&(identical(other.experienceDescription, experienceDescription) || other.experienceDescription == experienceDescription)&&(identical(other.rating, rating) || other.rating == rating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,user,driverId,experienceType,experienceDescription,rating);

@override
String toString() {
  return 'ReviewRating(id: $id, orderId: $orderId, user: $user, driverId: $driverId, experienceType: $experienceType, experienceDescription: $experienceDescription, rating: $rating)';
}


}

/// @nodoc
abstract mixin class _$ReviewRatingCopyWith<$Res> implements $ReviewRatingCopyWith<$Res> {
  factory _$ReviewRatingCopyWith(_ReviewRating value, $Res Function(_ReviewRating) _then) = __$ReviewRatingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? orderId,@JsonKey(name: 'userId') ReviewUser? user, String? driverId,@JsonKey(name: 'expreienceType') String? experienceType,@JsonKey(name: 'exprerienceDescription') String? experienceDescription, int? rating
});


@override $ReviewUserCopyWith<$Res>? get user;

}
/// @nodoc
class __$ReviewRatingCopyWithImpl<$Res>
    implements _$ReviewRatingCopyWith<$Res> {
  __$ReviewRatingCopyWithImpl(this._self, this._then);

  final _ReviewRating _self;
  final $Res Function(_ReviewRating) _then;

/// Create a copy of ReviewRating
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? orderId = freezed,Object? user = freezed,Object? driverId = freezed,Object? experienceType = freezed,Object? experienceDescription = freezed,Object? rating = freezed,}) {
  return _then(_ReviewRating(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ReviewUser?,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,experienceType: freezed == experienceType ? _self.experienceType : experienceType // ignore: cast_nullable_to_non_nullable
as String?,experienceDescription: freezed == experienceDescription ? _self.experienceDescription : experienceDescription // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of ReviewRating
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $ReviewUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$ReviewUser {

@JsonKey(name: '_id') String? get id; String? get name; dynamic get phone; String? get image;
/// Create a copy of ReviewUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewUserCopyWith<ReviewUser> get copyWith => _$ReviewUserCopyWithImpl<ReviewUser>(this as ReviewUser, _$identity);

  /// Serializes this ReviewUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.phone, phone)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(phone),image);

@override
String toString() {
  return 'ReviewUser(id: $id, name: $name, phone: $phone, image: $image)';
}


}

/// @nodoc
abstract mixin class $ReviewUserCopyWith<$Res>  {
  factory $ReviewUserCopyWith(ReviewUser value, $Res Function(ReviewUser) _then) = _$ReviewUserCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? name, dynamic phone, String? image
});




}
/// @nodoc
class _$ReviewUserCopyWithImpl<$Res>
    implements $ReviewUserCopyWith<$Res> {
  _$ReviewUserCopyWithImpl(this._self, this._then);

  final ReviewUser _self;
  final $Res Function(ReviewUser) _then;

/// Create a copy of ReviewUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? phone = freezed,Object? image = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as dynamic,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReviewUser].
extension ReviewUserPatterns on ReviewUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewUser value)  $default,){
final _that = this;
switch (_that) {
case _ReviewUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewUser value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? name,  dynamic phone,  String? image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewUser() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? name,  dynamic phone,  String? image)  $default,) {final _that = this;
switch (_that) {
case _ReviewUser():
return $default(_that.id,_that.name,_that.phone,_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? name,  dynamic phone,  String? image)?  $default,) {final _that = this;
switch (_that) {
case _ReviewUser() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReviewUser implements ReviewUser {
  const _ReviewUser({@JsonKey(name: '_id') this.id, this.name, this.phone, this.image});
  factory _ReviewUser.fromJson(Map<String, dynamic> json) => _$ReviewUserFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? name;
@override final  dynamic phone;
@override final  String? image;

/// Create a copy of ReviewUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewUserCopyWith<_ReviewUser> get copyWith => __$ReviewUserCopyWithImpl<_ReviewUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.phone, phone)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(phone),image);

@override
String toString() {
  return 'ReviewUser(id: $id, name: $name, phone: $phone, image: $image)';
}


}

/// @nodoc
abstract mixin class _$ReviewUserCopyWith<$Res> implements $ReviewUserCopyWith<$Res> {
  factory _$ReviewUserCopyWith(_ReviewUser value, $Res Function(_ReviewUser) _then) = __$ReviewUserCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? name, dynamic phone, String? image
});




}
/// @nodoc
class __$ReviewUserCopyWithImpl<$Res>
    implements _$ReviewUserCopyWith<$Res> {
  __$ReviewUserCopyWithImpl(this._self, this._then);

  final _ReviewUser _self;
  final $Res Function(_ReviewUser) _then;

/// Create a copy of ReviewUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? phone = freezed,Object? image = freezed,}) {
  return _then(_ReviewUser(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as dynamic,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
