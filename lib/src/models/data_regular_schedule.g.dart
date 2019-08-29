// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_regular_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataRegularSchedule _$DataScheduleFromJson(Map<String, dynamic> json) {
  return DataRegularSchedule(
    json['draw'] as int,
    json['recordsTotal'] as int,
    json['recordsFiltered'] as int,
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : ChurchRegularSchedule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataScheduleToJson(DataRegularSchedule instance) =>
    <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data,
    };
