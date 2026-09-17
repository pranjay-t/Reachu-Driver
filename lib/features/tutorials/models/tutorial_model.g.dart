// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutorial_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TutorialModel _$TutorialModelFromJson(
  Map<String, dynamic> json,
) => _TutorialModel(
  id: json['_id'] as String,
  title: json['title'] as String? ?? '',
  description: json['description'] as String? ?? '',
  videoUrl: json['videoUrl'] as String? ?? '',
  videoSource: json['videoSource'] as String? ?? 'youtube',
  durationSeconds: (json['durationSeconds'] as num?)?.toInt() ?? 0,
  targetAudience: json['targetAudience'] as String? ?? 'Both',
  userRole:
      (json['userRole'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  category: json['category'] as String? ?? 'General',
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  language: json['language'] as String? ?? 'en',
  platforms:
      (json['platforms'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
  isFeatured: json['isFeatured'] as bool? ?? false,
  isMandatory: json['isMandatory'] as bool? ?? false,
  views: (json['views'] as num?)?.toInt() ?? 0,
  minAppVersion: json['minAppVersion'] as String?,
  publishedAt: json['publishedAt'] == null
      ? null
      : DateTime.parse(json['publishedAt'] as String),
  status: json['status'] as String? ?? 'Active',
  createdBy: json['createdBy'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  watched: json['watched'] as bool? ?? false,
);

Map<String, dynamic> _$TutorialModelToJson(_TutorialModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'videoUrl': instance.videoUrl,
      'videoSource': instance.videoSource,
      'durationSeconds': instance.durationSeconds,
      'targetAudience': instance.targetAudience,
      'userRole': instance.userRole,
      'category': instance.category,
      'tags': instance.tags,
      'language': instance.language,
      'platforms': instance.platforms,
      'sortOrder': instance.sortOrder,
      'isFeatured': instance.isFeatured,
      'isMandatory': instance.isMandatory,
      'views': instance.views,
      'minAppVersion': instance.minAppVersion,
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'status': instance.status,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'watched': instance.watched,
    };

_TutorialPagination _$TutorialPaginationFromJson(Map<String, dynamic> json) =>
    _TutorialPagination(
      total: (json['total'] as num?)?.toInt() ?? 0,
      page: (json['page'] as num?)?.toInt() ?? 1,
      limit: (json['limit'] as num?)?.toInt() ?? 10,
      totalPages: (json['totalPages'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$TutorialPaginationToJson(_TutorialPagination instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
    };

_TutorialListResponse _$TutorialListResponseFromJson(
  Map<String, dynamic> json,
) => _TutorialListResponse(
  success: json['success'] as bool,
  message: json['message'] as String? ?? '',
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => TutorialModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  pagination: json['pagination'] == null
      ? null
      : TutorialPagination.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TutorialListResponseToJson(
  _TutorialListResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'pagination': instance.pagination,
};

_TutorialPendingData _$TutorialPendingDataFromJson(Map<String, dynamic> json) =>
    _TutorialPendingData(
      tutorialsPending: json['tutorialsPending'] as bool? ?? false,
    );

Map<String, dynamic> _$TutorialPendingDataToJson(
  _TutorialPendingData instance,
) => <String, dynamic>{'tutorialsPending': instance.tutorialsPending};

_TutorialPendingResponse _$TutorialPendingResponseFromJson(
  Map<String, dynamic> json,
) => _TutorialPendingResponse(
  success: json['success'] as bool,
  data: TutorialPendingData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TutorialPendingResponseToJson(
  _TutorialPendingResponse instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};
