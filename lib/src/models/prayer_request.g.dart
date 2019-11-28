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

DataActionPrayerRequest _$DataActionPrayerRequestFromJson(
    Map<String, dynamic> json) {
  return DataActionPrayerRequest(
    json['data'] == null
        ? null
        : DataPrayerRequest.fromJson(json['data'] as Map<String, dynamic>),
    (json['actions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$DataActionPrayerRequestToJson(
        DataActionPrayerRequest instance) =>
    <String, dynamic>{
      'data': instance.data,
      'actions': instance.actions,
    };

DataPrayerRequest _$DataPrayerRequestFromJson(Map<String, dynamic> json) {
  return DataPrayerRequest(
    json['draw'] as int,
    json['recordsTotal'] as int,
    json['recordsFiltered'] as int,
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : PrayerRequest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataPrayerRequestToJson(DataPrayerRequest instance) =>
    <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data,
    };
