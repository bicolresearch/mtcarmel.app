/*
*  Filename    :   send_help.dart.dart
*  Purpose     :	 Model for type of donation
*  Created     :   2019-07-02 16:13 by Detective Conan
*  Updated     :   2019-07-02 16:13 by Detective Conan 
*  Changes     :
*/

import 'package:json_annotation/json_annotation.dart';

part 'send_help.g.dart';

@JsonSerializable()
class SendHelp {
  final String id;
  String name;
  @JsonKey(name: "branch_id")
  final String branchId;
  final String description;
  final String schedule;
  @JsonKey(name: "cover_photo")
  final String coverPhoto;

  SendHelp(this.id, this.name, this.branchId, this.description, this.schedule,
      this.coverPhoto);

  factory SendHelp.fromJson(Map<String, dynamic> json) =>
      _$SendHelpFromJson(json);

  Map<String, dynamic> toJson() => _$SendHelpToJson(this);
}
