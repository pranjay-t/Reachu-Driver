// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_registration_status_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgressInfo {

 int? get completed; int? get total; double? get percentage;
/// Create a copy of ProgressInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressInfoCopyWith<ProgressInfo> get copyWith => _$ProgressInfoCopyWithImpl<ProgressInfo>(this as ProgressInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressInfo&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.total, total) || other.total == total)&&(identical(other.percentage, percentage) || other.percentage == percentage));
}


@override
int get hashCode => Object.hash(runtimeType,completed,total,percentage);

@override
String toString() {
  return 'ProgressInfo(completed: $completed, total: $total, percentage: $percentage)';
}


}

/// @nodoc
abstract mixin class $ProgressInfoCopyWith<$Res>  {
  factory $ProgressInfoCopyWith(ProgressInfo value, $Res Function(ProgressInfo) _then) = _$ProgressInfoCopyWithImpl;
@useResult
$Res call({
 int? completed, int? total, double? percentage
});




}
/// @nodoc
class _$ProgressInfoCopyWithImpl<$Res>
    implements $ProgressInfoCopyWith<$Res> {
  _$ProgressInfoCopyWithImpl(this._self, this._then);

  final ProgressInfo _self;
  final $Res Function(ProgressInfo) _then;

/// Create a copy of ProgressInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? completed = freezed,Object? total = freezed,Object? percentage = freezed,}) {
  return _then(_self.copyWith(
completed: freezed == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,percentage: freezed == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgressInfo].
extension ProgressInfoPatterns on ProgressInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgressInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgressInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgressInfo value)  $default,){
final _that = this;
switch (_that) {
case _ProgressInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgressInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ProgressInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? completed,  int? total,  double? percentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgressInfo() when $default != null:
return $default(_that.completed,_that.total,_that.percentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? completed,  int? total,  double? percentage)  $default,) {final _that = this;
switch (_that) {
case _ProgressInfo():
return $default(_that.completed,_that.total,_that.percentage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? completed,  int? total,  double? percentage)?  $default,) {final _that = this;
switch (_that) {
case _ProgressInfo() when $default != null:
return $default(_that.completed,_that.total,_that.percentage);case _:
  return null;

}
}

}

/// @nodoc


class _ProgressInfo implements ProgressInfo {
  const _ProgressInfo({this.completed, this.total, this.percentage});
  

@override final  int? completed;
@override final  int? total;
@override final  double? percentage;

/// Create a copy of ProgressInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressInfoCopyWith<_ProgressInfo> get copyWith => __$ProgressInfoCopyWithImpl<_ProgressInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgressInfo&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.total, total) || other.total == total)&&(identical(other.percentage, percentage) || other.percentage == percentage));
}


@override
int get hashCode => Object.hash(runtimeType,completed,total,percentage);

@override
String toString() {
  return 'ProgressInfo(completed: $completed, total: $total, percentage: $percentage)';
}


}

/// @nodoc
abstract mixin class _$ProgressInfoCopyWith<$Res> implements $ProgressInfoCopyWith<$Res> {
  factory _$ProgressInfoCopyWith(_ProgressInfo value, $Res Function(_ProgressInfo) _then) = __$ProgressInfoCopyWithImpl;
@override @useResult
$Res call({
 int? completed, int? total, double? percentage
});




}
/// @nodoc
class __$ProgressInfoCopyWithImpl<$Res>
    implements _$ProgressInfoCopyWith<$Res> {
  __$ProgressInfoCopyWithImpl(this._self, this._then);

  final _ProgressInfo _self;
  final $Res Function(_ProgressInfo) _then;

/// Create a copy of ProgressInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? completed = freezed,Object? total = freezed,Object? percentage = freezed,}) {
  return _then(_ProgressInfo(
completed: freezed == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,percentage: freezed == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc
mixin _$ActionRequiredItem {

 String get stepId; String get documentKey; String? get rejectionReason;
/// Create a copy of ActionRequiredItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActionRequiredItemCopyWith<ActionRequiredItem> get copyWith => _$ActionRequiredItemCopyWithImpl<ActionRequiredItem>(this as ActionRequiredItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionRequiredItem&&(identical(other.stepId, stepId) || other.stepId == stepId)&&(identical(other.documentKey, documentKey) || other.documentKey == documentKey)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason));
}


@override
int get hashCode => Object.hash(runtimeType,stepId,documentKey,rejectionReason);

@override
String toString() {
  return 'ActionRequiredItem(stepId: $stepId, documentKey: $documentKey, rejectionReason: $rejectionReason)';
}


}

/// @nodoc
abstract mixin class $ActionRequiredItemCopyWith<$Res>  {
  factory $ActionRequiredItemCopyWith(ActionRequiredItem value, $Res Function(ActionRequiredItem) _then) = _$ActionRequiredItemCopyWithImpl;
@useResult
$Res call({
 String stepId, String documentKey, String? rejectionReason
});




}
/// @nodoc
class _$ActionRequiredItemCopyWithImpl<$Res>
    implements $ActionRequiredItemCopyWith<$Res> {
  _$ActionRequiredItemCopyWithImpl(this._self, this._then);

  final ActionRequiredItem _self;
  final $Res Function(ActionRequiredItem) _then;

/// Create a copy of ActionRequiredItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stepId = null,Object? documentKey = null,Object? rejectionReason = freezed,}) {
  return _then(_self.copyWith(
stepId: null == stepId ? _self.stepId : stepId // ignore: cast_nullable_to_non_nullable
as String,documentKey: null == documentKey ? _self.documentKey : documentKey // ignore: cast_nullable_to_non_nullable
as String,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ActionRequiredItem].
extension ActionRequiredItemPatterns on ActionRequiredItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActionRequiredItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActionRequiredItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActionRequiredItem value)  $default,){
final _that = this;
switch (_that) {
case _ActionRequiredItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActionRequiredItem value)?  $default,){
final _that = this;
switch (_that) {
case _ActionRequiredItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String stepId,  String documentKey,  String? rejectionReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActionRequiredItem() when $default != null:
return $default(_that.stepId,_that.documentKey,_that.rejectionReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String stepId,  String documentKey,  String? rejectionReason)  $default,) {final _that = this;
switch (_that) {
case _ActionRequiredItem():
return $default(_that.stepId,_that.documentKey,_that.rejectionReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String stepId,  String documentKey,  String? rejectionReason)?  $default,) {final _that = this;
switch (_that) {
case _ActionRequiredItem() when $default != null:
return $default(_that.stepId,_that.documentKey,_that.rejectionReason);case _:
  return null;

}
}

}

/// @nodoc


class _ActionRequiredItem implements ActionRequiredItem {
  const _ActionRequiredItem({required this.stepId, required this.documentKey, this.rejectionReason});
  

@override final  String stepId;
@override final  String documentKey;
@override final  String? rejectionReason;

/// Create a copy of ActionRequiredItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActionRequiredItemCopyWith<_ActionRequiredItem> get copyWith => __$ActionRequiredItemCopyWithImpl<_ActionRequiredItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActionRequiredItem&&(identical(other.stepId, stepId) || other.stepId == stepId)&&(identical(other.documentKey, documentKey) || other.documentKey == documentKey)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason));
}


@override
int get hashCode => Object.hash(runtimeType,stepId,documentKey,rejectionReason);

@override
String toString() {
  return 'ActionRequiredItem(stepId: $stepId, documentKey: $documentKey, rejectionReason: $rejectionReason)';
}


}

/// @nodoc
abstract mixin class _$ActionRequiredItemCopyWith<$Res> implements $ActionRequiredItemCopyWith<$Res> {
  factory _$ActionRequiredItemCopyWith(_ActionRequiredItem value, $Res Function(_ActionRequiredItem) _then) = __$ActionRequiredItemCopyWithImpl;
@override @useResult
$Res call({
 String stepId, String documentKey, String? rejectionReason
});




}
/// @nodoc
class __$ActionRequiredItemCopyWithImpl<$Res>
    implements _$ActionRequiredItemCopyWith<$Res> {
  __$ActionRequiredItemCopyWithImpl(this._self, this._then);

  final _ActionRequiredItem _self;
  final $Res Function(_ActionRequiredItem) _then;

/// Create a copy of ActionRequiredItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stepId = null,Object? documentKey = null,Object? rejectionReason = freezed,}) {
  return _then(_ActionRequiredItem(
stepId: null == stepId ? _self.stepId : stepId // ignore: cast_nullable_to_non_nullable
as String,documentKey: null == documentKey ? _self.documentKey : documentKey // ignore: cast_nullable_to_non_nullable
as String,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$DocumentDetail {

 String? get fileKey; String get status; String? get rejectionReason; String? get rejectedAt; String? get submittedAt; String? get verifiedAt; int? get resubmissionCount;
/// Create a copy of DocumentDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentDetailCopyWith<DocumentDetail> get copyWith => _$DocumentDetailCopyWithImpl<DocumentDetail>(this as DocumentDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentDetail&&(identical(other.fileKey, fileKey) || other.fileKey == fileKey)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.rejectedAt, rejectedAt) || other.rejectedAt == rejectedAt)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt)&&(identical(other.resubmissionCount, resubmissionCount) || other.resubmissionCount == resubmissionCount));
}


@override
int get hashCode => Object.hash(runtimeType,fileKey,status,rejectionReason,rejectedAt,submittedAt,verifiedAt,resubmissionCount);

@override
String toString() {
  return 'DocumentDetail(fileKey: $fileKey, status: $status, rejectionReason: $rejectionReason, rejectedAt: $rejectedAt, submittedAt: $submittedAt, verifiedAt: $verifiedAt, resubmissionCount: $resubmissionCount)';
}


}

/// @nodoc
abstract mixin class $DocumentDetailCopyWith<$Res>  {
  factory $DocumentDetailCopyWith(DocumentDetail value, $Res Function(DocumentDetail) _then) = _$DocumentDetailCopyWithImpl;
@useResult
$Res call({
 String? fileKey, String status, String? rejectionReason, String? rejectedAt, String? submittedAt, String? verifiedAt, int? resubmissionCount
});




}
/// @nodoc
class _$DocumentDetailCopyWithImpl<$Res>
    implements $DocumentDetailCopyWith<$Res> {
  _$DocumentDetailCopyWithImpl(this._self, this._then);

  final DocumentDetail _self;
  final $Res Function(DocumentDetail) _then;

/// Create a copy of DocumentDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileKey = freezed,Object? status = null,Object? rejectionReason = freezed,Object? rejectedAt = freezed,Object? submittedAt = freezed,Object? verifiedAt = freezed,Object? resubmissionCount = freezed,}) {
  return _then(_self.copyWith(
fileKey: freezed == fileKey ? _self.fileKey : fileKey // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,rejectedAt: freezed == rejectedAt ? _self.rejectedAt : rejectedAt // ignore: cast_nullable_to_non_nullable
as String?,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as String?,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as String?,resubmissionCount: freezed == resubmissionCount ? _self.resubmissionCount : resubmissionCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [DocumentDetail].
extension DocumentDetailPatterns on DocumentDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentDetail value)  $default,){
final _that = this;
switch (_that) {
case _DocumentDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentDetail value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? fileKey,  String status,  String? rejectionReason,  String? rejectedAt,  String? submittedAt,  String? verifiedAt,  int? resubmissionCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentDetail() when $default != null:
return $default(_that.fileKey,_that.status,_that.rejectionReason,_that.rejectedAt,_that.submittedAt,_that.verifiedAt,_that.resubmissionCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? fileKey,  String status,  String? rejectionReason,  String? rejectedAt,  String? submittedAt,  String? verifiedAt,  int? resubmissionCount)  $default,) {final _that = this;
switch (_that) {
case _DocumentDetail():
return $default(_that.fileKey,_that.status,_that.rejectionReason,_that.rejectedAt,_that.submittedAt,_that.verifiedAt,_that.resubmissionCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? fileKey,  String status,  String? rejectionReason,  String? rejectedAt,  String? submittedAt,  String? verifiedAt,  int? resubmissionCount)?  $default,) {final _that = this;
switch (_that) {
case _DocumentDetail() when $default != null:
return $default(_that.fileKey,_that.status,_that.rejectionReason,_that.rejectedAt,_that.submittedAt,_that.verifiedAt,_that.resubmissionCount);case _:
  return null;

}
}

}

/// @nodoc


class _DocumentDetail implements DocumentDetail {
  const _DocumentDetail({this.fileKey, required this.status, this.rejectionReason, this.rejectedAt, this.submittedAt, this.verifiedAt, this.resubmissionCount});
  

@override final  String? fileKey;
@override final  String status;
@override final  String? rejectionReason;
@override final  String? rejectedAt;
@override final  String? submittedAt;
@override final  String? verifiedAt;
@override final  int? resubmissionCount;

/// Create a copy of DocumentDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentDetailCopyWith<_DocumentDetail> get copyWith => __$DocumentDetailCopyWithImpl<_DocumentDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentDetail&&(identical(other.fileKey, fileKey) || other.fileKey == fileKey)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.rejectedAt, rejectedAt) || other.rejectedAt == rejectedAt)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt)&&(identical(other.resubmissionCount, resubmissionCount) || other.resubmissionCount == resubmissionCount));
}


@override
int get hashCode => Object.hash(runtimeType,fileKey,status,rejectionReason,rejectedAt,submittedAt,verifiedAt,resubmissionCount);

@override
String toString() {
  return 'DocumentDetail(fileKey: $fileKey, status: $status, rejectionReason: $rejectionReason, rejectedAt: $rejectedAt, submittedAt: $submittedAt, verifiedAt: $verifiedAt, resubmissionCount: $resubmissionCount)';
}


}

/// @nodoc
abstract mixin class _$DocumentDetailCopyWith<$Res> implements $DocumentDetailCopyWith<$Res> {
  factory _$DocumentDetailCopyWith(_DocumentDetail value, $Res Function(_DocumentDetail) _then) = __$DocumentDetailCopyWithImpl;
@override @useResult
$Res call({
 String? fileKey, String status, String? rejectionReason, String? rejectedAt, String? submittedAt, String? verifiedAt, int? resubmissionCount
});




}
/// @nodoc
class __$DocumentDetailCopyWithImpl<$Res>
    implements _$DocumentDetailCopyWith<$Res> {
  __$DocumentDetailCopyWithImpl(this._self, this._then);

  final _DocumentDetail _self;
  final $Res Function(_DocumentDetail) _then;

/// Create a copy of DocumentDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileKey = freezed,Object? status = null,Object? rejectionReason = freezed,Object? rejectedAt = freezed,Object? submittedAt = freezed,Object? verifiedAt = freezed,Object? resubmissionCount = freezed,}) {
  return _then(_DocumentDetail(
fileKey: freezed == fileKey ? _self.fileKey : fileKey // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,rejectedAt: freezed == rejectedAt ? _self.rejectedAt : rejectedAt // ignore: cast_nullable_to_non_nullable
as String?,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as String?,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as String?,resubmissionCount: freezed == resubmissionCount ? _self.resubmissionCount : resubmissionCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$StepDetail {

 String get status; bool get unlocked; String? get submittedAt; String? get verifiedAt; String? get rejectionReason; Map<String, bool>? get fieldCompletion; Map<String, DocumentDetail>? get documents;
/// Create a copy of StepDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StepDetailCopyWith<StepDetail> get copyWith => _$StepDetailCopyWithImpl<StepDetail>(this as StepDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StepDetail&&(identical(other.status, status) || other.status == status)&&(identical(other.unlocked, unlocked) || other.unlocked == unlocked)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&const DeepCollectionEquality().equals(other.fieldCompletion, fieldCompletion)&&const DeepCollectionEquality().equals(other.documents, documents));
}


@override
int get hashCode => Object.hash(runtimeType,status,unlocked,submittedAt,verifiedAt,rejectionReason,const DeepCollectionEquality().hash(fieldCompletion),const DeepCollectionEquality().hash(documents));

@override
String toString() {
  return 'StepDetail(status: $status, unlocked: $unlocked, submittedAt: $submittedAt, verifiedAt: $verifiedAt, rejectionReason: $rejectionReason, fieldCompletion: $fieldCompletion, documents: $documents)';
}


}

/// @nodoc
abstract mixin class $StepDetailCopyWith<$Res>  {
  factory $StepDetailCopyWith(StepDetail value, $Res Function(StepDetail) _then) = _$StepDetailCopyWithImpl;
@useResult
$Res call({
 String status, bool unlocked, String? submittedAt, String? verifiedAt, String? rejectionReason, Map<String, bool>? fieldCompletion, Map<String, DocumentDetail>? documents
});




}
/// @nodoc
class _$StepDetailCopyWithImpl<$Res>
    implements $StepDetailCopyWith<$Res> {
  _$StepDetailCopyWithImpl(this._self, this._then);

  final StepDetail _self;
  final $Res Function(StepDetail) _then;

/// Create a copy of StepDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? unlocked = null,Object? submittedAt = freezed,Object? verifiedAt = freezed,Object? rejectionReason = freezed,Object? fieldCompletion = freezed,Object? documents = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,unlocked: null == unlocked ? _self.unlocked : unlocked // ignore: cast_nullable_to_non_nullable
as bool,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as String?,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as String?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,fieldCompletion: freezed == fieldCompletion ? _self.fieldCompletion : fieldCompletion // ignore: cast_nullable_to_non_nullable
as Map<String, bool>?,documents: freezed == documents ? _self.documents : documents // ignore: cast_nullable_to_non_nullable
as Map<String, DocumentDetail>?,
  ));
}

}


/// Adds pattern-matching-related methods to [StepDetail].
extension StepDetailPatterns on StepDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StepDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StepDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StepDetail value)  $default,){
final _that = this;
switch (_that) {
case _StepDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StepDetail value)?  $default,){
final _that = this;
switch (_that) {
case _StepDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  bool unlocked,  String? submittedAt,  String? verifiedAt,  String? rejectionReason,  Map<String, bool>? fieldCompletion,  Map<String, DocumentDetail>? documents)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StepDetail() when $default != null:
return $default(_that.status,_that.unlocked,_that.submittedAt,_that.verifiedAt,_that.rejectionReason,_that.fieldCompletion,_that.documents);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  bool unlocked,  String? submittedAt,  String? verifiedAt,  String? rejectionReason,  Map<String, bool>? fieldCompletion,  Map<String, DocumentDetail>? documents)  $default,) {final _that = this;
switch (_that) {
case _StepDetail():
return $default(_that.status,_that.unlocked,_that.submittedAt,_that.verifiedAt,_that.rejectionReason,_that.fieldCompletion,_that.documents);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  bool unlocked,  String? submittedAt,  String? verifiedAt,  String? rejectionReason,  Map<String, bool>? fieldCompletion,  Map<String, DocumentDetail>? documents)?  $default,) {final _that = this;
switch (_that) {
case _StepDetail() when $default != null:
return $default(_that.status,_that.unlocked,_that.submittedAt,_that.verifiedAt,_that.rejectionReason,_that.fieldCompletion,_that.documents);case _:
  return null;

}
}

}

/// @nodoc


class _StepDetail implements StepDetail {
  const _StepDetail({required this.status, required this.unlocked, this.submittedAt, this.verifiedAt, this.rejectionReason, final  Map<String, bool>? fieldCompletion, final  Map<String, DocumentDetail>? documents}): _fieldCompletion = fieldCompletion,_documents = documents;
  

@override final  String status;
@override final  bool unlocked;
@override final  String? submittedAt;
@override final  String? verifiedAt;
@override final  String? rejectionReason;
 final  Map<String, bool>? _fieldCompletion;
@override Map<String, bool>? get fieldCompletion {
  final value = _fieldCompletion;
  if (value == null) return null;
  if (_fieldCompletion is EqualUnmodifiableMapView) return _fieldCompletion;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, DocumentDetail>? _documents;
@override Map<String, DocumentDetail>? get documents {
  final value = _documents;
  if (value == null) return null;
  if (_documents is EqualUnmodifiableMapView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of StepDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StepDetailCopyWith<_StepDetail> get copyWith => __$StepDetailCopyWithImpl<_StepDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StepDetail&&(identical(other.status, status) || other.status == status)&&(identical(other.unlocked, unlocked) || other.unlocked == unlocked)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&const DeepCollectionEquality().equals(other._fieldCompletion, _fieldCompletion)&&const DeepCollectionEquality().equals(other._documents, _documents));
}


@override
int get hashCode => Object.hash(runtimeType,status,unlocked,submittedAt,verifiedAt,rejectionReason,const DeepCollectionEquality().hash(_fieldCompletion),const DeepCollectionEquality().hash(_documents));

@override
String toString() {
  return 'StepDetail(status: $status, unlocked: $unlocked, submittedAt: $submittedAt, verifiedAt: $verifiedAt, rejectionReason: $rejectionReason, fieldCompletion: $fieldCompletion, documents: $documents)';
}


}

/// @nodoc
abstract mixin class _$StepDetailCopyWith<$Res> implements $StepDetailCopyWith<$Res> {
  factory _$StepDetailCopyWith(_StepDetail value, $Res Function(_StepDetail) _then) = __$StepDetailCopyWithImpl;
@override @useResult
$Res call({
 String status, bool unlocked, String? submittedAt, String? verifiedAt, String? rejectionReason, Map<String, bool>? fieldCompletion, Map<String, DocumentDetail>? documents
});




}
/// @nodoc
class __$StepDetailCopyWithImpl<$Res>
    implements _$StepDetailCopyWith<$Res> {
  __$StepDetailCopyWithImpl(this._self, this._then);

  final _StepDetail _self;
  final $Res Function(_StepDetail) _then;

/// Create a copy of StepDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? unlocked = null,Object? submittedAt = freezed,Object? verifiedAt = freezed,Object? rejectionReason = freezed,Object? fieldCompletion = freezed,Object? documents = freezed,}) {
  return _then(_StepDetail(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,unlocked: null == unlocked ? _self.unlocked : unlocked // ignore: cast_nullable_to_non_nullable
as bool,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as String?,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as String?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,fieldCompletion: freezed == fieldCompletion ? _self._fieldCompletion : fieldCompletion // ignore: cast_nullable_to_non_nullable
as Map<String, bool>?,documents: freezed == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as Map<String, DocumentDetail>?,
  ));
}


}

/// @nodoc
mixin _$UiStepGroup {

 String get label; String get status; bool get unlocked; bool get optional; List<String> get stepIds; Map<String, StepDetail>? get steps;
/// Create a copy of UiStepGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UiStepGroupCopyWith<UiStepGroup> get copyWith => _$UiStepGroupCopyWithImpl<UiStepGroup>(this as UiStepGroup, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UiStepGroup&&(identical(other.label, label) || other.label == label)&&(identical(other.status, status) || other.status == status)&&(identical(other.unlocked, unlocked) || other.unlocked == unlocked)&&(identical(other.optional, optional) || other.optional == optional)&&const DeepCollectionEquality().equals(other.stepIds, stepIds)&&const DeepCollectionEquality().equals(other.steps, steps));
}


@override
int get hashCode => Object.hash(runtimeType,label,status,unlocked,optional,const DeepCollectionEquality().hash(stepIds),const DeepCollectionEquality().hash(steps));

@override
String toString() {
  return 'UiStepGroup(label: $label, status: $status, unlocked: $unlocked, optional: $optional, stepIds: $stepIds, steps: $steps)';
}


}

/// @nodoc
abstract mixin class $UiStepGroupCopyWith<$Res>  {
  factory $UiStepGroupCopyWith(UiStepGroup value, $Res Function(UiStepGroup) _then) = _$UiStepGroupCopyWithImpl;
@useResult
$Res call({
 String label, String status, bool unlocked, bool optional, List<String> stepIds, Map<String, StepDetail>? steps
});




}
/// @nodoc
class _$UiStepGroupCopyWithImpl<$Res>
    implements $UiStepGroupCopyWith<$Res> {
  _$UiStepGroupCopyWithImpl(this._self, this._then);

  final UiStepGroup _self;
  final $Res Function(UiStepGroup) _then;

/// Create a copy of UiStepGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? status = null,Object? unlocked = null,Object? optional = null,Object? stepIds = null,Object? steps = freezed,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,unlocked: null == unlocked ? _self.unlocked : unlocked // ignore: cast_nullable_to_non_nullable
as bool,optional: null == optional ? _self.optional : optional // ignore: cast_nullable_to_non_nullable
as bool,stepIds: null == stepIds ? _self.stepIds : stepIds // ignore: cast_nullable_to_non_nullable
as List<String>,steps: freezed == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as Map<String, StepDetail>?,
  ));
}

}


/// Adds pattern-matching-related methods to [UiStepGroup].
extension UiStepGroupPatterns on UiStepGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UiStepGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UiStepGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UiStepGroup value)  $default,){
final _that = this;
switch (_that) {
case _UiStepGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UiStepGroup value)?  $default,){
final _that = this;
switch (_that) {
case _UiStepGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String status,  bool unlocked,  bool optional,  List<String> stepIds,  Map<String, StepDetail>? steps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UiStepGroup() when $default != null:
return $default(_that.label,_that.status,_that.unlocked,_that.optional,_that.stepIds,_that.steps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String status,  bool unlocked,  bool optional,  List<String> stepIds,  Map<String, StepDetail>? steps)  $default,) {final _that = this;
switch (_that) {
case _UiStepGroup():
return $default(_that.label,_that.status,_that.unlocked,_that.optional,_that.stepIds,_that.steps);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String status,  bool unlocked,  bool optional,  List<String> stepIds,  Map<String, StepDetail>? steps)?  $default,) {final _that = this;
switch (_that) {
case _UiStepGroup() when $default != null:
return $default(_that.label,_that.status,_that.unlocked,_that.optional,_that.stepIds,_that.steps);case _:
  return null;

}
}

}

/// @nodoc


class _UiStepGroup implements UiStepGroup {
  const _UiStepGroup({required this.label, required this.status, required this.unlocked, required this.optional, required final  List<String> stepIds, final  Map<String, StepDetail>? steps}): _stepIds = stepIds,_steps = steps;
  

@override final  String label;
@override final  String status;
@override final  bool unlocked;
@override final  bool optional;
 final  List<String> _stepIds;
@override List<String> get stepIds {
  if (_stepIds is EqualUnmodifiableListView) return _stepIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stepIds);
}

 final  Map<String, StepDetail>? _steps;
@override Map<String, StepDetail>? get steps {
  final value = _steps;
  if (value == null) return null;
  if (_steps is EqualUnmodifiableMapView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of UiStepGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UiStepGroupCopyWith<_UiStepGroup> get copyWith => __$UiStepGroupCopyWithImpl<_UiStepGroup>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UiStepGroup&&(identical(other.label, label) || other.label == label)&&(identical(other.status, status) || other.status == status)&&(identical(other.unlocked, unlocked) || other.unlocked == unlocked)&&(identical(other.optional, optional) || other.optional == optional)&&const DeepCollectionEquality().equals(other._stepIds, _stepIds)&&const DeepCollectionEquality().equals(other._steps, _steps));
}


@override
int get hashCode => Object.hash(runtimeType,label,status,unlocked,optional,const DeepCollectionEquality().hash(_stepIds),const DeepCollectionEquality().hash(_steps));

@override
String toString() {
  return 'UiStepGroup(label: $label, status: $status, unlocked: $unlocked, optional: $optional, stepIds: $stepIds, steps: $steps)';
}


}

/// @nodoc
abstract mixin class _$UiStepGroupCopyWith<$Res> implements $UiStepGroupCopyWith<$Res> {
  factory _$UiStepGroupCopyWith(_UiStepGroup value, $Res Function(_UiStepGroup) _then) = __$UiStepGroupCopyWithImpl;
@override @useResult
$Res call({
 String label, String status, bool unlocked, bool optional, List<String> stepIds, Map<String, StepDetail>? steps
});




}
/// @nodoc
class __$UiStepGroupCopyWithImpl<$Res>
    implements _$UiStepGroupCopyWith<$Res> {
  __$UiStepGroupCopyWithImpl(this._self, this._then);

  final _UiStepGroup _self;
  final $Res Function(_UiStepGroup) _then;

/// Create a copy of UiStepGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? status = null,Object? unlocked = null,Object? optional = null,Object? stepIds = null,Object? steps = freezed,}) {
  return _then(_UiStepGroup(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,unlocked: null == unlocked ? _self.unlocked : unlocked // ignore: cast_nullable_to_non_nullable
as bool,optional: null == optional ? _self.optional : optional // ignore: cast_nullable_to_non_nullable
as bool,stepIds: null == stepIds ? _self._stepIds : stepIds // ignore: cast_nullable_to_non_nullable
as List<String>,steps: freezed == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as Map<String, StepDetail>?,
  ));
}


}

/// @nodoc
mixin _$PersonalInfoData {

 String? get name; String? get email; String? get dateOfBirth; String? get gender;
/// Create a copy of PersonalInfoData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonalInfoDataCopyWith<PersonalInfoData> get copyWith => _$PersonalInfoDataCopyWithImpl<PersonalInfoData>(this as PersonalInfoData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonalInfoData&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender));
}


@override
int get hashCode => Object.hash(runtimeType,name,email,dateOfBirth,gender);

@override
String toString() {
  return 'PersonalInfoData(name: $name, email: $email, dateOfBirth: $dateOfBirth, gender: $gender)';
}


}

/// @nodoc
abstract mixin class $PersonalInfoDataCopyWith<$Res>  {
  factory $PersonalInfoDataCopyWith(PersonalInfoData value, $Res Function(PersonalInfoData) _then) = _$PersonalInfoDataCopyWithImpl;
@useResult
$Res call({
 String? name, String? email, String? dateOfBirth, String? gender
});




}
/// @nodoc
class _$PersonalInfoDataCopyWithImpl<$Res>
    implements $PersonalInfoDataCopyWith<$Res> {
  _$PersonalInfoDataCopyWithImpl(this._self, this._then);

  final PersonalInfoData _self;
  final $Res Function(PersonalInfoData) _then;

/// Create a copy of PersonalInfoData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? email = freezed,Object? dateOfBirth = freezed,Object? gender = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PersonalInfoData].
extension PersonalInfoDataPatterns on PersonalInfoData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonalInfoData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonalInfoData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonalInfoData value)  $default,){
final _that = this;
switch (_that) {
case _PersonalInfoData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonalInfoData value)?  $default,){
final _that = this;
switch (_that) {
case _PersonalInfoData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? email,  String? dateOfBirth,  String? gender)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonalInfoData() when $default != null:
return $default(_that.name,_that.email,_that.dateOfBirth,_that.gender);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? email,  String? dateOfBirth,  String? gender)  $default,) {final _that = this;
switch (_that) {
case _PersonalInfoData():
return $default(_that.name,_that.email,_that.dateOfBirth,_that.gender);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? email,  String? dateOfBirth,  String? gender)?  $default,) {final _that = this;
switch (_that) {
case _PersonalInfoData() when $default != null:
return $default(_that.name,_that.email,_that.dateOfBirth,_that.gender);case _:
  return null;

}
}

}

/// @nodoc


class _PersonalInfoData implements PersonalInfoData {
  const _PersonalInfoData({this.name, this.email, this.dateOfBirth, this.gender});
  

@override final  String? name;
@override final  String? email;
@override final  String? dateOfBirth;
@override final  String? gender;

/// Create a copy of PersonalInfoData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonalInfoDataCopyWith<_PersonalInfoData> get copyWith => __$PersonalInfoDataCopyWithImpl<_PersonalInfoData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonalInfoData&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender));
}


@override
int get hashCode => Object.hash(runtimeType,name,email,dateOfBirth,gender);

@override
String toString() {
  return 'PersonalInfoData(name: $name, email: $email, dateOfBirth: $dateOfBirth, gender: $gender)';
}


}

/// @nodoc
abstract mixin class _$PersonalInfoDataCopyWith<$Res> implements $PersonalInfoDataCopyWith<$Res> {
  factory _$PersonalInfoDataCopyWith(_PersonalInfoData value, $Res Function(_PersonalInfoData) _then) = __$PersonalInfoDataCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? email, String? dateOfBirth, String? gender
});




}
/// @nodoc
class __$PersonalInfoDataCopyWithImpl<$Res>
    implements _$PersonalInfoDataCopyWith<$Res> {
  __$PersonalInfoDataCopyWithImpl(this._self, this._then);

  final _PersonalInfoData _self;
  final $Res Function(_PersonalInfoData) _then;

/// Create a copy of PersonalInfoData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? email = freezed,Object? dateOfBirth = freezed,Object? gender = freezed,}) {
  return _then(_PersonalInfoData(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$VehicleInfoData {

 String? get vehicleName; String? get vehicleNumber; String? get vehicleColor; String? get vehicleModel; String? get vehicleYear; String? get vehicleCapacity; String? get vehicleType; String? get vehicleSubType;
/// Create a copy of VehicleInfoData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleInfoDataCopyWith<VehicleInfoData> get copyWith => _$VehicleInfoDataCopyWithImpl<VehicleInfoData>(this as VehicleInfoData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleInfoData&&(identical(other.vehicleName, vehicleName) || other.vehicleName == vehicleName)&&(identical(other.vehicleNumber, vehicleNumber) || other.vehicleNumber == vehicleNumber)&&(identical(other.vehicleColor, vehicleColor) || other.vehicleColor == vehicleColor)&&(identical(other.vehicleModel, vehicleModel) || other.vehicleModel == vehicleModel)&&(identical(other.vehicleYear, vehicleYear) || other.vehicleYear == vehicleYear)&&(identical(other.vehicleCapacity, vehicleCapacity) || other.vehicleCapacity == vehicleCapacity)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.vehicleSubType, vehicleSubType) || other.vehicleSubType == vehicleSubType));
}


@override
int get hashCode => Object.hash(runtimeType,vehicleName,vehicleNumber,vehicleColor,vehicleModel,vehicleYear,vehicleCapacity,vehicleType,vehicleSubType);

@override
String toString() {
  return 'VehicleInfoData(vehicleName: $vehicleName, vehicleNumber: $vehicleNumber, vehicleColor: $vehicleColor, vehicleModel: $vehicleModel, vehicleYear: $vehicleYear, vehicleCapacity: $vehicleCapacity, vehicleType: $vehicleType, vehicleSubType: $vehicleSubType)';
}


}

/// @nodoc
abstract mixin class $VehicleInfoDataCopyWith<$Res>  {
  factory $VehicleInfoDataCopyWith(VehicleInfoData value, $Res Function(VehicleInfoData) _then) = _$VehicleInfoDataCopyWithImpl;
@useResult
$Res call({
 String? vehicleName, String? vehicleNumber, String? vehicleColor, String? vehicleModel, String? vehicleYear, String? vehicleCapacity, String? vehicleType, String? vehicleSubType
});




}
/// @nodoc
class _$VehicleInfoDataCopyWithImpl<$Res>
    implements $VehicleInfoDataCopyWith<$Res> {
  _$VehicleInfoDataCopyWithImpl(this._self, this._then);

  final VehicleInfoData _self;
  final $Res Function(VehicleInfoData) _then;

/// Create a copy of VehicleInfoData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vehicleName = freezed,Object? vehicleNumber = freezed,Object? vehicleColor = freezed,Object? vehicleModel = freezed,Object? vehicleYear = freezed,Object? vehicleCapacity = freezed,Object? vehicleType = freezed,Object? vehicleSubType = freezed,}) {
  return _then(_self.copyWith(
vehicleName: freezed == vehicleName ? _self.vehicleName : vehicleName // ignore: cast_nullable_to_non_nullable
as String?,vehicleNumber: freezed == vehicleNumber ? _self.vehicleNumber : vehicleNumber // ignore: cast_nullable_to_non_nullable
as String?,vehicleColor: freezed == vehicleColor ? _self.vehicleColor : vehicleColor // ignore: cast_nullable_to_non_nullable
as String?,vehicleModel: freezed == vehicleModel ? _self.vehicleModel : vehicleModel // ignore: cast_nullable_to_non_nullable
as String?,vehicleYear: freezed == vehicleYear ? _self.vehicleYear : vehicleYear // ignore: cast_nullable_to_non_nullable
as String?,vehicleCapacity: freezed == vehicleCapacity ? _self.vehicleCapacity : vehicleCapacity // ignore: cast_nullable_to_non_nullable
as String?,vehicleType: freezed == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String?,vehicleSubType: freezed == vehicleSubType ? _self.vehicleSubType : vehicleSubType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VehicleInfoData].
extension VehicleInfoDataPatterns on VehicleInfoData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleInfoData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleInfoData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleInfoData value)  $default,){
final _that = this;
switch (_that) {
case _VehicleInfoData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleInfoData value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleInfoData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? vehicleName,  String? vehicleNumber,  String? vehicleColor,  String? vehicleModel,  String? vehicleYear,  String? vehicleCapacity,  String? vehicleType,  String? vehicleSubType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleInfoData() when $default != null:
return $default(_that.vehicleName,_that.vehicleNumber,_that.vehicleColor,_that.vehicleModel,_that.vehicleYear,_that.vehicleCapacity,_that.vehicleType,_that.vehicleSubType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? vehicleName,  String? vehicleNumber,  String? vehicleColor,  String? vehicleModel,  String? vehicleYear,  String? vehicleCapacity,  String? vehicleType,  String? vehicleSubType)  $default,) {final _that = this;
switch (_that) {
case _VehicleInfoData():
return $default(_that.vehicleName,_that.vehicleNumber,_that.vehicleColor,_that.vehicleModel,_that.vehicleYear,_that.vehicleCapacity,_that.vehicleType,_that.vehicleSubType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? vehicleName,  String? vehicleNumber,  String? vehicleColor,  String? vehicleModel,  String? vehicleYear,  String? vehicleCapacity,  String? vehicleType,  String? vehicleSubType)?  $default,) {final _that = this;
switch (_that) {
case _VehicleInfoData() when $default != null:
return $default(_that.vehicleName,_that.vehicleNumber,_that.vehicleColor,_that.vehicleModel,_that.vehicleYear,_that.vehicleCapacity,_that.vehicleType,_that.vehicleSubType);case _:
  return null;

}
}

}

/// @nodoc


class _VehicleInfoData implements VehicleInfoData {
  const _VehicleInfoData({this.vehicleName, this.vehicleNumber, this.vehicleColor, this.vehicleModel, this.vehicleYear, this.vehicleCapacity, this.vehicleType, this.vehicleSubType});
  

@override final  String? vehicleName;
@override final  String? vehicleNumber;
@override final  String? vehicleColor;
@override final  String? vehicleModel;
@override final  String? vehicleYear;
@override final  String? vehicleCapacity;
@override final  String? vehicleType;
@override final  String? vehicleSubType;

/// Create a copy of VehicleInfoData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleInfoDataCopyWith<_VehicleInfoData> get copyWith => __$VehicleInfoDataCopyWithImpl<_VehicleInfoData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleInfoData&&(identical(other.vehicleName, vehicleName) || other.vehicleName == vehicleName)&&(identical(other.vehicleNumber, vehicleNumber) || other.vehicleNumber == vehicleNumber)&&(identical(other.vehicleColor, vehicleColor) || other.vehicleColor == vehicleColor)&&(identical(other.vehicleModel, vehicleModel) || other.vehicleModel == vehicleModel)&&(identical(other.vehicleYear, vehicleYear) || other.vehicleYear == vehicleYear)&&(identical(other.vehicleCapacity, vehicleCapacity) || other.vehicleCapacity == vehicleCapacity)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.vehicleSubType, vehicleSubType) || other.vehicleSubType == vehicleSubType));
}


@override
int get hashCode => Object.hash(runtimeType,vehicleName,vehicleNumber,vehicleColor,vehicleModel,vehicleYear,vehicleCapacity,vehicleType,vehicleSubType);

@override
String toString() {
  return 'VehicleInfoData(vehicleName: $vehicleName, vehicleNumber: $vehicleNumber, vehicleColor: $vehicleColor, vehicleModel: $vehicleModel, vehicleYear: $vehicleYear, vehicleCapacity: $vehicleCapacity, vehicleType: $vehicleType, vehicleSubType: $vehicleSubType)';
}


}

/// @nodoc
abstract mixin class _$VehicleInfoDataCopyWith<$Res> implements $VehicleInfoDataCopyWith<$Res> {
  factory _$VehicleInfoDataCopyWith(_VehicleInfoData value, $Res Function(_VehicleInfoData) _then) = __$VehicleInfoDataCopyWithImpl;
@override @useResult
$Res call({
 String? vehicleName, String? vehicleNumber, String? vehicleColor, String? vehicleModel, String? vehicleYear, String? vehicleCapacity, String? vehicleType, String? vehicleSubType
});




}
/// @nodoc
class __$VehicleInfoDataCopyWithImpl<$Res>
    implements _$VehicleInfoDataCopyWith<$Res> {
  __$VehicleInfoDataCopyWithImpl(this._self, this._then);

  final _VehicleInfoData _self;
  final $Res Function(_VehicleInfoData) _then;

/// Create a copy of VehicleInfoData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vehicleName = freezed,Object? vehicleNumber = freezed,Object? vehicleColor = freezed,Object? vehicleModel = freezed,Object? vehicleYear = freezed,Object? vehicleCapacity = freezed,Object? vehicleType = freezed,Object? vehicleSubType = freezed,}) {
  return _then(_VehicleInfoData(
vehicleName: freezed == vehicleName ? _self.vehicleName : vehicleName // ignore: cast_nullable_to_non_nullable
as String?,vehicleNumber: freezed == vehicleNumber ? _self.vehicleNumber : vehicleNumber // ignore: cast_nullable_to_non_nullable
as String?,vehicleColor: freezed == vehicleColor ? _self.vehicleColor : vehicleColor // ignore: cast_nullable_to_non_nullable
as String?,vehicleModel: freezed == vehicleModel ? _self.vehicleModel : vehicleModel // ignore: cast_nullable_to_non_nullable
as String?,vehicleYear: freezed == vehicleYear ? _self.vehicleYear : vehicleYear // ignore: cast_nullable_to_non_nullable
as String?,vehicleCapacity: freezed == vehicleCapacity ? _self.vehicleCapacity : vehicleCapacity // ignore: cast_nullable_to_non_nullable
as String?,vehicleType: freezed == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String?,vehicleSubType: freezed == vehicleSubType ? _self.vehicleSubType : vehicleSubType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$RegistrationStatusData {

 String? get registrationId; String? get driverId; String get overallStatus; String? get currentStepId; String? get nextStepId; List<String> get completedStepIds; List<String> get completedUiStepIds; bool get onboardingComplete; ProgressInfo? get progress; Map<String, UiStepGroup>? get uiSteps; Map<String, StepDetail>? get steps; List<ActionRequiredItem> get actionRequired; PersonalInfoData? get personalInfo; VehicleInfoData? get vehicleInfo; Map<String, dynamic>? get kycInfo; String? get submittedForReviewAt; String? get approvedAt;
/// Create a copy of RegistrationStatusData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationStatusDataCopyWith<RegistrationStatusData> get copyWith => _$RegistrationStatusDataCopyWithImpl<RegistrationStatusData>(this as RegistrationStatusData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationStatusData&&(identical(other.registrationId, registrationId) || other.registrationId == registrationId)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.overallStatus, overallStatus) || other.overallStatus == overallStatus)&&(identical(other.currentStepId, currentStepId) || other.currentStepId == currentStepId)&&(identical(other.nextStepId, nextStepId) || other.nextStepId == nextStepId)&&const DeepCollectionEquality().equals(other.completedStepIds, completedStepIds)&&const DeepCollectionEquality().equals(other.completedUiStepIds, completedUiStepIds)&&(identical(other.onboardingComplete, onboardingComplete) || other.onboardingComplete == onboardingComplete)&&(identical(other.progress, progress) || other.progress == progress)&&const DeepCollectionEquality().equals(other.uiSteps, uiSteps)&&const DeepCollectionEquality().equals(other.steps, steps)&&const DeepCollectionEquality().equals(other.actionRequired, actionRequired)&&(identical(other.personalInfo, personalInfo) || other.personalInfo == personalInfo)&&(identical(other.vehicleInfo, vehicleInfo) || other.vehicleInfo == vehicleInfo)&&const DeepCollectionEquality().equals(other.kycInfo, kycInfo)&&(identical(other.submittedForReviewAt, submittedForReviewAt) || other.submittedForReviewAt == submittedForReviewAt)&&(identical(other.approvedAt, approvedAt) || other.approvedAt == approvedAt));
}


@override
int get hashCode => Object.hash(runtimeType,registrationId,driverId,overallStatus,currentStepId,nextStepId,const DeepCollectionEquality().hash(completedStepIds),const DeepCollectionEquality().hash(completedUiStepIds),onboardingComplete,progress,const DeepCollectionEquality().hash(uiSteps),const DeepCollectionEquality().hash(steps),const DeepCollectionEquality().hash(actionRequired),personalInfo,vehicleInfo,const DeepCollectionEquality().hash(kycInfo),submittedForReviewAt,approvedAt);

@override
String toString() {
  return 'RegistrationStatusData(registrationId: $registrationId, driverId: $driverId, overallStatus: $overallStatus, currentStepId: $currentStepId, nextStepId: $nextStepId, completedStepIds: $completedStepIds, completedUiStepIds: $completedUiStepIds, onboardingComplete: $onboardingComplete, progress: $progress, uiSteps: $uiSteps, steps: $steps, actionRequired: $actionRequired, personalInfo: $personalInfo, vehicleInfo: $vehicleInfo, kycInfo: $kycInfo, submittedForReviewAt: $submittedForReviewAt, approvedAt: $approvedAt)';
}


}

/// @nodoc
abstract mixin class $RegistrationStatusDataCopyWith<$Res>  {
  factory $RegistrationStatusDataCopyWith(RegistrationStatusData value, $Res Function(RegistrationStatusData) _then) = _$RegistrationStatusDataCopyWithImpl;
@useResult
$Res call({
 String? registrationId, String? driverId, String overallStatus, String? currentStepId, String? nextStepId, List<String> completedStepIds, List<String> completedUiStepIds, bool onboardingComplete, ProgressInfo? progress, Map<String, UiStepGroup>? uiSteps, Map<String, StepDetail>? steps, List<ActionRequiredItem> actionRequired, PersonalInfoData? personalInfo, VehicleInfoData? vehicleInfo, Map<String, dynamic>? kycInfo, String? submittedForReviewAt, String? approvedAt
});


$ProgressInfoCopyWith<$Res>? get progress;$PersonalInfoDataCopyWith<$Res>? get personalInfo;$VehicleInfoDataCopyWith<$Res>? get vehicleInfo;

}
/// @nodoc
class _$RegistrationStatusDataCopyWithImpl<$Res>
    implements $RegistrationStatusDataCopyWith<$Res> {
  _$RegistrationStatusDataCopyWithImpl(this._self, this._then);

  final RegistrationStatusData _self;
  final $Res Function(RegistrationStatusData) _then;

/// Create a copy of RegistrationStatusData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? registrationId = freezed,Object? driverId = freezed,Object? overallStatus = null,Object? currentStepId = freezed,Object? nextStepId = freezed,Object? completedStepIds = null,Object? completedUiStepIds = null,Object? onboardingComplete = null,Object? progress = freezed,Object? uiSteps = freezed,Object? steps = freezed,Object? actionRequired = null,Object? personalInfo = freezed,Object? vehicleInfo = freezed,Object? kycInfo = freezed,Object? submittedForReviewAt = freezed,Object? approvedAt = freezed,}) {
  return _then(_self.copyWith(
registrationId: freezed == registrationId ? _self.registrationId : registrationId // ignore: cast_nullable_to_non_nullable
as String?,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,overallStatus: null == overallStatus ? _self.overallStatus : overallStatus // ignore: cast_nullable_to_non_nullable
as String,currentStepId: freezed == currentStepId ? _self.currentStepId : currentStepId // ignore: cast_nullable_to_non_nullable
as String?,nextStepId: freezed == nextStepId ? _self.nextStepId : nextStepId // ignore: cast_nullable_to_non_nullable
as String?,completedStepIds: null == completedStepIds ? _self.completedStepIds : completedStepIds // ignore: cast_nullable_to_non_nullable
as List<String>,completedUiStepIds: null == completedUiStepIds ? _self.completedUiStepIds : completedUiStepIds // ignore: cast_nullable_to_non_nullable
as List<String>,onboardingComplete: null == onboardingComplete ? _self.onboardingComplete : onboardingComplete // ignore: cast_nullable_to_non_nullable
as bool,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as ProgressInfo?,uiSteps: freezed == uiSteps ? _self.uiSteps : uiSteps // ignore: cast_nullable_to_non_nullable
as Map<String, UiStepGroup>?,steps: freezed == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as Map<String, StepDetail>?,actionRequired: null == actionRequired ? _self.actionRequired : actionRequired // ignore: cast_nullable_to_non_nullable
as List<ActionRequiredItem>,personalInfo: freezed == personalInfo ? _self.personalInfo : personalInfo // ignore: cast_nullable_to_non_nullable
as PersonalInfoData?,vehicleInfo: freezed == vehicleInfo ? _self.vehicleInfo : vehicleInfo // ignore: cast_nullable_to_non_nullable
as VehicleInfoData?,kycInfo: freezed == kycInfo ? _self.kycInfo : kycInfo // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,submittedForReviewAt: freezed == submittedForReviewAt ? _self.submittedForReviewAt : submittedForReviewAt // ignore: cast_nullable_to_non_nullable
as String?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of RegistrationStatusData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgressInfoCopyWith<$Res>? get progress {
    if (_self.progress == null) {
    return null;
  }

  return $ProgressInfoCopyWith<$Res>(_self.progress!, (value) {
    return _then(_self.copyWith(progress: value));
  });
}/// Create a copy of RegistrationStatusData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonalInfoDataCopyWith<$Res>? get personalInfo {
    if (_self.personalInfo == null) {
    return null;
  }

  return $PersonalInfoDataCopyWith<$Res>(_self.personalInfo!, (value) {
    return _then(_self.copyWith(personalInfo: value));
  });
}/// Create a copy of RegistrationStatusData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleInfoDataCopyWith<$Res>? get vehicleInfo {
    if (_self.vehicleInfo == null) {
    return null;
  }

  return $VehicleInfoDataCopyWith<$Res>(_self.vehicleInfo!, (value) {
    return _then(_self.copyWith(vehicleInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegistrationStatusData].
extension RegistrationStatusDataPatterns on RegistrationStatusData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegistrationStatusData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegistrationStatusData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegistrationStatusData value)  $default,){
final _that = this;
switch (_that) {
case _RegistrationStatusData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegistrationStatusData value)?  $default,){
final _that = this;
switch (_that) {
case _RegistrationStatusData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? registrationId,  String? driverId,  String overallStatus,  String? currentStepId,  String? nextStepId,  List<String> completedStepIds,  List<String> completedUiStepIds,  bool onboardingComplete,  ProgressInfo? progress,  Map<String, UiStepGroup>? uiSteps,  Map<String, StepDetail>? steps,  List<ActionRequiredItem> actionRequired,  PersonalInfoData? personalInfo,  VehicleInfoData? vehicleInfo,  Map<String, dynamic>? kycInfo,  String? submittedForReviewAt,  String? approvedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegistrationStatusData() when $default != null:
return $default(_that.registrationId,_that.driverId,_that.overallStatus,_that.currentStepId,_that.nextStepId,_that.completedStepIds,_that.completedUiStepIds,_that.onboardingComplete,_that.progress,_that.uiSteps,_that.steps,_that.actionRequired,_that.personalInfo,_that.vehicleInfo,_that.kycInfo,_that.submittedForReviewAt,_that.approvedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? registrationId,  String? driverId,  String overallStatus,  String? currentStepId,  String? nextStepId,  List<String> completedStepIds,  List<String> completedUiStepIds,  bool onboardingComplete,  ProgressInfo? progress,  Map<String, UiStepGroup>? uiSteps,  Map<String, StepDetail>? steps,  List<ActionRequiredItem> actionRequired,  PersonalInfoData? personalInfo,  VehicleInfoData? vehicleInfo,  Map<String, dynamic>? kycInfo,  String? submittedForReviewAt,  String? approvedAt)  $default,) {final _that = this;
switch (_that) {
case _RegistrationStatusData():
return $default(_that.registrationId,_that.driverId,_that.overallStatus,_that.currentStepId,_that.nextStepId,_that.completedStepIds,_that.completedUiStepIds,_that.onboardingComplete,_that.progress,_that.uiSteps,_that.steps,_that.actionRequired,_that.personalInfo,_that.vehicleInfo,_that.kycInfo,_that.submittedForReviewAt,_that.approvedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? registrationId,  String? driverId,  String overallStatus,  String? currentStepId,  String? nextStepId,  List<String> completedStepIds,  List<String> completedUiStepIds,  bool onboardingComplete,  ProgressInfo? progress,  Map<String, UiStepGroup>? uiSteps,  Map<String, StepDetail>? steps,  List<ActionRequiredItem> actionRequired,  PersonalInfoData? personalInfo,  VehicleInfoData? vehicleInfo,  Map<String, dynamic>? kycInfo,  String? submittedForReviewAt,  String? approvedAt)?  $default,) {final _that = this;
switch (_that) {
case _RegistrationStatusData() when $default != null:
return $default(_that.registrationId,_that.driverId,_that.overallStatus,_that.currentStepId,_that.nextStepId,_that.completedStepIds,_that.completedUiStepIds,_that.onboardingComplete,_that.progress,_that.uiSteps,_that.steps,_that.actionRequired,_that.personalInfo,_that.vehicleInfo,_that.kycInfo,_that.submittedForReviewAt,_that.approvedAt);case _:
  return null;

}
}

}

/// @nodoc


class _RegistrationStatusData implements RegistrationStatusData {
  const _RegistrationStatusData({this.registrationId, this.driverId, required this.overallStatus, this.currentStepId, this.nextStepId, final  List<String> completedStepIds = const [], final  List<String> completedUiStepIds = const [], this.onboardingComplete = false, this.progress, final  Map<String, UiStepGroup>? uiSteps, final  Map<String, StepDetail>? steps, final  List<ActionRequiredItem> actionRequired = const [], this.personalInfo, this.vehicleInfo, final  Map<String, dynamic>? kycInfo, this.submittedForReviewAt, this.approvedAt}): _completedStepIds = completedStepIds,_completedUiStepIds = completedUiStepIds,_uiSteps = uiSteps,_steps = steps,_actionRequired = actionRequired,_kycInfo = kycInfo;
  

@override final  String? registrationId;
@override final  String? driverId;
@override final  String overallStatus;
@override final  String? currentStepId;
@override final  String? nextStepId;
 final  List<String> _completedStepIds;
@override@JsonKey() List<String> get completedStepIds {
  if (_completedStepIds is EqualUnmodifiableListView) return _completedStepIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_completedStepIds);
}

 final  List<String> _completedUiStepIds;
@override@JsonKey() List<String> get completedUiStepIds {
  if (_completedUiStepIds is EqualUnmodifiableListView) return _completedUiStepIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_completedUiStepIds);
}

@override@JsonKey() final  bool onboardingComplete;
@override final  ProgressInfo? progress;
 final  Map<String, UiStepGroup>? _uiSteps;
@override Map<String, UiStepGroup>? get uiSteps {
  final value = _uiSteps;
  if (value == null) return null;
  if (_uiSteps is EqualUnmodifiableMapView) return _uiSteps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, StepDetail>? _steps;
@override Map<String, StepDetail>? get steps {
  final value = _steps;
  if (value == null) return null;
  if (_steps is EqualUnmodifiableMapView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<ActionRequiredItem> _actionRequired;
@override@JsonKey() List<ActionRequiredItem> get actionRequired {
  if (_actionRequired is EqualUnmodifiableListView) return _actionRequired;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_actionRequired);
}

@override final  PersonalInfoData? personalInfo;
@override final  VehicleInfoData? vehicleInfo;
 final  Map<String, dynamic>? _kycInfo;
@override Map<String, dynamic>? get kycInfo {
  final value = _kycInfo;
  if (value == null) return null;
  if (_kycInfo is EqualUnmodifiableMapView) return _kycInfo;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? submittedForReviewAt;
@override final  String? approvedAt;

/// Create a copy of RegistrationStatusData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegistrationStatusDataCopyWith<_RegistrationStatusData> get copyWith => __$RegistrationStatusDataCopyWithImpl<_RegistrationStatusData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegistrationStatusData&&(identical(other.registrationId, registrationId) || other.registrationId == registrationId)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.overallStatus, overallStatus) || other.overallStatus == overallStatus)&&(identical(other.currentStepId, currentStepId) || other.currentStepId == currentStepId)&&(identical(other.nextStepId, nextStepId) || other.nextStepId == nextStepId)&&const DeepCollectionEquality().equals(other._completedStepIds, _completedStepIds)&&const DeepCollectionEquality().equals(other._completedUiStepIds, _completedUiStepIds)&&(identical(other.onboardingComplete, onboardingComplete) || other.onboardingComplete == onboardingComplete)&&(identical(other.progress, progress) || other.progress == progress)&&const DeepCollectionEquality().equals(other._uiSteps, _uiSteps)&&const DeepCollectionEquality().equals(other._steps, _steps)&&const DeepCollectionEquality().equals(other._actionRequired, _actionRequired)&&(identical(other.personalInfo, personalInfo) || other.personalInfo == personalInfo)&&(identical(other.vehicleInfo, vehicleInfo) || other.vehicleInfo == vehicleInfo)&&const DeepCollectionEquality().equals(other._kycInfo, _kycInfo)&&(identical(other.submittedForReviewAt, submittedForReviewAt) || other.submittedForReviewAt == submittedForReviewAt)&&(identical(other.approvedAt, approvedAt) || other.approvedAt == approvedAt));
}


@override
int get hashCode => Object.hash(runtimeType,registrationId,driverId,overallStatus,currentStepId,nextStepId,const DeepCollectionEquality().hash(_completedStepIds),const DeepCollectionEquality().hash(_completedUiStepIds),onboardingComplete,progress,const DeepCollectionEquality().hash(_uiSteps),const DeepCollectionEquality().hash(_steps),const DeepCollectionEquality().hash(_actionRequired),personalInfo,vehicleInfo,const DeepCollectionEquality().hash(_kycInfo),submittedForReviewAt,approvedAt);

@override
String toString() {
  return 'RegistrationStatusData(registrationId: $registrationId, driverId: $driverId, overallStatus: $overallStatus, currentStepId: $currentStepId, nextStepId: $nextStepId, completedStepIds: $completedStepIds, completedUiStepIds: $completedUiStepIds, onboardingComplete: $onboardingComplete, progress: $progress, uiSteps: $uiSteps, steps: $steps, actionRequired: $actionRequired, personalInfo: $personalInfo, vehicleInfo: $vehicleInfo, kycInfo: $kycInfo, submittedForReviewAt: $submittedForReviewAt, approvedAt: $approvedAt)';
}


}

/// @nodoc
abstract mixin class _$RegistrationStatusDataCopyWith<$Res> implements $RegistrationStatusDataCopyWith<$Res> {
  factory _$RegistrationStatusDataCopyWith(_RegistrationStatusData value, $Res Function(_RegistrationStatusData) _then) = __$RegistrationStatusDataCopyWithImpl;
@override @useResult
$Res call({
 String? registrationId, String? driverId, String overallStatus, String? currentStepId, String? nextStepId, List<String> completedStepIds, List<String> completedUiStepIds, bool onboardingComplete, ProgressInfo? progress, Map<String, UiStepGroup>? uiSteps, Map<String, StepDetail>? steps, List<ActionRequiredItem> actionRequired, PersonalInfoData? personalInfo, VehicleInfoData? vehicleInfo, Map<String, dynamic>? kycInfo, String? submittedForReviewAt, String? approvedAt
});


@override $ProgressInfoCopyWith<$Res>? get progress;@override $PersonalInfoDataCopyWith<$Res>? get personalInfo;@override $VehicleInfoDataCopyWith<$Res>? get vehicleInfo;

}
/// @nodoc
class __$RegistrationStatusDataCopyWithImpl<$Res>
    implements _$RegistrationStatusDataCopyWith<$Res> {
  __$RegistrationStatusDataCopyWithImpl(this._self, this._then);

  final _RegistrationStatusData _self;
  final $Res Function(_RegistrationStatusData) _then;

/// Create a copy of RegistrationStatusData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? registrationId = freezed,Object? driverId = freezed,Object? overallStatus = null,Object? currentStepId = freezed,Object? nextStepId = freezed,Object? completedStepIds = null,Object? completedUiStepIds = null,Object? onboardingComplete = null,Object? progress = freezed,Object? uiSteps = freezed,Object? steps = freezed,Object? actionRequired = null,Object? personalInfo = freezed,Object? vehicleInfo = freezed,Object? kycInfo = freezed,Object? submittedForReviewAt = freezed,Object? approvedAt = freezed,}) {
  return _then(_RegistrationStatusData(
registrationId: freezed == registrationId ? _self.registrationId : registrationId // ignore: cast_nullable_to_non_nullable
as String?,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,overallStatus: null == overallStatus ? _self.overallStatus : overallStatus // ignore: cast_nullable_to_non_nullable
as String,currentStepId: freezed == currentStepId ? _self.currentStepId : currentStepId // ignore: cast_nullable_to_non_nullable
as String?,nextStepId: freezed == nextStepId ? _self.nextStepId : nextStepId // ignore: cast_nullable_to_non_nullable
as String?,completedStepIds: null == completedStepIds ? _self._completedStepIds : completedStepIds // ignore: cast_nullable_to_non_nullable
as List<String>,completedUiStepIds: null == completedUiStepIds ? _self._completedUiStepIds : completedUiStepIds // ignore: cast_nullable_to_non_nullable
as List<String>,onboardingComplete: null == onboardingComplete ? _self.onboardingComplete : onboardingComplete // ignore: cast_nullable_to_non_nullable
as bool,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as ProgressInfo?,uiSteps: freezed == uiSteps ? _self._uiSteps : uiSteps // ignore: cast_nullable_to_non_nullable
as Map<String, UiStepGroup>?,steps: freezed == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as Map<String, StepDetail>?,actionRequired: null == actionRequired ? _self._actionRequired : actionRequired // ignore: cast_nullable_to_non_nullable
as List<ActionRequiredItem>,personalInfo: freezed == personalInfo ? _self.personalInfo : personalInfo // ignore: cast_nullable_to_non_nullable
as PersonalInfoData?,vehicleInfo: freezed == vehicleInfo ? _self.vehicleInfo : vehicleInfo // ignore: cast_nullable_to_non_nullable
as VehicleInfoData?,kycInfo: freezed == kycInfo ? _self._kycInfo : kycInfo // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,submittedForReviewAt: freezed == submittedForReviewAt ? _self.submittedForReviewAt : submittedForReviewAt // ignore: cast_nullable_to_non_nullable
as String?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of RegistrationStatusData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgressInfoCopyWith<$Res>? get progress {
    if (_self.progress == null) {
    return null;
  }

  return $ProgressInfoCopyWith<$Res>(_self.progress!, (value) {
    return _then(_self.copyWith(progress: value));
  });
}/// Create a copy of RegistrationStatusData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonalInfoDataCopyWith<$Res>? get personalInfo {
    if (_self.personalInfo == null) {
    return null;
  }

  return $PersonalInfoDataCopyWith<$Res>(_self.personalInfo!, (value) {
    return _then(_self.copyWith(personalInfo: value));
  });
}/// Create a copy of RegistrationStatusData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleInfoDataCopyWith<$Res>? get vehicleInfo {
    if (_self.vehicleInfo == null) {
    return null;
  }

  return $VehicleInfoDataCopyWith<$Res>(_self.vehicleInfo!, (value) {
    return _then(_self.copyWith(vehicleInfo: value));
  });
}
}

/// @nodoc
mixin _$DriverRegistrationStatusResponse {

 bool get success; String get message; RegistrationStatusData? get data;
/// Create a copy of DriverRegistrationStatusResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DriverRegistrationStatusResponseCopyWith<DriverRegistrationStatusResponse> get copyWith => _$DriverRegistrationStatusResponseCopyWithImpl<DriverRegistrationStatusResponse>(this as DriverRegistrationStatusResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriverRegistrationStatusResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'DriverRegistrationStatusResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $DriverRegistrationStatusResponseCopyWith<$Res>  {
  factory $DriverRegistrationStatusResponseCopyWith(DriverRegistrationStatusResponse value, $Res Function(DriverRegistrationStatusResponse) _then) = _$DriverRegistrationStatusResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, RegistrationStatusData? data
});


$RegistrationStatusDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$DriverRegistrationStatusResponseCopyWithImpl<$Res>
    implements $DriverRegistrationStatusResponseCopyWith<$Res> {
  _$DriverRegistrationStatusResponseCopyWithImpl(this._self, this._then);

  final DriverRegistrationStatusResponse _self;
  final $Res Function(DriverRegistrationStatusResponse) _then;

/// Create a copy of DriverRegistrationStatusResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RegistrationStatusData?,
  ));
}
/// Create a copy of DriverRegistrationStatusResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegistrationStatusDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $RegistrationStatusDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [DriverRegistrationStatusResponse].
extension DriverRegistrationStatusResponsePatterns on DriverRegistrationStatusResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DriverRegistrationStatusResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DriverRegistrationStatusResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DriverRegistrationStatusResponse value)  $default,){
final _that = this;
switch (_that) {
case _DriverRegistrationStatusResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DriverRegistrationStatusResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DriverRegistrationStatusResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  RegistrationStatusData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DriverRegistrationStatusResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  RegistrationStatusData? data)  $default,) {final _that = this;
switch (_that) {
case _DriverRegistrationStatusResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  RegistrationStatusData? data)?  $default,) {final _that = this;
switch (_that) {
case _DriverRegistrationStatusResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _DriverRegistrationStatusResponse implements DriverRegistrationStatusResponse {
  const _DriverRegistrationStatusResponse({required this.success, required this.message, this.data});
  

@override final  bool success;
@override final  String message;
@override final  RegistrationStatusData? data;

/// Create a copy of DriverRegistrationStatusResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DriverRegistrationStatusResponseCopyWith<_DriverRegistrationStatusResponse> get copyWith => __$DriverRegistrationStatusResponseCopyWithImpl<_DriverRegistrationStatusResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DriverRegistrationStatusResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'DriverRegistrationStatusResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$DriverRegistrationStatusResponseCopyWith<$Res> implements $DriverRegistrationStatusResponseCopyWith<$Res> {
  factory _$DriverRegistrationStatusResponseCopyWith(_DriverRegistrationStatusResponse value, $Res Function(_DriverRegistrationStatusResponse) _then) = __$DriverRegistrationStatusResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, RegistrationStatusData? data
});


@override $RegistrationStatusDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$DriverRegistrationStatusResponseCopyWithImpl<$Res>
    implements _$DriverRegistrationStatusResponseCopyWith<$Res> {
  __$DriverRegistrationStatusResponseCopyWithImpl(this._self, this._then);

  final _DriverRegistrationStatusResponse _self;
  final $Res Function(_DriverRegistrationStatusResponse) _then;

/// Create a copy of DriverRegistrationStatusResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_DriverRegistrationStatusResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RegistrationStatusData?,
  ));
}

/// Create a copy of DriverRegistrationStatusResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegistrationStatusDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $RegistrationStatusDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
