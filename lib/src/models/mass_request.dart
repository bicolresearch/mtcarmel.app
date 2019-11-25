/*
*  Filename    :   mass_request.dart
*  Purpose     :	
*  Created     :   2019-08-20 15:59 by Detective Conan
*  Updated     :   2019-08-20 15:59 by Detective Conan 
*  Changes     :
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
      this.status,
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
  @JsonKey(name: "status")
  final String status;
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

