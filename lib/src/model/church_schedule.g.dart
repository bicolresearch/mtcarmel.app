// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'church_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChurchSchedule _$ChurchScheduleFromJson(Map<String, dynamic> json) {
  return ChurchSchedule(
      json['id'] as int,
      json['schedule_type'] as String,
      json['schedule_name'] as String,
      json['day'] as String,
      json['time_from'] as String,
      json['time_to'] as String,
      json['language'] as String,
      json['language_name'] as String);
}

Map<String, dynamic> _$ChurchScheduleToJson(ChurchSchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'schedule_type': instance.schedule_type,
      'schedule_name': instance.schedule_name,
      'day': instance.day,
      'time_from': instance.time_from,
      'time_to': instance.time_to,
      'language': instance.language,
      'language_name': instance.language_name
    };
