// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_prayer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
