/*
*   Filename    :   branch.dart
*   Purpose     :
*   Created     :   02/09/2019 1:19 PM by Detective Conan
*   Updated     :   02/09/2019 1:19 PM by Detective Conan
*   Changes     :   
*/

import 'package:json_annotation/json_annotation.dart';

part 'branch.g.dart';

@JsonSerializable()
class DataBranch{
  DataBranch(
      this.draw,
      this.recordsTotal,
      this.recordsFiltered,
      this.data,
      );

  final int draw;
  final int recordsTotal;
  final int recordsFiltered;
  final List<Branch> data;

  factory DataBranch.fromJson(Map<String, dynamic> json) => _$DataBranchFromJson(json);

  Map<String, dynamic> toJson() => _$DataBranchToJson(this);
}



@JsonSerializable()
class Branch {
  Branch(
      {this.id,
      this.name,
      this.description,
      this.churchOrderId,
      this.churchOrderName,
      this.dtCreated,
      this.dtUpdated,
      this.createdBy,
      this.updatedBy});

  final id;
  final name;
  final description;
  @JsonKey(name: "church_order_id")
  final churchOrderId;
  @JsonKey(name: "church_order_name")
  final churchOrderName;
  @JsonKey(name: "dt_created")
  final dtCreated;
  @JsonKey(name: "dt_updated")
  final dtUpdated;
  @JsonKey(name: "created_by")
  final createdBy;
  @JsonKey(name: "updated_by")
  final updatedBy;

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);

  Map<String, dynamic> toJson() => _$BranchToJson(this);
}