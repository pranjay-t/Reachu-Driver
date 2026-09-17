// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tutorial_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TutorialModel {

@JsonKey(name: '_id') String get id; String get title; String get description; String get videoUrl; String get videoSource; int get durationSeconds; String get targetAudience; List<String> get userRole; String get category; List<String> get tags; String get language; List<String> get platforms; int get sortOrder; bool get isFeatured; bool get isMandatory; int get views; String? get minAppVersion; DateTime? get publishedAt; String get status; String? get createdBy; DateTime? get createdAt; DateTime? get updatedAt; bool get watched;
/// Create a copy of TutorialModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TutorialModelCopyWith<TutorialModel> get copyWith => _$TutorialModelCopyWithImpl<TutorialModel>(this as TutorialModel, _$identity);

  /// Serializes this TutorialModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TutorialModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.videoSource, videoSource) || other.videoSource == videoSource)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.targetAudience, targetAudience) || other.targetAudience == targetAudience)&&const DeepCollectionEquality().equals(other.userRole, userRole)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.language, language) || other.language == language)&&const DeepCollectionEquality().equals(other.platforms, platforms)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.isMandatory, isMandatory) || other.isMandatory == isMandatory)&&(identical(other.views, views) || other.views == views)&&(identical(other.minAppVersion, minAppVersion) || other.minAppVersion == minAppVersion)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.watched, watched) || other.watched == watched));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,videoUrl,videoSource,durationSeconds,targetAudience,const DeepCollectionEquality().hash(userRole),category,const DeepCollectionEquality().hash(tags),language,const DeepCollectionEquality().hash(platforms),sortOrder,isFeatured,isMandatory,views,minAppVersion,publishedAt,status,createdBy,createdAt,updatedAt,watched]);

@override
String toString() {
  return 'TutorialModel(id: $id, title: $title, description: $description, videoUrl: $videoUrl, videoSource: $videoSource, durationSeconds: $durationSeconds, targetAudience: $targetAudience, userRole: $userRole, category: $category, tags: $tags, language: $language, platforms: $platforms, sortOrder: $sortOrder, isFeatured: $isFeatured, isMandatory: $isMandatory, views: $views, minAppVersion: $minAppVersion, publishedAt: $publishedAt, status: $status, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, watched: $watched)';
}


}

/// @nodoc
abstract mixin class $TutorialModelCopyWith<$Res>  {
  factory $TutorialModelCopyWith(TutorialModel value, $Res Function(TutorialModel) _then) = _$TutorialModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String title, String description, String videoUrl, String videoSource, int durationSeconds, String targetAudience, List<String> userRole, String category, List<String> tags, String language, List<String> platforms, int sortOrder, bool isFeatured, bool isMandatory, int views, String? minAppVersion, DateTime? publishedAt, String status, String? createdBy, DateTime? createdAt, DateTime? updatedAt, bool watched
});




}
/// @nodoc
class _$TutorialModelCopyWithImpl<$Res>
    implements $TutorialModelCopyWith<$Res> {
  _$TutorialModelCopyWithImpl(this._self, this._then);

  final TutorialModel _self;
  final $Res Function(TutorialModel) _then;

/// Create a copy of TutorialModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? videoUrl = null,Object? videoSource = null,Object? durationSeconds = null,Object? targetAudience = null,Object? userRole = null,Object? category = null,Object? tags = null,Object? language = null,Object? platforms = null,Object? sortOrder = null,Object? isFeatured = null,Object? isMandatory = null,Object? views = null,Object? minAppVersion = freezed,Object? publishedAt = freezed,Object? status = null,Object? createdBy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? watched = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,videoUrl: null == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String,videoSource: null == videoSource ? _self.videoSource : videoSource // ignore: cast_nullable_to_non_nullable
as String,durationSeconds: null == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int,targetAudience: null == targetAudience ? _self.targetAudience : targetAudience // ignore: cast_nullable_to_non_nullable
as String,userRole: null == userRole ? _self.userRole : userRole // ignore: cast_nullable_to_non_nullable
as List<String>,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,platforms: null == platforms ? _self.platforms : platforms // ignore: cast_nullable_to_non_nullable
as List<String>,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,isMandatory: null == isMandatory ? _self.isMandatory : isMandatory // ignore: cast_nullable_to_non_nullable
as bool,views: null == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int,minAppVersion: freezed == minAppVersion ? _self.minAppVersion : minAppVersion // ignore: cast_nullable_to_non_nullable
as String?,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,watched: null == watched ? _self.watched : watched // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TutorialModel].
extension TutorialModelPatterns on TutorialModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TutorialModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TutorialModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TutorialModel value)  $default,){
final _that = this;
switch (_that) {
case _TutorialModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TutorialModel value)?  $default,){
final _that = this;
switch (_that) {
case _TutorialModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String title,  String description,  String videoUrl,  String videoSource,  int durationSeconds,  String targetAudience,  List<String> userRole,  String category,  List<String> tags,  String language,  List<String> platforms,  int sortOrder,  bool isFeatured,  bool isMandatory,  int views,  String? minAppVersion,  DateTime? publishedAt,  String status,  String? createdBy,  DateTime? createdAt,  DateTime? updatedAt,  bool watched)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TutorialModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.videoUrl,_that.videoSource,_that.durationSeconds,_that.targetAudience,_that.userRole,_that.category,_that.tags,_that.language,_that.platforms,_that.sortOrder,_that.isFeatured,_that.isMandatory,_that.views,_that.minAppVersion,_that.publishedAt,_that.status,_that.createdBy,_that.createdAt,_that.updatedAt,_that.watched);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String title,  String description,  String videoUrl,  String videoSource,  int durationSeconds,  String targetAudience,  List<String> userRole,  String category,  List<String> tags,  String language,  List<String> platforms,  int sortOrder,  bool isFeatured,  bool isMandatory,  int views,  String? minAppVersion,  DateTime? publishedAt,  String status,  String? createdBy,  DateTime? createdAt,  DateTime? updatedAt,  bool watched)  $default,) {final _that = this;
switch (_that) {
case _TutorialModel():
return $default(_that.id,_that.title,_that.description,_that.videoUrl,_that.videoSource,_that.durationSeconds,_that.targetAudience,_that.userRole,_that.category,_that.tags,_that.language,_that.platforms,_that.sortOrder,_that.isFeatured,_that.isMandatory,_that.views,_that.minAppVersion,_that.publishedAt,_that.status,_that.createdBy,_that.createdAt,_that.updatedAt,_that.watched);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String title,  String description,  String videoUrl,  String videoSource,  int durationSeconds,  String targetAudience,  List<String> userRole,  String category,  List<String> tags,  String language,  List<String> platforms,  int sortOrder,  bool isFeatured,  bool isMandatory,  int views,  String? minAppVersion,  DateTime? publishedAt,  String status,  String? createdBy,  DateTime? createdAt,  DateTime? updatedAt,  bool watched)?  $default,) {final _that = this;
switch (_that) {
case _TutorialModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.videoUrl,_that.videoSource,_that.durationSeconds,_that.targetAudience,_that.userRole,_that.category,_that.tags,_that.language,_that.platforms,_that.sortOrder,_that.isFeatured,_that.isMandatory,_that.views,_that.minAppVersion,_that.publishedAt,_that.status,_that.createdBy,_that.createdAt,_that.updatedAt,_that.watched);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TutorialModel implements TutorialModel {
  const _TutorialModel({@JsonKey(name: '_id') required this.id, this.title = '', this.description = '', this.videoUrl = '', this.videoSource = 'youtube', this.durationSeconds = 0, this.targetAudience = 'Both', final  List<String> userRole = const [], this.category = 'General', final  List<String> tags = const [], this.language = 'en', final  List<String> platforms = const [], this.sortOrder = 0, this.isFeatured = false, this.isMandatory = false, this.views = 0, this.minAppVersion, this.publishedAt, this.status = 'Active', this.createdBy, this.createdAt, this.updatedAt, this.watched = false}): _userRole = userRole,_tags = tags,_platforms = platforms;
  factory _TutorialModel.fromJson(Map<String, dynamic> json) => _$TutorialModelFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String description;
@override@JsonKey() final  String videoUrl;
@override@JsonKey() final  String videoSource;
@override@JsonKey() final  int durationSeconds;
@override@JsonKey() final  String targetAudience;
 final  List<String> _userRole;
@override@JsonKey() List<String> get userRole {
  if (_userRole is EqualUnmodifiableListView) return _userRole;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userRole);
}

@override@JsonKey() final  String category;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey() final  String language;
 final  List<String> _platforms;
@override@JsonKey() List<String> get platforms {
  if (_platforms is EqualUnmodifiableListView) return _platforms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_platforms);
}

@override@JsonKey() final  int sortOrder;
@override@JsonKey() final  bool isFeatured;
@override@JsonKey() final  bool isMandatory;
@override@JsonKey() final  int views;
@override final  String? minAppVersion;
@override final  DateTime? publishedAt;
@override@JsonKey() final  String status;
@override final  String? createdBy;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override@JsonKey() final  bool watched;

/// Create a copy of TutorialModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TutorialModelCopyWith<_TutorialModel> get copyWith => __$TutorialModelCopyWithImpl<_TutorialModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TutorialModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TutorialModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.videoSource, videoSource) || other.videoSource == videoSource)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.targetAudience, targetAudience) || other.targetAudience == targetAudience)&&const DeepCollectionEquality().equals(other._userRole, _userRole)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.language, language) || other.language == language)&&const DeepCollectionEquality().equals(other._platforms, _platforms)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.isMandatory, isMandatory) || other.isMandatory == isMandatory)&&(identical(other.views, views) || other.views == views)&&(identical(other.minAppVersion, minAppVersion) || other.minAppVersion == minAppVersion)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.watched, watched) || other.watched == watched));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,videoUrl,videoSource,durationSeconds,targetAudience,const DeepCollectionEquality().hash(_userRole),category,const DeepCollectionEquality().hash(_tags),language,const DeepCollectionEquality().hash(_platforms),sortOrder,isFeatured,isMandatory,views,minAppVersion,publishedAt,status,createdBy,createdAt,updatedAt,watched]);

@override
String toString() {
  return 'TutorialModel(id: $id, title: $title, description: $description, videoUrl: $videoUrl, videoSource: $videoSource, durationSeconds: $durationSeconds, targetAudience: $targetAudience, userRole: $userRole, category: $category, tags: $tags, language: $language, platforms: $platforms, sortOrder: $sortOrder, isFeatured: $isFeatured, isMandatory: $isMandatory, views: $views, minAppVersion: $minAppVersion, publishedAt: $publishedAt, status: $status, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, watched: $watched)';
}


}

/// @nodoc
abstract mixin class _$TutorialModelCopyWith<$Res> implements $TutorialModelCopyWith<$Res> {
  factory _$TutorialModelCopyWith(_TutorialModel value, $Res Function(_TutorialModel) _then) = __$TutorialModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String title, String description, String videoUrl, String videoSource, int durationSeconds, String targetAudience, List<String> userRole, String category, List<String> tags, String language, List<String> platforms, int sortOrder, bool isFeatured, bool isMandatory, int views, String? minAppVersion, DateTime? publishedAt, String status, String? createdBy, DateTime? createdAt, DateTime? updatedAt, bool watched
});




}
/// @nodoc
class __$TutorialModelCopyWithImpl<$Res>
    implements _$TutorialModelCopyWith<$Res> {
  __$TutorialModelCopyWithImpl(this._self, this._then);

  final _TutorialModel _self;
  final $Res Function(_TutorialModel) _then;

/// Create a copy of TutorialModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? videoUrl = null,Object? videoSource = null,Object? durationSeconds = null,Object? targetAudience = null,Object? userRole = null,Object? category = null,Object? tags = null,Object? language = null,Object? platforms = null,Object? sortOrder = null,Object? isFeatured = null,Object? isMandatory = null,Object? views = null,Object? minAppVersion = freezed,Object? publishedAt = freezed,Object? status = null,Object? createdBy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? watched = null,}) {
  return _then(_TutorialModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,videoUrl: null == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String,videoSource: null == videoSource ? _self.videoSource : videoSource // ignore: cast_nullable_to_non_nullable
as String,durationSeconds: null == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int,targetAudience: null == targetAudience ? _self.targetAudience : targetAudience // ignore: cast_nullable_to_non_nullable
as String,userRole: null == userRole ? _self._userRole : userRole // ignore: cast_nullable_to_non_nullable
as List<String>,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,platforms: null == platforms ? _self._platforms : platforms // ignore: cast_nullable_to_non_nullable
as List<String>,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,isMandatory: null == isMandatory ? _self.isMandatory : isMandatory // ignore: cast_nullable_to_non_nullable
as bool,views: null == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int,minAppVersion: freezed == minAppVersion ? _self.minAppVersion : minAppVersion // ignore: cast_nullable_to_non_nullable
as String?,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,watched: null == watched ? _self.watched : watched // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$TutorialPagination {

 int get total; int get page; int get limit; int get totalPages;
/// Create a copy of TutorialPagination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TutorialPaginationCopyWith<TutorialPagination> get copyWith => _$TutorialPaginationCopyWithImpl<TutorialPagination>(this as TutorialPagination, _$identity);

  /// Serializes this TutorialPagination to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TutorialPagination&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,limit,totalPages);

@override
String toString() {
  return 'TutorialPagination(total: $total, page: $page, limit: $limit, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $TutorialPaginationCopyWith<$Res>  {
  factory $TutorialPaginationCopyWith(TutorialPagination value, $Res Function(TutorialPagination) _then) = _$TutorialPaginationCopyWithImpl;
@useResult
$Res call({
 int total, int page, int limit, int totalPages
});




}
/// @nodoc
class _$TutorialPaginationCopyWithImpl<$Res>
    implements $TutorialPaginationCopyWith<$Res> {
  _$TutorialPaginationCopyWithImpl(this._self, this._then);

  final TutorialPagination _self;
  final $Res Function(TutorialPagination) _then;

/// Create a copy of TutorialPagination
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? page = null,Object? limit = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TutorialPagination].
extension TutorialPaginationPatterns on TutorialPagination {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TutorialPagination value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TutorialPagination() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TutorialPagination value)  $default,){
final _that = this;
switch (_that) {
case _TutorialPagination():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TutorialPagination value)?  $default,){
final _that = this;
switch (_that) {
case _TutorialPagination() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int page,  int limit,  int totalPages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TutorialPagination() when $default != null:
return $default(_that.total,_that.page,_that.limit,_that.totalPages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int page,  int limit,  int totalPages)  $default,) {final _that = this;
switch (_that) {
case _TutorialPagination():
return $default(_that.total,_that.page,_that.limit,_that.totalPages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int page,  int limit,  int totalPages)?  $default,) {final _that = this;
switch (_that) {
case _TutorialPagination() when $default != null:
return $default(_that.total,_that.page,_that.limit,_that.totalPages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TutorialPagination implements TutorialPagination {
  const _TutorialPagination({this.total = 0, this.page = 1, this.limit = 10, this.totalPages = 1});
  factory _TutorialPagination.fromJson(Map<String, dynamic> json) => _$TutorialPaginationFromJson(json);

@override@JsonKey() final  int total;
@override@JsonKey() final  int page;
@override@JsonKey() final  int limit;
@override@JsonKey() final  int totalPages;

/// Create a copy of TutorialPagination
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TutorialPaginationCopyWith<_TutorialPagination> get copyWith => __$TutorialPaginationCopyWithImpl<_TutorialPagination>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TutorialPaginationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TutorialPagination&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,limit,totalPages);

@override
String toString() {
  return 'TutorialPagination(total: $total, page: $page, limit: $limit, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$TutorialPaginationCopyWith<$Res> implements $TutorialPaginationCopyWith<$Res> {
  factory _$TutorialPaginationCopyWith(_TutorialPagination value, $Res Function(_TutorialPagination) _then) = __$TutorialPaginationCopyWithImpl;
@override @useResult
$Res call({
 int total, int page, int limit, int totalPages
});




}
/// @nodoc
class __$TutorialPaginationCopyWithImpl<$Res>
    implements _$TutorialPaginationCopyWith<$Res> {
  __$TutorialPaginationCopyWithImpl(this._self, this._then);

  final _TutorialPagination _self;
  final $Res Function(_TutorialPagination) _then;

/// Create a copy of TutorialPagination
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? page = null,Object? limit = null,Object? totalPages = null,}) {
  return _then(_TutorialPagination(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$TutorialListResponse {

 bool get success; String get message; List<TutorialModel> get data; TutorialPagination? get pagination;
/// Create a copy of TutorialListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TutorialListResponseCopyWith<TutorialListResponse> get copyWith => _$TutorialListResponseCopyWithImpl<TutorialListResponse>(this as TutorialListResponse, _$identity);

  /// Serializes this TutorialListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TutorialListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data),pagination);

@override
String toString() {
  return 'TutorialListResponse(success: $success, message: $message, data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $TutorialListResponseCopyWith<$Res>  {
  factory $TutorialListResponseCopyWith(TutorialListResponse value, $Res Function(TutorialListResponse) _then) = _$TutorialListResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, List<TutorialModel> data, TutorialPagination? pagination
});


$TutorialPaginationCopyWith<$Res>? get pagination;

}
/// @nodoc
class _$TutorialListResponseCopyWithImpl<$Res>
    implements $TutorialListResponseCopyWith<$Res> {
  _$TutorialListResponseCopyWithImpl(this._self, this._then);

  final TutorialListResponse _self;
  final $Res Function(TutorialListResponse) _then;

/// Create a copy of TutorialListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,Object? pagination = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<TutorialModel>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as TutorialPagination?,
  ));
}
/// Create a copy of TutorialListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TutorialPaginationCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $TutorialPaginationCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [TutorialListResponse].
extension TutorialListResponsePatterns on TutorialListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TutorialListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TutorialListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TutorialListResponse value)  $default,){
final _that = this;
switch (_that) {
case _TutorialListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TutorialListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TutorialListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  List<TutorialModel> data,  TutorialPagination? pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TutorialListResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  List<TutorialModel> data,  TutorialPagination? pagination)  $default,) {final _that = this;
switch (_that) {
case _TutorialListResponse():
return $default(_that.success,_that.message,_that.data,_that.pagination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  List<TutorialModel> data,  TutorialPagination? pagination)?  $default,) {final _that = this;
switch (_that) {
case _TutorialListResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TutorialListResponse implements TutorialListResponse {
  const _TutorialListResponse({required this.success, this.message = '', final  List<TutorialModel> data = const [], this.pagination}): _data = data;
  factory _TutorialListResponse.fromJson(Map<String, dynamic> json) => _$TutorialListResponseFromJson(json);

@override final  bool success;
@override@JsonKey() final  String message;
 final  List<TutorialModel> _data;
@override@JsonKey() List<TutorialModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  TutorialPagination? pagination;

/// Create a copy of TutorialListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TutorialListResponseCopyWith<_TutorialListResponse> get copyWith => __$TutorialListResponseCopyWithImpl<_TutorialListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TutorialListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TutorialListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data),pagination);

@override
String toString() {
  return 'TutorialListResponse(success: $success, message: $message, data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$TutorialListResponseCopyWith<$Res> implements $TutorialListResponseCopyWith<$Res> {
  factory _$TutorialListResponseCopyWith(_TutorialListResponse value, $Res Function(_TutorialListResponse) _then) = __$TutorialListResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, List<TutorialModel> data, TutorialPagination? pagination
});


@override $TutorialPaginationCopyWith<$Res>? get pagination;

}
/// @nodoc
class __$TutorialListResponseCopyWithImpl<$Res>
    implements _$TutorialListResponseCopyWith<$Res> {
  __$TutorialListResponseCopyWithImpl(this._self, this._then);

  final _TutorialListResponse _self;
  final $Res Function(_TutorialListResponse) _then;

/// Create a copy of TutorialListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,Object? pagination = freezed,}) {
  return _then(_TutorialListResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<TutorialModel>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as TutorialPagination?,
  ));
}

/// Create a copy of TutorialListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TutorialPaginationCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $TutorialPaginationCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// @nodoc
mixin _$TutorialPendingData {

 bool get tutorialsPending;
/// Create a copy of TutorialPendingData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TutorialPendingDataCopyWith<TutorialPendingData> get copyWith => _$TutorialPendingDataCopyWithImpl<TutorialPendingData>(this as TutorialPendingData, _$identity);

  /// Serializes this TutorialPendingData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TutorialPendingData&&(identical(other.tutorialsPending, tutorialsPending) || other.tutorialsPending == tutorialsPending));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tutorialsPending);

@override
String toString() {
  return 'TutorialPendingData(tutorialsPending: $tutorialsPending)';
}


}

/// @nodoc
abstract mixin class $TutorialPendingDataCopyWith<$Res>  {
  factory $TutorialPendingDataCopyWith(TutorialPendingData value, $Res Function(TutorialPendingData) _then) = _$TutorialPendingDataCopyWithImpl;
@useResult
$Res call({
 bool tutorialsPending
});




}
/// @nodoc
class _$TutorialPendingDataCopyWithImpl<$Res>
    implements $TutorialPendingDataCopyWith<$Res> {
  _$TutorialPendingDataCopyWithImpl(this._self, this._then);

  final TutorialPendingData _self;
  final $Res Function(TutorialPendingData) _then;

/// Create a copy of TutorialPendingData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tutorialsPending = null,}) {
  return _then(_self.copyWith(
tutorialsPending: null == tutorialsPending ? _self.tutorialsPending : tutorialsPending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TutorialPendingData].
extension TutorialPendingDataPatterns on TutorialPendingData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TutorialPendingData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TutorialPendingData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TutorialPendingData value)  $default,){
final _that = this;
switch (_that) {
case _TutorialPendingData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TutorialPendingData value)?  $default,){
final _that = this;
switch (_that) {
case _TutorialPendingData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool tutorialsPending)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TutorialPendingData() when $default != null:
return $default(_that.tutorialsPending);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool tutorialsPending)  $default,) {final _that = this;
switch (_that) {
case _TutorialPendingData():
return $default(_that.tutorialsPending);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool tutorialsPending)?  $default,) {final _that = this;
switch (_that) {
case _TutorialPendingData() when $default != null:
return $default(_that.tutorialsPending);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TutorialPendingData implements TutorialPendingData {
  const _TutorialPendingData({this.tutorialsPending = false});
  factory _TutorialPendingData.fromJson(Map<String, dynamic> json) => _$TutorialPendingDataFromJson(json);

@override@JsonKey() final  bool tutorialsPending;

/// Create a copy of TutorialPendingData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TutorialPendingDataCopyWith<_TutorialPendingData> get copyWith => __$TutorialPendingDataCopyWithImpl<_TutorialPendingData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TutorialPendingDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TutorialPendingData&&(identical(other.tutorialsPending, tutorialsPending) || other.tutorialsPending == tutorialsPending));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tutorialsPending);

@override
String toString() {
  return 'TutorialPendingData(tutorialsPending: $tutorialsPending)';
}


}

/// @nodoc
abstract mixin class _$TutorialPendingDataCopyWith<$Res> implements $TutorialPendingDataCopyWith<$Res> {
  factory _$TutorialPendingDataCopyWith(_TutorialPendingData value, $Res Function(_TutorialPendingData) _then) = __$TutorialPendingDataCopyWithImpl;
@override @useResult
$Res call({
 bool tutorialsPending
});




}
/// @nodoc
class __$TutorialPendingDataCopyWithImpl<$Res>
    implements _$TutorialPendingDataCopyWith<$Res> {
  __$TutorialPendingDataCopyWithImpl(this._self, this._then);

  final _TutorialPendingData _self;
  final $Res Function(_TutorialPendingData) _then;

/// Create a copy of TutorialPendingData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tutorialsPending = null,}) {
  return _then(_TutorialPendingData(
tutorialsPending: null == tutorialsPending ? _self.tutorialsPending : tutorialsPending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$TutorialPendingResponse {

 bool get success; TutorialPendingData get data;
/// Create a copy of TutorialPendingResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TutorialPendingResponseCopyWith<TutorialPendingResponse> get copyWith => _$TutorialPendingResponseCopyWithImpl<TutorialPendingResponse>(this as TutorialPendingResponse, _$identity);

  /// Serializes this TutorialPendingResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TutorialPendingResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'TutorialPendingResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $TutorialPendingResponseCopyWith<$Res>  {
  factory $TutorialPendingResponseCopyWith(TutorialPendingResponse value, $Res Function(TutorialPendingResponse) _then) = _$TutorialPendingResponseCopyWithImpl;
@useResult
$Res call({
 bool success, TutorialPendingData data
});


$TutorialPendingDataCopyWith<$Res> get data;

}
/// @nodoc
class _$TutorialPendingResponseCopyWithImpl<$Res>
    implements $TutorialPendingResponseCopyWith<$Res> {
  _$TutorialPendingResponseCopyWithImpl(this._self, this._then);

  final TutorialPendingResponse _self;
  final $Res Function(TutorialPendingResponse) _then;

/// Create a copy of TutorialPendingResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as TutorialPendingData,
  ));
}
/// Create a copy of TutorialPendingResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TutorialPendingDataCopyWith<$Res> get data {
  
  return $TutorialPendingDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [TutorialPendingResponse].
extension TutorialPendingResponsePatterns on TutorialPendingResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TutorialPendingResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TutorialPendingResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TutorialPendingResponse value)  $default,){
final _that = this;
switch (_that) {
case _TutorialPendingResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TutorialPendingResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TutorialPendingResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  TutorialPendingData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TutorialPendingResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  TutorialPendingData data)  $default,) {final _that = this;
switch (_that) {
case _TutorialPendingResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  TutorialPendingData data)?  $default,) {final _that = this;
switch (_that) {
case _TutorialPendingResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TutorialPendingResponse implements TutorialPendingResponse {
  const _TutorialPendingResponse({required this.success, required this.data});
  factory _TutorialPendingResponse.fromJson(Map<String, dynamic> json) => _$TutorialPendingResponseFromJson(json);

@override final  bool success;
@override final  TutorialPendingData data;

/// Create a copy of TutorialPendingResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TutorialPendingResponseCopyWith<_TutorialPendingResponse> get copyWith => __$TutorialPendingResponseCopyWithImpl<_TutorialPendingResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TutorialPendingResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TutorialPendingResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'TutorialPendingResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$TutorialPendingResponseCopyWith<$Res> implements $TutorialPendingResponseCopyWith<$Res> {
  factory _$TutorialPendingResponseCopyWith(_TutorialPendingResponse value, $Res Function(_TutorialPendingResponse) _then) = __$TutorialPendingResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, TutorialPendingData data
});


@override $TutorialPendingDataCopyWith<$Res> get data;

}
/// @nodoc
class __$TutorialPendingResponseCopyWithImpl<$Res>
    implements _$TutorialPendingResponseCopyWith<$Res> {
  __$TutorialPendingResponseCopyWithImpl(this._self, this._then);

  final _TutorialPendingResponse _self;
  final $Res Function(_TutorialPendingResponse) _then;

/// Create a copy of TutorialPendingResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = null,}) {
  return _then(_TutorialPendingResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as TutorialPendingData,
  ));
}

/// Create a copy of TutorialPendingResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TutorialPendingDataCopyWith<$Res> get data {
  
  return $TutorialPendingDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
