// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DriverModel {

@JsonKey(name: '_id') String get id; String? get name;@JsonKey(fromJson: _phoneFromJson) String get phone; String? get email; String? get gender; String? get image; String? get DLImage; String? get PANImage; String? get aadharImageFront; String? get aadharImageBack; String? get imageVerificationStatus; String? get profileVerificationStatus; String? get vehicleVerificationStatus; String? get isCompleteVerified; String? get verificationStatus; DateTime? get dateOfBirth; bool? get isProfileCompleted; bool? get startDuty; bool? get disable; bool? get isCancelledAnyOrder; double? get rating; int? get totalRating; String? get preference; String? get alternateContact1; String? get relation1; String? get address1; String? get alternateContact2; String? get relation2; String? get address2; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of DriverModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DriverModelCopyWith<DriverModel> get copyWith => _$DriverModelCopyWithImpl<DriverModel>(this as DriverModel, _$identity);

  /// Serializes this DriverModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriverModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.image, image) || other.image == image)&&(identical(other.DLImage, DLImage) || other.DLImage == DLImage)&&(identical(other.PANImage, PANImage) || other.PANImage == PANImage)&&(identical(other.aadharImageFront, aadharImageFront) || other.aadharImageFront == aadharImageFront)&&(identical(other.aadharImageBack, aadharImageBack) || other.aadharImageBack == aadharImageBack)&&(identical(other.imageVerificationStatus, imageVerificationStatus) || other.imageVerificationStatus == imageVerificationStatus)&&(identical(other.profileVerificationStatus, profileVerificationStatus) || other.profileVerificationStatus == profileVerificationStatus)&&(identical(other.vehicleVerificationStatus, vehicleVerificationStatus) || other.vehicleVerificationStatus == vehicleVerificationStatus)&&(identical(other.isCompleteVerified, isCompleteVerified) || other.isCompleteVerified == isCompleteVerified)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.isProfileCompleted, isProfileCompleted) || other.isProfileCompleted == isProfileCompleted)&&(identical(other.startDuty, startDuty) || other.startDuty == startDuty)&&(identical(other.disable, disable) || other.disable == disable)&&(identical(other.isCancelledAnyOrder, isCancelledAnyOrder) || other.isCancelledAnyOrder == isCancelledAnyOrder)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.totalRating, totalRating) || other.totalRating == totalRating)&&(identical(other.preference, preference) || other.preference == preference)&&(identical(other.alternateContact1, alternateContact1) || other.alternateContact1 == alternateContact1)&&(identical(other.relation1, relation1) || other.relation1 == relation1)&&(identical(other.address1, address1) || other.address1 == address1)&&(identical(other.alternateContact2, alternateContact2) || other.alternateContact2 == alternateContact2)&&(identical(other.relation2, relation2) || other.relation2 == relation2)&&(identical(other.address2, address2) || other.address2 == address2)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,phone,email,gender,image,DLImage,PANImage,aadharImageFront,aadharImageBack,imageVerificationStatus,profileVerificationStatus,vehicleVerificationStatus,isCompleteVerified,verificationStatus,dateOfBirth,isProfileCompleted,startDuty,disable,isCancelledAnyOrder,rating,totalRating,preference,alternateContact1,relation1,address1,alternateContact2,relation2,address2,createdAt,updatedAt]);

@override
String toString() {
  return 'DriverModel(id: $id, name: $name, phone: $phone, email: $email, gender: $gender, image: $image, DLImage: $DLImage, PANImage: $PANImage, aadharImageFront: $aadharImageFront, aadharImageBack: $aadharImageBack, imageVerificationStatus: $imageVerificationStatus, profileVerificationStatus: $profileVerificationStatus, vehicleVerificationStatus: $vehicleVerificationStatus, isCompleteVerified: $isCompleteVerified, verificationStatus: $verificationStatus, dateOfBirth: $dateOfBirth, isProfileCompleted: $isProfileCompleted, startDuty: $startDuty, disable: $disable, isCancelledAnyOrder: $isCancelledAnyOrder, rating: $rating, totalRating: $totalRating, preference: $preference, alternateContact1: $alternateContact1, relation1: $relation1, address1: $address1, alternateContact2: $alternateContact2, relation2: $relation2, address2: $address2, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DriverModelCopyWith<$Res>  {
  factory $DriverModelCopyWith(DriverModel value, $Res Function(DriverModel) _then) = _$DriverModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String? name,@JsonKey(fromJson: _phoneFromJson) String phone, String? email, String? gender, String? image, String? DLImage, String? PANImage, String? aadharImageFront, String? aadharImageBack, String? imageVerificationStatus, String? profileVerificationStatus, String? vehicleVerificationStatus, String? isCompleteVerified, String? verificationStatus, DateTime? dateOfBirth, bool? isProfileCompleted, bool? startDuty, bool? disable, bool? isCancelledAnyOrder, double? rating, int? totalRating, String? preference, String? alternateContact1, String? relation1, String? address1, String? alternateContact2, String? relation2, String? address2, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$DriverModelCopyWithImpl<$Res>
    implements $DriverModelCopyWith<$Res> {
  _$DriverModelCopyWithImpl(this._self, this._then);

  final DriverModel _self;
  final $Res Function(DriverModel) _then;

/// Create a copy of DriverModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? phone = null,Object? email = freezed,Object? gender = freezed,Object? image = freezed,Object? DLImage = freezed,Object? PANImage = freezed,Object? aadharImageFront = freezed,Object? aadharImageBack = freezed,Object? imageVerificationStatus = freezed,Object? profileVerificationStatus = freezed,Object? vehicleVerificationStatus = freezed,Object? isCompleteVerified = freezed,Object? verificationStatus = freezed,Object? dateOfBirth = freezed,Object? isProfileCompleted = freezed,Object? startDuty = freezed,Object? disable = freezed,Object? isCancelledAnyOrder = freezed,Object? rating = freezed,Object? totalRating = freezed,Object? preference = freezed,Object? alternateContact1 = freezed,Object? relation1 = freezed,Object? address1 = freezed,Object? alternateContact2 = freezed,Object? relation2 = freezed,Object? address2 = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,DLImage: freezed == DLImage ? _self.DLImage : DLImage // ignore: cast_nullable_to_non_nullable
as String?,PANImage: freezed == PANImage ? _self.PANImage : PANImage // ignore: cast_nullable_to_non_nullable
as String?,aadharImageFront: freezed == aadharImageFront ? _self.aadharImageFront : aadharImageFront // ignore: cast_nullable_to_non_nullable
as String?,aadharImageBack: freezed == aadharImageBack ? _self.aadharImageBack : aadharImageBack // ignore: cast_nullable_to_non_nullable
as String?,imageVerificationStatus: freezed == imageVerificationStatus ? _self.imageVerificationStatus : imageVerificationStatus // ignore: cast_nullable_to_non_nullable
as String?,profileVerificationStatus: freezed == profileVerificationStatus ? _self.profileVerificationStatus : profileVerificationStatus // ignore: cast_nullable_to_non_nullable
as String?,vehicleVerificationStatus: freezed == vehicleVerificationStatus ? _self.vehicleVerificationStatus : vehicleVerificationStatus // ignore: cast_nullable_to_non_nullable
as String?,isCompleteVerified: freezed == isCompleteVerified ? _self.isCompleteVerified : isCompleteVerified // ignore: cast_nullable_to_non_nullable
as String?,verificationStatus: freezed == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,isProfileCompleted: freezed == isProfileCompleted ? _self.isProfileCompleted : isProfileCompleted // ignore: cast_nullable_to_non_nullable
as bool?,startDuty: freezed == startDuty ? _self.startDuty : startDuty // ignore: cast_nullable_to_non_nullable
as bool?,disable: freezed == disable ? _self.disable : disable // ignore: cast_nullable_to_non_nullable
as bool?,isCancelledAnyOrder: freezed == isCancelledAnyOrder ? _self.isCancelledAnyOrder : isCancelledAnyOrder // ignore: cast_nullable_to_non_nullable
as bool?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,totalRating: freezed == totalRating ? _self.totalRating : totalRating // ignore: cast_nullable_to_non_nullable
as int?,preference: freezed == preference ? _self.preference : preference // ignore: cast_nullable_to_non_nullable
as String?,alternateContact1: freezed == alternateContact1 ? _self.alternateContact1 : alternateContact1 // ignore: cast_nullable_to_non_nullable
as String?,relation1: freezed == relation1 ? _self.relation1 : relation1 // ignore: cast_nullable_to_non_nullable
as String?,address1: freezed == address1 ? _self.address1 : address1 // ignore: cast_nullable_to_non_nullable
as String?,alternateContact2: freezed == alternateContact2 ? _self.alternateContact2 : alternateContact2 // ignore: cast_nullable_to_non_nullable
as String?,relation2: freezed == relation2 ? _self.relation2 : relation2 // ignore: cast_nullable_to_non_nullable
as String?,address2: freezed == address2 ? _self.address2 : address2 // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DriverModel].
extension DriverModelPatterns on DriverModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DriverModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DriverModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DriverModel value)  $default,){
final _that = this;
switch (_that) {
case _DriverModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DriverModel value)?  $default,){
final _that = this;
switch (_that) {
case _DriverModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String? name, @JsonKey(fromJson: _phoneFromJson)  String phone,  String? email,  String? gender,  String? image,  String? DLImage,  String? PANImage,  String? aadharImageFront,  String? aadharImageBack,  String? imageVerificationStatus,  String? profileVerificationStatus,  String? vehicleVerificationStatus,  String? isCompleteVerified,  String? verificationStatus,  DateTime? dateOfBirth,  bool? isProfileCompleted,  bool? startDuty,  bool? disable,  bool? isCancelledAnyOrder,  double? rating,  int? totalRating,  String? preference,  String? alternateContact1,  String? relation1,  String? address1,  String? alternateContact2,  String? relation2,  String? address2,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DriverModel() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.email,_that.gender,_that.image,_that.DLImage,_that.PANImage,_that.aadharImageFront,_that.aadharImageBack,_that.imageVerificationStatus,_that.profileVerificationStatus,_that.vehicleVerificationStatus,_that.isCompleteVerified,_that.verificationStatus,_that.dateOfBirth,_that.isProfileCompleted,_that.startDuty,_that.disable,_that.isCancelledAnyOrder,_that.rating,_that.totalRating,_that.preference,_that.alternateContact1,_that.relation1,_that.address1,_that.alternateContact2,_that.relation2,_that.address2,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String? name, @JsonKey(fromJson: _phoneFromJson)  String phone,  String? email,  String? gender,  String? image,  String? DLImage,  String? PANImage,  String? aadharImageFront,  String? aadharImageBack,  String? imageVerificationStatus,  String? profileVerificationStatus,  String? vehicleVerificationStatus,  String? isCompleteVerified,  String? verificationStatus,  DateTime? dateOfBirth,  bool? isProfileCompleted,  bool? startDuty,  bool? disable,  bool? isCancelledAnyOrder,  double? rating,  int? totalRating,  String? preference,  String? alternateContact1,  String? relation1,  String? address1,  String? alternateContact2,  String? relation2,  String? address2,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DriverModel():
return $default(_that.id,_that.name,_that.phone,_that.email,_that.gender,_that.image,_that.DLImage,_that.PANImage,_that.aadharImageFront,_that.aadharImageBack,_that.imageVerificationStatus,_that.profileVerificationStatus,_that.vehicleVerificationStatus,_that.isCompleteVerified,_that.verificationStatus,_that.dateOfBirth,_that.isProfileCompleted,_that.startDuty,_that.disable,_that.isCancelledAnyOrder,_that.rating,_that.totalRating,_that.preference,_that.alternateContact1,_that.relation1,_that.address1,_that.alternateContact2,_that.relation2,_that.address2,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String? name, @JsonKey(fromJson: _phoneFromJson)  String phone,  String? email,  String? gender,  String? image,  String? DLImage,  String? PANImage,  String? aadharImageFront,  String? aadharImageBack,  String? imageVerificationStatus,  String? profileVerificationStatus,  String? vehicleVerificationStatus,  String? isCompleteVerified,  String? verificationStatus,  DateTime? dateOfBirth,  bool? isProfileCompleted,  bool? startDuty,  bool? disable,  bool? isCancelledAnyOrder,  double? rating,  int? totalRating,  String? preference,  String? alternateContact1,  String? relation1,  String? address1,  String? alternateContact2,  String? relation2,  String? address2,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DriverModel() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.email,_that.gender,_that.image,_that.DLImage,_that.PANImage,_that.aadharImageFront,_that.aadharImageBack,_that.imageVerificationStatus,_that.profileVerificationStatus,_that.vehicleVerificationStatus,_that.isCompleteVerified,_that.verificationStatus,_that.dateOfBirth,_that.isProfileCompleted,_that.startDuty,_that.disable,_that.isCancelledAnyOrder,_that.rating,_that.totalRating,_that.preference,_that.alternateContact1,_that.relation1,_that.address1,_that.alternateContact2,_that.relation2,_that.address2,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DriverModel implements DriverModel {
  const _DriverModel({@JsonKey(name: '_id') required this.id, this.name, @JsonKey(fromJson: _phoneFromJson) required this.phone, this.email, this.gender, this.image, this.DLImage, this.PANImage, this.aadharImageFront, this.aadharImageBack, this.imageVerificationStatus, this.profileVerificationStatus, this.vehicleVerificationStatus, this.isCompleteVerified, this.verificationStatus, this.dateOfBirth, this.isProfileCompleted, this.startDuty, this.disable, this.isCancelledAnyOrder, this.rating, this.totalRating, this.preference, this.alternateContact1, this.relation1, this.address1, this.alternateContact2, this.relation2, this.address2, this.createdAt, this.updatedAt});
  factory _DriverModel.fromJson(Map<String, dynamic> json) => _$DriverModelFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String? name;
@override@JsonKey(fromJson: _phoneFromJson) final  String phone;
@override final  String? email;
@override final  String? gender;
@override final  String? image;
@override final  String? DLImage;
@override final  String? PANImage;
@override final  String? aadharImageFront;
@override final  String? aadharImageBack;
@override final  String? imageVerificationStatus;
@override final  String? profileVerificationStatus;
@override final  String? vehicleVerificationStatus;
@override final  String? isCompleteVerified;
@override final  String? verificationStatus;
@override final  DateTime? dateOfBirth;
@override final  bool? isProfileCompleted;
@override final  bool? startDuty;
@override final  bool? disable;
@override final  bool? isCancelledAnyOrder;
@override final  double? rating;
@override final  int? totalRating;
@override final  String? preference;
@override final  String? alternateContact1;
@override final  String? relation1;
@override final  String? address1;
@override final  String? alternateContact2;
@override final  String? relation2;
@override final  String? address2;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of DriverModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DriverModelCopyWith<_DriverModel> get copyWith => __$DriverModelCopyWithImpl<_DriverModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DriverModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DriverModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.image, image) || other.image == image)&&(identical(other.DLImage, DLImage) || other.DLImage == DLImage)&&(identical(other.PANImage, PANImage) || other.PANImage == PANImage)&&(identical(other.aadharImageFront, aadharImageFront) || other.aadharImageFront == aadharImageFront)&&(identical(other.aadharImageBack, aadharImageBack) || other.aadharImageBack == aadharImageBack)&&(identical(other.imageVerificationStatus, imageVerificationStatus) || other.imageVerificationStatus == imageVerificationStatus)&&(identical(other.profileVerificationStatus, profileVerificationStatus) || other.profileVerificationStatus == profileVerificationStatus)&&(identical(other.vehicleVerificationStatus, vehicleVerificationStatus) || other.vehicleVerificationStatus == vehicleVerificationStatus)&&(identical(other.isCompleteVerified, isCompleteVerified) || other.isCompleteVerified == isCompleteVerified)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.isProfileCompleted, isProfileCompleted) || other.isProfileCompleted == isProfileCompleted)&&(identical(other.startDuty, startDuty) || other.startDuty == startDuty)&&(identical(other.disable, disable) || other.disable == disable)&&(identical(other.isCancelledAnyOrder, isCancelledAnyOrder) || other.isCancelledAnyOrder == isCancelledAnyOrder)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.totalRating, totalRating) || other.totalRating == totalRating)&&(identical(other.preference, preference) || other.preference == preference)&&(identical(other.alternateContact1, alternateContact1) || other.alternateContact1 == alternateContact1)&&(identical(other.relation1, relation1) || other.relation1 == relation1)&&(identical(other.address1, address1) || other.address1 == address1)&&(identical(other.alternateContact2, alternateContact2) || other.alternateContact2 == alternateContact2)&&(identical(other.relation2, relation2) || other.relation2 == relation2)&&(identical(other.address2, address2) || other.address2 == address2)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,phone,email,gender,image,DLImage,PANImage,aadharImageFront,aadharImageBack,imageVerificationStatus,profileVerificationStatus,vehicleVerificationStatus,isCompleteVerified,verificationStatus,dateOfBirth,isProfileCompleted,startDuty,disable,isCancelledAnyOrder,rating,totalRating,preference,alternateContact1,relation1,address1,alternateContact2,relation2,address2,createdAt,updatedAt]);

@override
String toString() {
  return 'DriverModel(id: $id, name: $name, phone: $phone, email: $email, gender: $gender, image: $image, DLImage: $DLImage, PANImage: $PANImage, aadharImageFront: $aadharImageFront, aadharImageBack: $aadharImageBack, imageVerificationStatus: $imageVerificationStatus, profileVerificationStatus: $profileVerificationStatus, vehicleVerificationStatus: $vehicleVerificationStatus, isCompleteVerified: $isCompleteVerified, verificationStatus: $verificationStatus, dateOfBirth: $dateOfBirth, isProfileCompleted: $isProfileCompleted, startDuty: $startDuty, disable: $disable, isCancelledAnyOrder: $isCancelledAnyOrder, rating: $rating, totalRating: $totalRating, preference: $preference, alternateContact1: $alternateContact1, relation1: $relation1, address1: $address1, alternateContact2: $alternateContact2, relation2: $relation2, address2: $address2, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DriverModelCopyWith<$Res> implements $DriverModelCopyWith<$Res> {
  factory _$DriverModelCopyWith(_DriverModel value, $Res Function(_DriverModel) _then) = __$DriverModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String? name,@JsonKey(fromJson: _phoneFromJson) String phone, String? email, String? gender, String? image, String? DLImage, String? PANImage, String? aadharImageFront, String? aadharImageBack, String? imageVerificationStatus, String? profileVerificationStatus, String? vehicleVerificationStatus, String? isCompleteVerified, String? verificationStatus, DateTime? dateOfBirth, bool? isProfileCompleted, bool? startDuty, bool? disable, bool? isCancelledAnyOrder, double? rating, int? totalRating, String? preference, String? alternateContact1, String? relation1, String? address1, String? alternateContact2, String? relation2, String? address2, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$DriverModelCopyWithImpl<$Res>
    implements _$DriverModelCopyWith<$Res> {
  __$DriverModelCopyWithImpl(this._self, this._then);

  final _DriverModel _self;
  final $Res Function(_DriverModel) _then;

/// Create a copy of DriverModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? phone = null,Object? email = freezed,Object? gender = freezed,Object? image = freezed,Object? DLImage = freezed,Object? PANImage = freezed,Object? aadharImageFront = freezed,Object? aadharImageBack = freezed,Object? imageVerificationStatus = freezed,Object? profileVerificationStatus = freezed,Object? vehicleVerificationStatus = freezed,Object? isCompleteVerified = freezed,Object? verificationStatus = freezed,Object? dateOfBirth = freezed,Object? isProfileCompleted = freezed,Object? startDuty = freezed,Object? disable = freezed,Object? isCancelledAnyOrder = freezed,Object? rating = freezed,Object? totalRating = freezed,Object? preference = freezed,Object? alternateContact1 = freezed,Object? relation1 = freezed,Object? address1 = freezed,Object? alternateContact2 = freezed,Object? relation2 = freezed,Object? address2 = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_DriverModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,DLImage: freezed == DLImage ? _self.DLImage : DLImage // ignore: cast_nullable_to_non_nullable
as String?,PANImage: freezed == PANImage ? _self.PANImage : PANImage // ignore: cast_nullable_to_non_nullable
as String?,aadharImageFront: freezed == aadharImageFront ? _self.aadharImageFront : aadharImageFront // ignore: cast_nullable_to_non_nullable
as String?,aadharImageBack: freezed == aadharImageBack ? _self.aadharImageBack : aadharImageBack // ignore: cast_nullable_to_non_nullable
as String?,imageVerificationStatus: freezed == imageVerificationStatus ? _self.imageVerificationStatus : imageVerificationStatus // ignore: cast_nullable_to_non_nullable
as String?,profileVerificationStatus: freezed == profileVerificationStatus ? _self.profileVerificationStatus : profileVerificationStatus // ignore: cast_nullable_to_non_nullable
as String?,vehicleVerificationStatus: freezed == vehicleVerificationStatus ? _self.vehicleVerificationStatus : vehicleVerificationStatus // ignore: cast_nullable_to_non_nullable
as String?,isCompleteVerified: freezed == isCompleteVerified ? _self.isCompleteVerified : isCompleteVerified // ignore: cast_nullable_to_non_nullable
as String?,verificationStatus: freezed == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,isProfileCompleted: freezed == isProfileCompleted ? _self.isProfileCompleted : isProfileCompleted // ignore: cast_nullable_to_non_nullable
as bool?,startDuty: freezed == startDuty ? _self.startDuty : startDuty // ignore: cast_nullable_to_non_nullable
as bool?,disable: freezed == disable ? _self.disable : disable // ignore: cast_nullable_to_non_nullable
as bool?,isCancelledAnyOrder: freezed == isCancelledAnyOrder ? _self.isCancelledAnyOrder : isCancelledAnyOrder // ignore: cast_nullable_to_non_nullable
as bool?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,totalRating: freezed == totalRating ? _self.totalRating : totalRating // ignore: cast_nullable_to_non_nullable
as int?,preference: freezed == preference ? _self.preference : preference // ignore: cast_nullable_to_non_nullable
as String?,alternateContact1: freezed == alternateContact1 ? _self.alternateContact1 : alternateContact1 // ignore: cast_nullable_to_non_nullable
as String?,relation1: freezed == relation1 ? _self.relation1 : relation1 // ignore: cast_nullable_to_non_nullable
as String?,address1: freezed == address1 ? _self.address1 : address1 // ignore: cast_nullable_to_non_nullable
as String?,alternateContact2: freezed == alternateContact2 ? _self.alternateContact2 : alternateContact2 // ignore: cast_nullable_to_non_nullable
as String?,relation2: freezed == relation2 ? _self.relation2 : relation2 // ignore: cast_nullable_to_non_nullable
as String?,address2: freezed == address2 ? _self.address2 : address2 // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
