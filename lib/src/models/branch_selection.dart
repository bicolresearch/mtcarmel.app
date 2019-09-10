/*
*   Filename    :   branch_selection.dart
*   Purpose     :
*   Created     :   08/09/2019 2:14 AM by Detective Conan
*   Updated     :   08/09/2019 2:14 AM by Detective Conan
*   Changes     :   
*/

import 'package:json_annotation/json_annotation.dart';

part 'branch_selection.g.dart';

@JsonSerializable()
class BranchId {
  final id;
  @JsonKey(name: "branch_id")
  final branchId;
  @JsonKey(name: "branch_name")
  final branchName;

  BranchId(this.id, this.branchId, this.branchName);

  factory BranchId.fromJson(Map<String, dynamic> json) =>
      _$BranchIdFromJson(json);

  Map<String, dynamic> toJson() => _$BranchIdToJson(this);
}
