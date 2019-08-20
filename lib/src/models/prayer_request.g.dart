// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerRequest _$PrayerRequestFromJson(Map<String, dynamic> json) {
  return PrayerRequest(
    json['id'] as String,
    json['prayer'] as String,
    json['status'] as String,
    json['posted_on'] as String,
    json['updated_on'] as String,
    json['author'] as String,
  );
}

Map<String, dynamic> _$PrayerRequestToJson(PrayerRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prayer': instance.prayer,
      'status': instance.status,
      'posted_on': instance.postedOn,
      'updated_on': instance.updatedOn,
      'author': instance.author,
    };
