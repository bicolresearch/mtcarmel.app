/*
*  Filename    :   prayer_request.dart
*  Purpose     :	
*  Created     :   2019-08-20 16:14 by Detective Conan
*  Updated     :   2019-08-20 16:14 by Detective Conan 
*  Changes     :
*/

import 'package:json_annotation/json_annotation.dart';

part 'prayer_request.g.dart';

@JsonSerializable()
class PrayerRequest {
  PrayerRequest(this.id, this.prayer, this.statusId, this.statusName,
      this.dtCreated, this.dtUpdated, this.createdBy, this.updatedBy);

  @JsonKey(name: "id")
  final String id;
  final String prayer;
  @JsonKey(name: "status_id")
  final statusId;
  @JsonKey(name: "status_name")
  final statusName;
  @JsonKey(name: "dt_created")
  final dtCreated;
  @JsonKey(name: "dt_updated")
  final dtUpdated;
  @JsonKey(name: "created_by")
  final createdBy;
  @JsonKey(name: "updated_by")
  final updatedBy;

  factory PrayerRequest.fromJson(Map<String, dynamic> json) =>
      _$PrayerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PrayerRequestToJson(this);
}

@JsonSerializable()
class DataActionPrayerRequest {
  DataActionPrayerRequest(this.data, this.actions);

  final DataPrayerRequest data;
  final Map<String, String> actions;

  factory DataActionPrayerRequest.fromJson(Map<String, dynamic> json) =>
      _$DataActionPrayerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DataActionPrayerRequestToJson(this);
}

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
