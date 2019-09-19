/*
*   Filename    :   branch_location.dart
*   Purpose     :
*   Created     :   19/09/2019 4:51 PM by Detective Conan
*   Updated     :   19/09/2019 4:51 PM by Detective Conan
*   Changes     :   
*/

import 'package:json_annotation/json_annotation.dart';

part 'branch_location.g.dart';

@JsonSerializable()
class BranchLocation {
  BranchLocation(this.id, this.name, this.description, this.dtCreated,
      this.dtUpdated, this.createdBy, this.updatedBy);

  final id;
  final name;

  final description;
  @JsonKey(name: "dt_created")
  final dtCreated;
  @JsonKey(name: "dt_updated")
  final dtUpdated;
  @JsonKey(name: "created_by")
  final createdBy;
  @JsonKey(name: "updated_by")
  final updatedBy;

  factory BranchLocation.fromJson(Map<String, dynamic> json) =>
      _$BranchLocationFromJson(json);

  Map<String, dynamic> toJson() => _$BranchLocationToJson(this);
}

@JsonSerializable()
class DataBranchLocation {
  DataBranchLocation(
      this.draw, this.recordsTotal, this.recordsFiltered, this.data);

  final draw;
  @JsonKey(name: "recordsTotal")
  final recordsTotal;
  @JsonKey(name: "recordsFiltered")
  final recordsFiltered;
  final List<BranchLocation> data;

  factory DataBranchLocation.fromJson(Map<String, dynamic> json) =>
      _$DataBranchLocationFromJson(json);

  Map<String, dynamic> toJson() => _$DataBranchLocationToJson(this);
}
