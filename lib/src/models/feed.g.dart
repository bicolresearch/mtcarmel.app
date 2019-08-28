// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feed _$FeedFromJson(Map<String, dynamic> json) {
  return Feed(
    json['draw'],
    json['recordsTotal'],
    json['recordsFiltered'],
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : PostData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FeedToJson(Feed instance) => <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data,
    };

PostData _$PostDataFromJson(Map<String, dynamic> json) {
  return PostData(
    json['id'],
    json['branch_id'] as String,
    json['media_id'] as String,
    json['title'],
    json['content'],
    json['dt_created'] as String,
    json['dt_updated'] as String,
    json['media_path'] as String,
    json['created_by'] as String,
    json['updated_by'] as String,
  );
}

Map<String, dynamic> _$PostDataToJson(PostData instance) => <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'media_id': instance.mediaId,
      'title': instance.title,
      'content': instance.content,
      'dt_created': instance.dtCreated,
      'dt_updated': instance.dtUpdated,
      'media_path': instance.mediaPath,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
