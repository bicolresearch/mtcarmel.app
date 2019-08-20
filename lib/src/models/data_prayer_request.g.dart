// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_prayer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
