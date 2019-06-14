/*
*	Filename		:	church_schedule.dart
*	Purpose			:	Model for the church schedules
* Created			: 2019-06-14 09:26:49 by Detective Conan
*	Updated			: 2019-06-14 09:26:49 by Detective Conan 
*	Changes			:
*/

import 'package:json_annotation/json_annotation.dart';

part 'church_schedule.g.dart';

@JsonSerializable()
class ChurchSchedule{
  ChurchSchedule(
    this.id,
  this.schedule_type,
  this.schedule_name,
  this.day,
  this.time_from,
  this.time_to,
  this.language,
  this.language_name,
  );
  
  final int id;
  final String schedule_type;
  final String schedule_name;
  final String day;
  final String time_from;
  final String time_to;
  final String language;
  final String language_name;

  factory ChurchSchedule.fromJson(Map<String, dynamic> json) => _$ChurchScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ChurchScheduleToJson(this);
}


// part 'ad.g.dart';

// @JsonSerializable()
// class Ad{
//   Ad(this.id,this.icon);
  
//   final int id;
//   final String icon;

//   factory Ad.fromJson(Map<String, dynamic> json) => _$AdFromJson(json);

//   Map<String, dynamic> toJson() => _$AdToJson(this);
// }
