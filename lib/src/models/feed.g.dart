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
    json['id'] as String,
    json['branch_id'] as String,
    json['title'] as String,
    json['content'] as String,
    json['cover_photo'] as String,
    json['posted_on'] as String,
    json['author'] as String,
    json['updated_on'] as String,
  );
}

Map<String, dynamic> _$PostDataToJson(PostData instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'posted_on': instance.postedOn,
      'branch_id': instance.branchId,
      'updated_on': instance.updatedOn,
      'cover_photo': instance.coverPhoto,
      'author': instance.author,
    };
