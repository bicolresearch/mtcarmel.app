/*
*	 Filename		 :   schedule.dart
*	 Purpose		 :	 Model for the church schedules
*  Created		 :   2019-06-14 09:26:49 by Detective Conan
*  Updated     :   2019-08-30 16:52 by Detective conan
*  Changes     :   Modified parameters.
*/

import 'package:json_annotation/json_annotation.dart';

part 'schedule.g.dart';

@JsonSerializable()
class Schedule{
  Schedule(
    this.id,
    this.branchId,
    this.name,
    this.day,
    this.language,
    this.timeFrom,
    this.timeTo,
    this.postedOn,
    this.updatedOn,
    this.author,
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
  @JsonKey(name: "posted_on")
  final String postedOn;
  @JsonKey(name: "updated_on")
  final String updatedOn;
  final String author;

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}

@JsonSerializable()
class DataSchedule{
  DataSchedule(
      this.draw,
      this.recordsTotal,
      this.recordsFiltered,
      this.data,
      );

  final int draw;
  final int recordsTotal;
  final int recordsFiltered;
  final List<Schedule> data;

  factory DataSchedule.fromJson(Map<String, dynamic> json) => _$DataScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$DataScheduleToJson(this);
}

