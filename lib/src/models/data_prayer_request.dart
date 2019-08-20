/*
*  Filename    :   data_prayer_request.dart
*  Purpose     :	
*  Created     :   2019-08-20 16:16 by Detective Conan
*  Updated     :   2019-08-20 16:16 by Detective Conan 
*  Changes     :
*/


import 'package:json_annotation/json_annotation.dart';
import 'package:mt_carmel_app/src/models/prayer_request.dart';

part 'data_prayer_request.g.dart';

@JsonSerializable()
class DataPrayerRequest {

  DataPrayerRequest(
      this.draw,
      this.recordsTotal,
      this.recordsFiltered,
      this.data,
      );

  final int draw;
  final int recordsTotal;
  final int recordsFiltered;
  final List<PrayerRequest> data;

  factory DataPrayerRequest.fromJson(Map<String, dynamic> json) =>
      _$DataPrayerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DataPrayerRequestToJson(this);
}