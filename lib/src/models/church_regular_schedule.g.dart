// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'church_regular_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChurchRegularSchedule _$ChurchScheduleFromJson(Map<String, dynamic> json) {
  return ChurchRegularSchedule(
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

Map<String, dynamic> _$ChurchScheduleToJson(ChurchRegularSchedule instance) =>
    <String, dynamic>{
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
