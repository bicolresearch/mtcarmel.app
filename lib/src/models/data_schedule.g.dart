// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataSchedule _$DataScheduleFromJson(Map<String, dynamic> json) {
  return DataSchedule(
    json['draw'] as int,
    json['recordsTotal'] as int,
    json['recordsFiltered'] as int,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Schedule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataScheduleToJson(DataSchedule instance) =>
    <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data,
    };
