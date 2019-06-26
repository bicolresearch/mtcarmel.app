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
  this.branchId,
  this.name,
  this.day,
  this.language,
  this.timeFrom,
  this.timeTo,
  );
  
  final String id;
  @JsonKey(name: "branch_id")
  final String branchId;
  final String name;  
  final String day;  
  final String language;
  @JsonKey(name: "time_from")
  final String timeFrom;
  @JsonKey(name: "time_to")
  final String timeTo;

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
