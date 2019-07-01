// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feed _$FeedFromJson(Map<String, dynamic> json) {
  return Feed(
      json['id'] as String,
      json['branch_id'] as String,
      json['title'] as String,
      json['content'] as String,
      json['cover_photo'] as String);
}

Map<String, dynamic> _$FeedToJson(Feed instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'branch_id': instance.branchId,
      'cover_photo': instance.coverPhoto
    };
