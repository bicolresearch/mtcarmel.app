/*
*  Filename    :   data_schedule.dart
*  Purpose     :	 Model for the records of schedules
*  Created     :   2019-07-24 14:52 by Detective Conan
*  Updated     :   2019-07-24 14:52 by Detective Conan 
*  Changes     :
*/

import 'package:json_annotation/json_annotation.dart';
import 'package:mt_carmel_app/src/models/church_schedule.dart';

part 'data_schedule.g.dart';

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
  final List<ChurchSchedule> data;

  factory DataSchedule.fromJson(Map<String, dynamic> json) => _$DataScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$DataScheduleToJson(this);
}