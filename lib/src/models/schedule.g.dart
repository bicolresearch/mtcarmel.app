// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return Schedule(
    json['id'] as String,
    json['branch_id'] as String,
    json['name'] as String,
    json['day'] as String,
    json['language'] as String,
    json['time_from'] as String,
    json['time_to'] as String,
    json['posted_on'] as String,
    json['updated_on'] as String,
    json['author'] as String,
  );
}

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'name': instance.name,
      'day': instance.day,
      'language': instance.language,
      'time_from': instance.timeFrom,
      'time_to': instance.timeTo,
      'posted_on': instance.postedOn,
      'updated_on': instance.updatedOn,
      'author': instance.author,
    };
