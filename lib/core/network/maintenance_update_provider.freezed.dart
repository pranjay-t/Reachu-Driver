// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_update_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MaintenanceUpdateState {

 UpdateStatus get updateStatus; String? get appVersion; UpdateType get type; bool get maintenanceStatus; String? get maintenanceEndTime; bool get hasPromptedFlexibleUpdate;
/// Create a copy of MaintenanceUpdateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceUpdateStateCopyWith<MaintenanceUpdateState> get copyWith => _$MaintenanceUpdateStateCopyWithImpl<MaintenanceUpdateState>(this as MaintenanceUpdateState, _$identity);

  /// Serializes this MaintenanceUpdateState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceUpdateState&&(identical(other.updateStatus, updateStatus) || other.updateStatus == updateStatus)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.type, type) || other.type == type)&&(identical(other.maintenanceStatus, maintenanceStatus) || other.maintenanceStatus == maintenanceStatus)&&(identical(other.maintenanceEndTime, maintenanceEndTime) || other.maintenanceEndTime == maintenanceEndTime)&&(identical(other.hasPromptedFlexibleUpdate, hasPromptedFlexibleUpdate) || other.hasPromptedFlexibleUpdate == hasPromptedFlexibleUpdate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,updateStatus,appVersion,type,maintenanceStatus,maintenanceEndTime,hasPromptedFlexibleUpdate);

@override
String toString() {
  return 'MaintenanceUpdateState(updateStatus: $updateStatus, appVersion: $appVersion, type: $type, maintenanceStatus: $maintenanceStatus, maintenanceEndTime: $maintenanceEndTime, hasPromptedFlexibleUpdate: $hasPromptedFlexibleUpdate)';
}


}

/// @nodoc
abstract mixin class $MaintenanceUpdateStateCopyWith<$Res>  {
  factory $MaintenanceUpdateStateCopyWith(MaintenanceUpdateState value, $Res Function(MaintenanceUpdateState) _then) = _$MaintenanceUpdateStateCopyWithImpl;
@useResult
$Res call({
 UpdateStatus updateStatus, String? appVersion, UpdateType type, bool maintenanceStatus, String? maintenanceEndTime, bool hasPromptedFlexibleUpdate
});




}
/// @nodoc
class _$MaintenanceUpdateStateCopyWithImpl<$Res>
    implements $MaintenanceUpdateStateCopyWith<$Res> {
  _$MaintenanceUpdateStateCopyWithImpl(this._self, this._then);

  final MaintenanceUpdateState _self;
  final $Res Function(MaintenanceUpdateState) _then;

/// Create a copy of MaintenanceUpdateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? updateStatus = null,Object? appVersion = freezed,Object? type = null,Object? maintenanceStatus = null,Object? maintenanceEndTime = freezed,Object? hasPromptedFlexibleUpdate = null,}) {
  return _then(_self.copyWith(
updateStatus: null == updateStatus ? _self.updateStatus : updateStatus // ignore: cast_nullable_to_non_nullable
as UpdateStatus,appVersion: freezed == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as UpdateType,maintenanceStatus: null == maintenanceStatus ? _self.maintenanceStatus : maintenanceStatus // ignore: cast_nullable_to_non_nullable
as bool,maintenanceEndTime: freezed == maintenanceEndTime ? _self.maintenanceEndTime : maintenanceEndTime // ignore: cast_nullable_to_non_nullable
as String?,hasPromptedFlexibleUpdate: null == hasPromptedFlexibleUpdate ? _self.hasPromptedFlexibleUpdate : hasPromptedFlexibleUpdate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MaintenanceUpdateState].
extension MaintenanceUpdateStatePatterns on MaintenanceUpdateState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceUpdateState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceUpdateState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceUpdateState value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceUpdateState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceUpdateState value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceUpdateState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UpdateStatus updateStatus,  String? appVersion,  UpdateType type,  bool maintenanceStatus,  String? maintenanceEndTime,  bool hasPromptedFlexibleUpdate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceUpdateState() when $default != null:
return $default(_that.updateStatus,_that.appVersion,_that.type,_that.maintenanceStatus,_that.maintenanceEndTime,_that.hasPromptedFlexibleUpdate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UpdateStatus updateStatus,  String? appVersion,  UpdateType type,  bool maintenanceStatus,  String? maintenanceEndTime,  bool hasPromptedFlexibleUpdate)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceUpdateState():
return $default(_that.updateStatus,_that.appVersion,_that.type,_that.maintenanceStatus,_that.maintenanceEndTime,_that.hasPromptedFlexibleUpdate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UpdateStatus updateStatus,  String? appVersion,  UpdateType type,  bool maintenanceStatus,  String? maintenanceEndTime,  bool hasPromptedFlexibleUpdate)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceUpdateState() when $default != null:
return $default(_that.updateStatus,_that.appVersion,_that.type,_that.maintenanceStatus,_that.maintenanceEndTime,_that.hasPromptedFlexibleUpdate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaintenanceUpdateState implements MaintenanceUpdateState {
  const _MaintenanceUpdateState({this.updateStatus = UpdateStatus.nothing, this.appVersion, this.type = UpdateType.maintenanceUpdate, this.maintenanceStatus = false, this.maintenanceEndTime, this.hasPromptedFlexibleUpdate = false});
  factory _MaintenanceUpdateState.fromJson(Map<String, dynamic> json) => _$MaintenanceUpdateStateFromJson(json);

@override@JsonKey() final  UpdateStatus updateStatus;
@override final  String? appVersion;
@override@JsonKey() final  UpdateType type;
@override@JsonKey() final  bool maintenanceStatus;
@override final  String? maintenanceEndTime;
@override@JsonKey() final  bool hasPromptedFlexibleUpdate;

/// Create a copy of MaintenanceUpdateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceUpdateStateCopyWith<_MaintenanceUpdateState> get copyWith => __$MaintenanceUpdateStateCopyWithImpl<_MaintenanceUpdateState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaintenanceUpdateStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceUpdateState&&(identical(other.updateStatus, updateStatus) || other.updateStatus == updateStatus)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.type, type) || other.type == type)&&(identical(other.maintenanceStatus, maintenanceStatus) || other.maintenanceStatus == maintenanceStatus)&&(identical(other.maintenanceEndTime, maintenanceEndTime) || other.maintenanceEndTime == maintenanceEndTime)&&(identical(other.hasPromptedFlexibleUpdate, hasPromptedFlexibleUpdate) || other.hasPromptedFlexibleUpdate == hasPromptedFlexibleUpdate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,updateStatus,appVersion,type,maintenanceStatus,maintenanceEndTime,hasPromptedFlexibleUpdate);

@override
String toString() {
  return 'MaintenanceUpdateState(updateStatus: $updateStatus, appVersion: $appVersion, type: $type, maintenanceStatus: $maintenanceStatus, maintenanceEndTime: $maintenanceEndTime, hasPromptedFlexibleUpdate: $hasPromptedFlexibleUpdate)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceUpdateStateCopyWith<$Res> implements $MaintenanceUpdateStateCopyWith<$Res> {
  factory _$MaintenanceUpdateStateCopyWith(_MaintenanceUpdateState value, $Res Function(_MaintenanceUpdateState) _then) = __$MaintenanceUpdateStateCopyWithImpl;
@override @useResult
$Res call({
 UpdateStatus updateStatus, String? appVersion, UpdateType type, bool maintenanceStatus, String? maintenanceEndTime, bool hasPromptedFlexibleUpdate
});




}
/// @nodoc
class __$MaintenanceUpdateStateCopyWithImpl<$Res>
    implements _$MaintenanceUpdateStateCopyWith<$Res> {
  __$MaintenanceUpdateStateCopyWithImpl(this._self, this._then);

  final _MaintenanceUpdateState _self;
  final $Res Function(_MaintenanceUpdateState) _then;

/// Create a copy of MaintenanceUpdateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? updateStatus = null,Object? appVersion = freezed,Object? type = null,Object? maintenanceStatus = null,Object? maintenanceEndTime = freezed,Object? hasPromptedFlexibleUpdate = null,}) {
  return _then(_MaintenanceUpdateState(
updateStatus: null == updateStatus ? _self.updateStatus : updateStatus // ignore: cast_nullable_to_non_nullable
as UpdateStatus,appVersion: freezed == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as UpdateType,maintenanceStatus: null == maintenanceStatus ? _self.maintenanceStatus : maintenanceStatus // ignore: cast_nullable_to_non_nullable
as bool,maintenanceEndTime: freezed == maintenanceEndTime ? _self.maintenanceEndTime : maintenanceEndTime // ignore: cast_nullable_to_non_nullable
as String?,hasPromptedFlexibleUpdate: null == hasPromptedFlexibleUpdate ? _self.hasPromptedFlexibleUpdate : hasPromptedFlexibleUpdate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
