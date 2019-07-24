/*
*  Filename    :   priest.dart
*  Purpose     :   Priest model
*  Created     :   2019-07-24 15:38 by Detective Conan
*  Updated     :   2019-07-24 15:38 by Detective Conan 
*  Changes     :   
*/

import 'package:json_annotation/json_annotation.dart';

part 'priest.g.dart';

@JsonSerializable()
class Priest {
  Priest(this.id, this.branchId, this.name, this.position, this.rank,
      this.coverPhoto, this.postedOn, this.updatedOn);

  final String id;
  @JsonKey(name: "branch_id")
  final String branchId;
  final String name;
  final String position;
  final String rank;
  @JsonKey(name: "posted_on")
  final String postedOn;
  @JsonKey(name: "updated_on")
  final String updatedOn;
  @JsonKey(name: "cover_photo")
  final String coverPhoto;

  factory Priest.fromJson(Map<String, dynamic> json) => _$PriestFromJson(json);

  Map<String, dynamic> toJson() => _$PriestToJson(this);
}
