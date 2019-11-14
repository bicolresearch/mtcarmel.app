// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerRequest _$PrayerRequestFromJson(Map<String, dynamic> json) {
  return PrayerRequest(
    json['id'] as String,
    json['prayer'] as String,
    json['status_id'],
    json['status_name'],
    json['dt_created'],
    json['dt_updated'],
    json['created_by'],
    json['updated_by'],
  );
}

Map<String, dynamic> _$PrayerRequestToJson(PrayerRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prayer': instance.prayer,
      'status_id': instance.statusId,
      'status_name': instance.statusName,
      'dt_created': instance.dtCreated,
      'dt_updated': instance.dtUpdated,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
