// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeDriverInfo {

 String get id; String get name; String? get image;@JsonKey(name: 'isOnline') bool get isOnline; String? get verificationStatus; String? get imageVerificationStatus; bool get willGetOrder; bool get onboardingComplete; double? get rating; bool get lowBalance;@JsonKey(fromJson: _doubleFromJson) double get driverWalletLimit;
/// Create a copy of HomeDriverInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeDriverInfoCopyWith<HomeDriverInfo> get copyWith => _$HomeDriverInfoCopyWithImpl<HomeDriverInfo>(this as HomeDriverInfo, _$identity);

  /// Serializes this HomeDriverInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDriverInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.imageVerificationStatus, imageVerificationStatus) || other.imageVerificationStatus == imageVerificationStatus)&&(identical(other.willGetOrder, willGetOrder) || other.willGetOrder == willGetOrder)&&(identical(other.onboardingComplete, onboardingComplete) || other.onboardingComplete == onboardingComplete)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.lowBalance, lowBalance) || other.lowBalance == lowBalance)&&(identical(other.driverWalletLimit, driverWalletLimit) || other.driverWalletLimit == driverWalletLimit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image,isOnline,verificationStatus,imageVerificationStatus,willGetOrder,onboardingComplete,rating,lowBalance,driverWalletLimit);

@override
String toString() {
  return 'HomeDriverInfo(id: $id, name: $name, image: $image, isOnline: $isOnline, verificationStatus: $verificationStatus, imageVerificationStatus: $imageVerificationStatus, willGetOrder: $willGetOrder, onboardingComplete: $onboardingComplete, rating: $rating, lowBalance: $lowBalance, driverWalletLimit: $driverWalletLimit)';
}


}

/// @nodoc
abstract mixin class $HomeDriverInfoCopyWith<$Res>  {
  factory $HomeDriverInfoCopyWith(HomeDriverInfo value, $Res Function(HomeDriverInfo) _then) = _$HomeDriverInfoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? image,@JsonKey(name: 'isOnline') bool isOnline, String? verificationStatus, String? imageVerificationStatus, bool willGetOrder, bool onboardingComplete, double? rating, bool lowBalance,@JsonKey(fromJson: _doubleFromJson) double driverWalletLimit
});




}
/// @nodoc
class _$HomeDriverInfoCopyWithImpl<$Res>
    implements $HomeDriverInfoCopyWith<$Res> {
  _$HomeDriverInfoCopyWithImpl(this._self, this._then);

  final HomeDriverInfo _self;
  final $Res Function(HomeDriverInfo) _then;

/// Create a copy of HomeDriverInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? image = freezed,Object? isOnline = null,Object? verificationStatus = freezed,Object? imageVerificationStatus = freezed,Object? willGetOrder = null,Object? onboardingComplete = null,Object? rating = freezed,Object? lowBalance = null,Object? driverWalletLimit = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,verificationStatus: freezed == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String?,imageVerificationStatus: freezed == imageVerificationStatus ? _self.imageVerificationStatus : imageVerificationStatus // ignore: cast_nullable_to_non_nullable
as String?,willGetOrder: null == willGetOrder ? _self.willGetOrder : willGetOrder // ignore: cast_nullable_to_non_nullable
as bool,onboardingComplete: null == onboardingComplete ? _self.onboardingComplete : onboardingComplete // ignore: cast_nullable_to_non_nullable
as bool,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,lowBalance: null == lowBalance ? _self.lowBalance : lowBalance // ignore: cast_nullable_to_non_nullable
as bool,driverWalletLimit: null == driverWalletLimit ? _self.driverWalletLimit : driverWalletLimit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeDriverInfo].
extension HomeDriverInfoPatterns on HomeDriverInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeDriverInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeDriverInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeDriverInfo value)  $default,){
final _that = this;
switch (_that) {
case _HomeDriverInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeDriverInfo value)?  $default,){
final _that = this;
switch (_that) {
case _HomeDriverInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? image, @JsonKey(name: 'isOnline')  bool isOnline,  String? verificationStatus,  String? imageVerificationStatus,  bool willGetOrder,  bool onboardingComplete,  double? rating,  bool lowBalance, @JsonKey(fromJson: _doubleFromJson)  double driverWalletLimit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeDriverInfo() when $default != null:
return $default(_that.id,_that.name,_that.image,_that.isOnline,_that.verificationStatus,_that.imageVerificationStatus,_that.willGetOrder,_that.onboardingComplete,_that.rating,_that.lowBalance,_that.driverWalletLimit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? image, @JsonKey(name: 'isOnline')  bool isOnline,  String? verificationStatus,  String? imageVerificationStatus,  bool willGetOrder,  bool onboardingComplete,  double? rating,  bool lowBalance, @JsonKey(fromJson: _doubleFromJson)  double driverWalletLimit)  $default,) {final _that = this;
switch (_that) {
case _HomeDriverInfo():
return $default(_that.id,_that.name,_that.image,_that.isOnline,_that.verificationStatus,_that.imageVerificationStatus,_that.willGetOrder,_that.onboardingComplete,_that.rating,_that.lowBalance,_that.driverWalletLimit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? image, @JsonKey(name: 'isOnline')  bool isOnline,  String? verificationStatus,  String? imageVerificationStatus,  bool willGetOrder,  bool onboardingComplete,  double? rating,  bool lowBalance, @JsonKey(fromJson: _doubleFromJson)  double driverWalletLimit)?  $default,) {final _that = this;
switch (_that) {
case _HomeDriverInfo() when $default != null:
return $default(_that.id,_that.name,_that.image,_that.isOnline,_that.verificationStatus,_that.imageVerificationStatus,_that.willGetOrder,_that.onboardingComplete,_that.rating,_that.lowBalance,_that.driverWalletLimit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeDriverInfo implements HomeDriverInfo {
  const _HomeDriverInfo({required this.id, required this.name, this.image, @JsonKey(name: 'isOnline') this.isOnline = false, this.verificationStatus, this.imageVerificationStatus, this.willGetOrder = true, this.onboardingComplete = false, this.rating, this.lowBalance = false, @JsonKey(fromJson: _doubleFromJson) this.driverWalletLimit = 0.0});
  factory _HomeDriverInfo.fromJson(Map<String, dynamic> json) => _$HomeDriverInfoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? image;
@override@JsonKey(name: 'isOnline') final  bool isOnline;
@override final  String? verificationStatus;
@override final  String? imageVerificationStatus;
@override@JsonKey() final  bool willGetOrder;
@override@JsonKey() final  bool onboardingComplete;
@override final  double? rating;
@override@JsonKey() final  bool lowBalance;
@override@JsonKey(fromJson: _doubleFromJson) final  double driverWalletLimit;

/// Create a copy of HomeDriverInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeDriverInfoCopyWith<_HomeDriverInfo> get copyWith => __$HomeDriverInfoCopyWithImpl<_HomeDriverInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeDriverInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeDriverInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.imageVerificationStatus, imageVerificationStatus) || other.imageVerificationStatus == imageVerificationStatus)&&(identical(other.willGetOrder, willGetOrder) || other.willGetOrder == willGetOrder)&&(identical(other.onboardingComplete, onboardingComplete) || other.onboardingComplete == onboardingComplete)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.lowBalance, lowBalance) || other.lowBalance == lowBalance)&&(identical(other.driverWalletLimit, driverWalletLimit) || other.driverWalletLimit == driverWalletLimit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image,isOnline,verificationStatus,imageVerificationStatus,willGetOrder,onboardingComplete,rating,lowBalance,driverWalletLimit);

@override
String toString() {
  return 'HomeDriverInfo(id: $id, name: $name, image: $image, isOnline: $isOnline, verificationStatus: $verificationStatus, imageVerificationStatus: $imageVerificationStatus, willGetOrder: $willGetOrder, onboardingComplete: $onboardingComplete, rating: $rating, lowBalance: $lowBalance, driverWalletLimit: $driverWalletLimit)';
}


}

/// @nodoc
abstract mixin class _$HomeDriverInfoCopyWith<$Res> implements $HomeDriverInfoCopyWith<$Res> {
  factory _$HomeDriverInfoCopyWith(_HomeDriverInfo value, $Res Function(_HomeDriverInfo) _then) = __$HomeDriverInfoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? image,@JsonKey(name: 'isOnline') bool isOnline, String? verificationStatus, String? imageVerificationStatus, bool willGetOrder, bool onboardingComplete, double? rating, bool lowBalance,@JsonKey(fromJson: _doubleFromJson) double driverWalletLimit
});




}
/// @nodoc
class __$HomeDriverInfoCopyWithImpl<$Res>
    implements _$HomeDriverInfoCopyWith<$Res> {
  __$HomeDriverInfoCopyWithImpl(this._self, this._then);

  final _HomeDriverInfo _self;
  final $Res Function(_HomeDriverInfo) _then;

/// Create a copy of HomeDriverInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? image = freezed,Object? isOnline = null,Object? verificationStatus = freezed,Object? imageVerificationStatus = freezed,Object? willGetOrder = null,Object? onboardingComplete = null,Object? rating = freezed,Object? lowBalance = null,Object? driverWalletLimit = null,}) {
  return _then(_HomeDriverInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,verificationStatus: freezed == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String?,imageVerificationStatus: freezed == imageVerificationStatus ? _self.imageVerificationStatus : imageVerificationStatus // ignore: cast_nullable_to_non_nullable
as String?,willGetOrder: null == willGetOrder ? _self.willGetOrder : willGetOrder // ignore: cast_nullable_to_non_nullable
as bool,onboardingComplete: null == onboardingComplete ? _self.onboardingComplete : onboardingComplete // ignore: cast_nullable_to_non_nullable
as bool,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,lowBalance: null == lowBalance ? _self.lowBalance : lowBalance // ignore: cast_nullable_to_non_nullable
as bool,driverWalletLimit: null == driverWalletLimit ? _self.driverWalletLimit : driverWalletLimit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$DocumentSubmissionStatus {

 bool get isPending; String? get status; String? get message; Map<String, dynamic>? get registration;
/// Create a copy of DocumentSubmissionStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentSubmissionStatusCopyWith<DocumentSubmissionStatus> get copyWith => _$DocumentSubmissionStatusCopyWithImpl<DocumentSubmissionStatus>(this as DocumentSubmissionStatus, _$identity);

  /// Serializes this DocumentSubmissionStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentSubmissionStatus&&(identical(other.isPending, isPending) || other.isPending == isPending)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.registration, registration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isPending,status,message,const DeepCollectionEquality().hash(registration));

@override
String toString() {
  return 'DocumentSubmissionStatus(isPending: $isPending, status: $status, message: $message, registration: $registration)';
}


}

/// @nodoc
abstract mixin class $DocumentSubmissionStatusCopyWith<$Res>  {
  factory $DocumentSubmissionStatusCopyWith(DocumentSubmissionStatus value, $Res Function(DocumentSubmissionStatus) _then) = _$DocumentSubmissionStatusCopyWithImpl;
@useResult
$Res call({
 bool isPending, String? status, String? message, Map<String, dynamic>? registration
});




}
/// @nodoc
class _$DocumentSubmissionStatusCopyWithImpl<$Res>
    implements $DocumentSubmissionStatusCopyWith<$Res> {
  _$DocumentSubmissionStatusCopyWithImpl(this._self, this._then);

  final DocumentSubmissionStatus _self;
  final $Res Function(DocumentSubmissionStatus) _then;

/// Create a copy of DocumentSubmissionStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isPending = null,Object? status = freezed,Object? message = freezed,Object? registration = freezed,}) {
  return _then(_self.copyWith(
isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,registration: freezed == registration ? _self.registration : registration // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [DocumentSubmissionStatus].
extension DocumentSubmissionStatusPatterns on DocumentSubmissionStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentSubmissionStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentSubmissionStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentSubmissionStatus value)  $default,){
final _that = this;
switch (_that) {
case _DocumentSubmissionStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentSubmissionStatus value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentSubmissionStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isPending,  String? status,  String? message,  Map<String, dynamic>? registration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentSubmissionStatus() when $default != null:
return $default(_that.isPending,_that.status,_that.message,_that.registration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isPending,  String? status,  String? message,  Map<String, dynamic>? registration)  $default,) {final _that = this;
switch (_that) {
case _DocumentSubmissionStatus():
return $default(_that.isPending,_that.status,_that.message,_that.registration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isPending,  String? status,  String? message,  Map<String, dynamic>? registration)?  $default,) {final _that = this;
switch (_that) {
case _DocumentSubmissionStatus() when $default != null:
return $default(_that.isPending,_that.status,_that.message,_that.registration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DocumentSubmissionStatus implements DocumentSubmissionStatus {
  const _DocumentSubmissionStatus({this.isPending = false, this.status, this.message, final  Map<String, dynamic>? registration}): _registration = registration;
  factory _DocumentSubmissionStatus.fromJson(Map<String, dynamic> json) => _$DocumentSubmissionStatusFromJson(json);

@override@JsonKey() final  bool isPending;
@override final  String? status;
@override final  String? message;
 final  Map<String, dynamic>? _registration;
@override Map<String, dynamic>? get registration {
  final value = _registration;
  if (value == null) return null;
  if (_registration is EqualUnmodifiableMapView) return _registration;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of DocumentSubmissionStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentSubmissionStatusCopyWith<_DocumentSubmissionStatus> get copyWith => __$DocumentSubmissionStatusCopyWithImpl<_DocumentSubmissionStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocumentSubmissionStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentSubmissionStatus&&(identical(other.isPending, isPending) || other.isPending == isPending)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._registration, _registration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isPending,status,message,const DeepCollectionEquality().hash(_registration));

@override
String toString() {
  return 'DocumentSubmissionStatus(isPending: $isPending, status: $status, message: $message, registration: $registration)';
}


}

/// @nodoc
abstract mixin class _$DocumentSubmissionStatusCopyWith<$Res> implements $DocumentSubmissionStatusCopyWith<$Res> {
  factory _$DocumentSubmissionStatusCopyWith(_DocumentSubmissionStatus value, $Res Function(_DocumentSubmissionStatus) _then) = __$DocumentSubmissionStatusCopyWithImpl;
@override @useResult
$Res call({
 bool isPending, String? status, String? message, Map<String, dynamic>? registration
});




}
/// @nodoc
class __$DocumentSubmissionStatusCopyWithImpl<$Res>
    implements _$DocumentSubmissionStatusCopyWith<$Res> {
  __$DocumentSubmissionStatusCopyWithImpl(this._self, this._then);

  final _DocumentSubmissionStatus _self;
  final $Res Function(_DocumentSubmissionStatus) _then;

/// Create a copy of DocumentSubmissionStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isPending = null,Object? status = freezed,Object? message = freezed,Object? registration = freezed,}) {
  return _then(_DocumentSubmissionStatus(
isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,registration: freezed == registration ? _self._registration : registration // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$EarningsStats {

 double get total; double get cash; double get online;
/// Create a copy of EarningsStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EarningsStatsCopyWith<EarningsStats> get copyWith => _$EarningsStatsCopyWithImpl<EarningsStats>(this as EarningsStats, _$identity);

  /// Serializes this EarningsStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EarningsStats&&(identical(other.total, total) || other.total == total)&&(identical(other.cash, cash) || other.cash == cash)&&(identical(other.online, online) || other.online == online));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,cash,online);

@override
String toString() {
  return 'EarningsStats(total: $total, cash: $cash, online: $online)';
}


}

/// @nodoc
abstract mixin class $EarningsStatsCopyWith<$Res>  {
  factory $EarningsStatsCopyWith(EarningsStats value, $Res Function(EarningsStats) _then) = _$EarningsStatsCopyWithImpl;
@useResult
$Res call({
 double total, double cash, double online
});




}
/// @nodoc
class _$EarningsStatsCopyWithImpl<$Res>
    implements $EarningsStatsCopyWith<$Res> {
  _$EarningsStatsCopyWithImpl(this._self, this._then);

  final EarningsStats _self;
  final $Res Function(EarningsStats) _then;

/// Create a copy of EarningsStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? cash = null,Object? online = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,cash: null == cash ? _self.cash : cash // ignore: cast_nullable_to_non_nullable
as double,online: null == online ? _self.online : online // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [EarningsStats].
extension EarningsStatsPatterns on EarningsStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EarningsStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EarningsStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EarningsStats value)  $default,){
final _that = this;
switch (_that) {
case _EarningsStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EarningsStats value)?  $default,){
final _that = this;
switch (_that) {
case _EarningsStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double total,  double cash,  double online)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EarningsStats() when $default != null:
return $default(_that.total,_that.cash,_that.online);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double total,  double cash,  double online)  $default,) {final _that = this;
switch (_that) {
case _EarningsStats():
return $default(_that.total,_that.cash,_that.online);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double total,  double cash,  double online)?  $default,) {final _that = this;
switch (_that) {
case _EarningsStats() when $default != null:
return $default(_that.total,_that.cash,_that.online);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EarningsStats implements EarningsStats {
  const _EarningsStats({required this.total, required this.cash, required this.online});
  factory _EarningsStats.fromJson(Map<String, dynamic> json) => _$EarningsStatsFromJson(json);

@override final  double total;
@override final  double cash;
@override final  double online;

/// Create a copy of EarningsStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EarningsStatsCopyWith<_EarningsStats> get copyWith => __$EarningsStatsCopyWithImpl<_EarningsStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EarningsStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EarningsStats&&(identical(other.total, total) || other.total == total)&&(identical(other.cash, cash) || other.cash == cash)&&(identical(other.online, online) || other.online == online));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,cash,online);

@override
String toString() {
  return 'EarningsStats(total: $total, cash: $cash, online: $online)';
}


}

/// @nodoc
abstract mixin class _$EarningsStatsCopyWith<$Res> implements $EarningsStatsCopyWith<$Res> {
  factory _$EarningsStatsCopyWith(_EarningsStats value, $Res Function(_EarningsStats) _then) = __$EarningsStatsCopyWithImpl;
@override @useResult
$Res call({
 double total, double cash, double online
});




}
/// @nodoc
class __$EarningsStatsCopyWithImpl<$Res>
    implements _$EarningsStatsCopyWith<$Res> {
  __$EarningsStatsCopyWithImpl(this._self, this._then);

  final _EarningsStats _self;
  final $Res Function(_EarningsStats) _then;

/// Create a copy of EarningsStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? cash = null,Object? online = null,}) {
  return _then(_EarningsStats(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,cash: null == cash ? _self.cash : cash // ignore: cast_nullable_to_non_nullable
as double,online: null == online ? _self.online : online // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$RidesStats {

 int get total; int get completed; int get cancelled;
/// Create a copy of RidesStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RidesStatsCopyWith<RidesStats> get copyWith => _$RidesStatsCopyWithImpl<RidesStats>(this as RidesStats, _$identity);

  /// Serializes this RidesStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RidesStats&&(identical(other.total, total) || other.total == total)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.cancelled, cancelled) || other.cancelled == cancelled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,completed,cancelled);

@override
String toString() {
  return 'RidesStats(total: $total, completed: $completed, cancelled: $cancelled)';
}


}

/// @nodoc
abstract mixin class $RidesStatsCopyWith<$Res>  {
  factory $RidesStatsCopyWith(RidesStats value, $Res Function(RidesStats) _then) = _$RidesStatsCopyWithImpl;
@useResult
$Res call({
 int total, int completed, int cancelled
});




}
/// @nodoc
class _$RidesStatsCopyWithImpl<$Res>
    implements $RidesStatsCopyWith<$Res> {
  _$RidesStatsCopyWithImpl(this._self, this._then);

  final RidesStats _self;
  final $Res Function(RidesStats) _then;

/// Create a copy of RidesStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? completed = null,Object? cancelled = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int,cancelled: null == cancelled ? _self.cancelled : cancelled // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RidesStats].
extension RidesStatsPatterns on RidesStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RidesStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RidesStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RidesStats value)  $default,){
final _that = this;
switch (_that) {
case _RidesStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RidesStats value)?  $default,){
final _that = this;
switch (_that) {
case _RidesStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int completed,  int cancelled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RidesStats() when $default != null:
return $default(_that.total,_that.completed,_that.cancelled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int completed,  int cancelled)  $default,) {final _that = this;
switch (_that) {
case _RidesStats():
return $default(_that.total,_that.completed,_that.cancelled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int completed,  int cancelled)?  $default,) {final _that = this;
switch (_that) {
case _RidesStats() when $default != null:
return $default(_that.total,_that.completed,_that.cancelled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RidesStats implements RidesStats {
  const _RidesStats({required this.total, required this.completed, required this.cancelled});
  factory _RidesStats.fromJson(Map<String, dynamic> json) => _$RidesStatsFromJson(json);

@override final  int total;
@override final  int completed;
@override final  int cancelled;

/// Create a copy of RidesStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RidesStatsCopyWith<_RidesStats> get copyWith => __$RidesStatsCopyWithImpl<_RidesStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RidesStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RidesStats&&(identical(other.total, total) || other.total == total)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.cancelled, cancelled) || other.cancelled == cancelled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,completed,cancelled);

@override
String toString() {
  return 'RidesStats(total: $total, completed: $completed, cancelled: $cancelled)';
}


}

/// @nodoc
abstract mixin class _$RidesStatsCopyWith<$Res> implements $RidesStatsCopyWith<$Res> {
  factory _$RidesStatsCopyWith(_RidesStats value, $Res Function(_RidesStats) _then) = __$RidesStatsCopyWithImpl;
@override @useResult
$Res call({
 int total, int completed, int cancelled
});




}
/// @nodoc
class __$RidesStatsCopyWithImpl<$Res>
    implements _$RidesStatsCopyWith<$Res> {
  __$RidesStatsCopyWithImpl(this._self, this._then);

  final _RidesStats _self;
  final $Res Function(_RidesStats) _then;

/// Create a copy of RidesStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? completed = null,Object? cancelled = null,}) {
  return _then(_RidesStats(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int,cancelled: null == cancelled ? _self.cancelled : cancelled // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$TodayStats {

 EarningsStats get earnings; RidesStats get rides;
/// Create a copy of TodayStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodayStatsCopyWith<TodayStats> get copyWith => _$TodayStatsCopyWithImpl<TodayStats>(this as TodayStats, _$identity);

  /// Serializes this TodayStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayStats&&(identical(other.earnings, earnings) || other.earnings == earnings)&&(identical(other.rides, rides) || other.rides == rides));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,earnings,rides);

@override
String toString() {
  return 'TodayStats(earnings: $earnings, rides: $rides)';
}


}

/// @nodoc
abstract mixin class $TodayStatsCopyWith<$Res>  {
  factory $TodayStatsCopyWith(TodayStats value, $Res Function(TodayStats) _then) = _$TodayStatsCopyWithImpl;
@useResult
$Res call({
 EarningsStats earnings, RidesStats rides
});


$EarningsStatsCopyWith<$Res> get earnings;$RidesStatsCopyWith<$Res> get rides;

}
/// @nodoc
class _$TodayStatsCopyWithImpl<$Res>
    implements $TodayStatsCopyWith<$Res> {
  _$TodayStatsCopyWithImpl(this._self, this._then);

  final TodayStats _self;
  final $Res Function(TodayStats) _then;

/// Create a copy of TodayStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? earnings = null,Object? rides = null,}) {
  return _then(_self.copyWith(
earnings: null == earnings ? _self.earnings : earnings // ignore: cast_nullable_to_non_nullable
as EarningsStats,rides: null == rides ? _self.rides : rides // ignore: cast_nullable_to_non_nullable
as RidesStats,
  ));
}
/// Create a copy of TodayStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EarningsStatsCopyWith<$Res> get earnings {
  
  return $EarningsStatsCopyWith<$Res>(_self.earnings, (value) {
    return _then(_self.copyWith(earnings: value));
  });
}/// Create a copy of TodayStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RidesStatsCopyWith<$Res> get rides {
  
  return $RidesStatsCopyWith<$Res>(_self.rides, (value) {
    return _then(_self.copyWith(rides: value));
  });
}
}


/// Adds pattern-matching-related methods to [TodayStats].
extension TodayStatsPatterns on TodayStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodayStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodayStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodayStats value)  $default,){
final _that = this;
switch (_that) {
case _TodayStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodayStats value)?  $default,){
final _that = this;
switch (_that) {
case _TodayStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EarningsStats earnings,  RidesStats rides)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodayStats() when $default != null:
return $default(_that.earnings,_that.rides);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EarningsStats earnings,  RidesStats rides)  $default,) {final _that = this;
switch (_that) {
case _TodayStats():
return $default(_that.earnings,_that.rides);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EarningsStats earnings,  RidesStats rides)?  $default,) {final _that = this;
switch (_that) {
case _TodayStats() when $default != null:
return $default(_that.earnings,_that.rides);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TodayStats implements TodayStats {
  const _TodayStats({required this.earnings, required this.rides});
  factory _TodayStats.fromJson(Map<String, dynamic> json) => _$TodayStatsFromJson(json);

@override final  EarningsStats earnings;
@override final  RidesStats rides;

/// Create a copy of TodayStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodayStatsCopyWith<_TodayStats> get copyWith => __$TodayStatsCopyWithImpl<_TodayStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TodayStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodayStats&&(identical(other.earnings, earnings) || other.earnings == earnings)&&(identical(other.rides, rides) || other.rides == rides));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,earnings,rides);

@override
String toString() {
  return 'TodayStats(earnings: $earnings, rides: $rides)';
}


}

/// @nodoc
abstract mixin class _$TodayStatsCopyWith<$Res> implements $TodayStatsCopyWith<$Res> {
  factory _$TodayStatsCopyWith(_TodayStats value, $Res Function(_TodayStats) _then) = __$TodayStatsCopyWithImpl;
@override @useResult
$Res call({
 EarningsStats earnings, RidesStats rides
});


@override $EarningsStatsCopyWith<$Res> get earnings;@override $RidesStatsCopyWith<$Res> get rides;

}
/// @nodoc
class __$TodayStatsCopyWithImpl<$Res>
    implements _$TodayStatsCopyWith<$Res> {
  __$TodayStatsCopyWithImpl(this._self, this._then);

  final _TodayStats _self;
  final $Res Function(_TodayStats) _then;

/// Create a copy of TodayStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? earnings = null,Object? rides = null,}) {
  return _then(_TodayStats(
earnings: null == earnings ? _self.earnings : earnings // ignore: cast_nullable_to_non_nullable
as EarningsStats,rides: null == rides ? _self.rides : rides // ignore: cast_nullable_to_non_nullable
as RidesStats,
  ));
}

/// Create a copy of TodayStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EarningsStatsCopyWith<$Res> get earnings {
  
  return $EarningsStatsCopyWith<$Res>(_self.earnings, (value) {
    return _then(_self.copyWith(earnings: value));
  });
}/// Create a copy of TodayStats
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RidesStatsCopyWith<$Res> get rides {
  
  return $RidesStatsCopyWith<$Res>(_self.rides, (value) {
    return _then(_self.copyWith(rides: value));
  });
}
}


/// @nodoc
mixin _$HomeData {

 HomeDriverInfo get driver; DocumentSubmissionStatus get documentSubmission; TodayStats get todayStats;
/// Create a copy of HomeData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeDataCopyWith<HomeData> get copyWith => _$HomeDataCopyWithImpl<HomeData>(this as HomeData, _$identity);

  /// Serializes this HomeData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeData&&(identical(other.driver, driver) || other.driver == driver)&&(identical(other.documentSubmission, documentSubmission) || other.documentSubmission == documentSubmission)&&(identical(other.todayStats, todayStats) || other.todayStats == todayStats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,driver,documentSubmission,todayStats);

@override
String toString() {
  return 'HomeData(driver: $driver, documentSubmission: $documentSubmission, todayStats: $todayStats)';
}


}

/// @nodoc
abstract mixin class $HomeDataCopyWith<$Res>  {
  factory $HomeDataCopyWith(HomeData value, $Res Function(HomeData) _then) = _$HomeDataCopyWithImpl;
@useResult
$Res call({
 HomeDriverInfo driver, DocumentSubmissionStatus documentSubmission, TodayStats todayStats
});


$HomeDriverInfoCopyWith<$Res> get driver;$DocumentSubmissionStatusCopyWith<$Res> get documentSubmission;$TodayStatsCopyWith<$Res> get todayStats;

}
/// @nodoc
class _$HomeDataCopyWithImpl<$Res>
    implements $HomeDataCopyWith<$Res> {
  _$HomeDataCopyWithImpl(this._self, this._then);

  final HomeData _self;
  final $Res Function(HomeData) _then;

/// Create a copy of HomeData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? driver = null,Object? documentSubmission = null,Object? todayStats = null,}) {
  return _then(_self.copyWith(
driver: null == driver ? _self.driver : driver // ignore: cast_nullable_to_non_nullable
as HomeDriverInfo,documentSubmission: null == documentSubmission ? _self.documentSubmission : documentSubmission // ignore: cast_nullable_to_non_nullable
as DocumentSubmissionStatus,todayStats: null == todayStats ? _self.todayStats : todayStats // ignore: cast_nullable_to_non_nullable
as TodayStats,
  ));
}
/// Create a copy of HomeData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeDriverInfoCopyWith<$Res> get driver {
  
  return $HomeDriverInfoCopyWith<$Res>(_self.driver, (value) {
    return _then(_self.copyWith(driver: value));
  });
}/// Create a copy of HomeData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentSubmissionStatusCopyWith<$Res> get documentSubmission {
  
  return $DocumentSubmissionStatusCopyWith<$Res>(_self.documentSubmission, (value) {
    return _then(_self.copyWith(documentSubmission: value));
  });
}/// Create a copy of HomeData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TodayStatsCopyWith<$Res> get todayStats {
  
  return $TodayStatsCopyWith<$Res>(_self.todayStats, (value) {
    return _then(_self.copyWith(todayStats: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeData].
extension HomeDataPatterns on HomeData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeData value)  $default,){
final _that = this;
switch (_that) {
case _HomeData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeData value)?  $default,){
final _that = this;
switch (_that) {
case _HomeData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HomeDriverInfo driver,  DocumentSubmissionStatus documentSubmission,  TodayStats todayStats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeData() when $default != null:
return $default(_that.driver,_that.documentSubmission,_that.todayStats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HomeDriverInfo driver,  DocumentSubmissionStatus documentSubmission,  TodayStats todayStats)  $default,) {final _that = this;
switch (_that) {
case _HomeData():
return $default(_that.driver,_that.documentSubmission,_that.todayStats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HomeDriverInfo driver,  DocumentSubmissionStatus documentSubmission,  TodayStats todayStats)?  $default,) {final _that = this;
switch (_that) {
case _HomeData() when $default != null:
return $default(_that.driver,_that.documentSubmission,_that.todayStats);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeData implements HomeData {
  const _HomeData({required this.driver, required this.documentSubmission, required this.todayStats});
  factory _HomeData.fromJson(Map<String, dynamic> json) => _$HomeDataFromJson(json);

@override final  HomeDriverInfo driver;
@override final  DocumentSubmissionStatus documentSubmission;
@override final  TodayStats todayStats;

/// Create a copy of HomeData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeDataCopyWith<_HomeData> get copyWith => __$HomeDataCopyWithImpl<_HomeData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeData&&(identical(other.driver, driver) || other.driver == driver)&&(identical(other.documentSubmission, documentSubmission) || other.documentSubmission == documentSubmission)&&(identical(other.todayStats, todayStats) || other.todayStats == todayStats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,driver,documentSubmission,todayStats);

@override
String toString() {
  return 'HomeData(driver: $driver, documentSubmission: $documentSubmission, todayStats: $todayStats)';
}


}

/// @nodoc
abstract mixin class _$HomeDataCopyWith<$Res> implements $HomeDataCopyWith<$Res> {
  factory _$HomeDataCopyWith(_HomeData value, $Res Function(_HomeData) _then) = __$HomeDataCopyWithImpl;
@override @useResult
$Res call({
 HomeDriverInfo driver, DocumentSubmissionStatus documentSubmission, TodayStats todayStats
});


@override $HomeDriverInfoCopyWith<$Res> get driver;@override $DocumentSubmissionStatusCopyWith<$Res> get documentSubmission;@override $TodayStatsCopyWith<$Res> get todayStats;

}
/// @nodoc
class __$HomeDataCopyWithImpl<$Res>
    implements _$HomeDataCopyWith<$Res> {
  __$HomeDataCopyWithImpl(this._self, this._then);

  final _HomeData _self;
  final $Res Function(_HomeData) _then;

/// Create a copy of HomeData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? driver = null,Object? documentSubmission = null,Object? todayStats = null,}) {
  return _then(_HomeData(
driver: null == driver ? _self.driver : driver // ignore: cast_nullable_to_non_nullable
as HomeDriverInfo,documentSubmission: null == documentSubmission ? _self.documentSubmission : documentSubmission // ignore: cast_nullable_to_non_nullable
as DocumentSubmissionStatus,todayStats: null == todayStats ? _self.todayStats : todayStats // ignore: cast_nullable_to_non_nullable
as TodayStats,
  ));
}

/// Create a copy of HomeData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeDriverInfoCopyWith<$Res> get driver {
  
  return $HomeDriverInfoCopyWith<$Res>(_self.driver, (value) {
    return _then(_self.copyWith(driver: value));
  });
}/// Create a copy of HomeData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentSubmissionStatusCopyWith<$Res> get documentSubmission {
  
  return $DocumentSubmissionStatusCopyWith<$Res>(_self.documentSubmission, (value) {
    return _then(_self.copyWith(documentSubmission: value));
  });
}/// Create a copy of HomeData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TodayStatsCopyWith<$Res> get todayStats {
  
  return $TodayStatsCopyWith<$Res>(_self.todayStats, (value) {
    return _then(_self.copyWith(todayStats: value));
  });
}
}


/// @nodoc
mixin _$HomeResponse {

 bool get success; String get message; HomeData get data;
/// Create a copy of HomeResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeResponseCopyWith<HomeResponse> get copyWith => _$HomeResponseCopyWithImpl<HomeResponse>(this as HomeResponse, _$identity);

  /// Serializes this HomeResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'HomeResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $HomeResponseCopyWith<$Res>  {
  factory $HomeResponseCopyWith(HomeResponse value, $Res Function(HomeResponse) _then) = _$HomeResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, HomeData data
});


$HomeDataCopyWith<$Res> get data;

}
/// @nodoc
class _$HomeResponseCopyWithImpl<$Res>
    implements $HomeResponseCopyWith<$Res> {
  _$HomeResponseCopyWithImpl(this._self, this._then);

  final HomeResponse _self;
  final $Res Function(HomeResponse) _then;

/// Create a copy of HomeResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as HomeData,
  ));
}
/// Create a copy of HomeResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeDataCopyWith<$Res> get data {
  
  return $HomeDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeResponse].
extension HomeResponsePatterns on HomeResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeResponse value)  $default,){
final _that = this;
switch (_that) {
case _HomeResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeResponse value)?  $default,){
final _that = this;
switch (_that) {
case _HomeResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  HomeData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  HomeData data)  $default,) {final _that = this;
switch (_that) {
case _HomeResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  HomeData data)?  $default,) {final _that = this;
switch (_that) {
case _HomeResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeResponse implements HomeResponse {
  const _HomeResponse({required this.success, required this.message, required this.data});
  factory _HomeResponse.fromJson(Map<String, dynamic> json) => _$HomeResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override final  HomeData data;

/// Create a copy of HomeResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeResponseCopyWith<_HomeResponse> get copyWith => __$HomeResponseCopyWithImpl<_HomeResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'HomeResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$HomeResponseCopyWith<$Res> implements $HomeResponseCopyWith<$Res> {
  factory _$HomeResponseCopyWith(_HomeResponse value, $Res Function(_HomeResponse) _then) = __$HomeResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, HomeData data
});


@override $HomeDataCopyWith<$Res> get data;

}
/// @nodoc
class __$HomeResponseCopyWithImpl<$Res>
    implements _$HomeResponseCopyWith<$Res> {
  __$HomeResponseCopyWithImpl(this._self, this._then);

  final _HomeResponse _self;
  final $Res Function(_HomeResponse) _then;

/// Create a copy of HomeResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_HomeResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as HomeData,
  ));
}

/// Create a copy of HomeResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeDataCopyWith<$Res> get data {
  
  return $HomeDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
