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
class Branch {
  Branch(this.id, this.branchId, this.newsFeed, this.sendHelp, this.services,
      this.transparency, this.profile);

  final id;
  @JsonKey(name: "branch_id")
  final branchId;
  @JsonKey(name: "news_feed")
  final newsFeed;
  @JsonKey(name: "send_help")
  final sendHelp;
  final services;
  final transparency;
  final profile;

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);

  Map<String, dynamic> toJson() => _$BranchToJson(this);
}
