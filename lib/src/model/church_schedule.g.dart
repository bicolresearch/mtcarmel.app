// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'church_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChurchSchedule _$ChurchScheduleFromJson(Map<String, dynamic> json) {
  return ChurchSchedule(
      json['id'] as String,
      json['branch_id'] as String,
      json['name'] as String,
      json['day'] as String,
      json['language'] as String,
      json['time_from'] as String,
      json['time_to'] as String);
}

Map<String, dynamic> _$ChurchScheduleToJson(ChurchSchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'name': instance.name,
      'day': instance.day,
      'language': instance.language,
      'time_from': instance.timeFrom,
      'time_to': instance.timeTo
    };
