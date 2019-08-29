/*
*  Filename    :   data_regular_schedule.dart
*  Purpose     :	 Model for the records of schedules
*  Created     :   2019-07-24 14:52 by Detective Conan
*  Updated     :   2019-08-29 10:48 by Detective conan
*  Changes     :   Renamed
*/

import 'package:json_annotation/json_annotation.dart';
import 'package:mt_carmel_app/src/models/church_regular_schedule.dart';

part 'data_regular_schedule.g.dart';

@JsonSerializable()
class DataRegularSchedule{
  DataRegularSchedule(
      this.draw,
      this.recordsTotal,
      this.recordsFiltered,
      this.data,
      );

  final int draw;
  final int recordsTotal;
  final int recordsFiltered;
  final List<ChurchRegularSchedule> data;

  factory DataRegularSchedule.fromJson(Map<String, dynamic> json) => _$DataScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$DataScheduleToJson(this);
}