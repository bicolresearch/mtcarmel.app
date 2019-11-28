/*
*  Filename    :   mass_request.dart
*  Purpose     :	
*  Created     :   2019-08-20 15:59 by Detective Conan
*	 Updated			:   28/11/2019 12:30 PM PM by Detective Conan
*	 Changes			:   Renamed status to statusName
*/

import 'package:json_annotation/json_annotation.dart';

part 'mass_request.g.dart';

@JsonSerializable()
class MassRequest {
  MassRequest(
      this.id,
      this.name,
      this.purposeMass,
      this.dtOffered,
      this.timeOffered,
      this.statusName,
      this.postedOn,
      this.updatedOn,
      this.author);

  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "purpose_mass")
  final String purposeMass;
  @JsonKey(name: "dt_offered")
  final String dtOffered;
  @JsonKey(name: "time_offered")
  final String timeOffered;
  @JsonKey(name: "status_name")
  final String statusName;
  @JsonKey(name: "posted_on")
  final String postedOn;
  @JsonKey(name: "updated_on")
  final String updatedOn;
  @JsonKey(name: "author")
  final String author;

  factory MassRequest.fromJson(Map<String, dynamic> json) =>
      _$MassRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MassRequestToJson(this);
}

@JsonSerializable()
class DataActionMassRequest {
  DataActionMassRequest(this.data, this.actions);

  final DataMassRequest data;
  final Map<String, String> actions;

  factory DataActionMassRequest.fromJson(Map<String, dynamic> json) =>
      _$DataActionMassRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DataActionMassRequestToJson(this);
}

@JsonSerializable()
class DataMassRequest {
  DataMassRequest(
      this.draw,
      this.recordsTotal,
      this.recordsFiltered,
      this.data,
      );

  final int draw;
  final int recordsTotal;
  final int recordsFiltered;
  final List<MassRequest> data;

  factory DataMassRequest.fromJson(Map<String, dynamic> json) =>
      _$DataMassRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DataMassRequestToJson(this);
}
