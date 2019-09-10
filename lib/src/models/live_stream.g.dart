// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_stream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveStream _$LiveStreamFromJson(Map<String, dynamic> json) {
  return LiveStream(
    json['draw'],
    json['recordsTotal'],
    json['recordsFiltered'],
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : LiveStreamData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LiveStreamToJson(LiveStream instance) =>
    <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data,
    };

LiveStreamData _$LiveStreamDataFromJson(Map<String, dynamic> json) {
  return LiveStreamData(
    json['id'],
    json['title'],
    json['description'],
    json['video_id'],
    json['dt_created'],
    json['dt_updated'],
    json['created_by'],
    json['updated_by'],
  );
}

Map<String, dynamic> _$LiveStreamDataToJson(LiveStreamData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'video_id': instance.videoId,
      'dt_created': instance.dtCreated,
      'dt_updated': instance.dtUpdated,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
