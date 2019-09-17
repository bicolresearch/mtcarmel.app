/*
*	Filename		:	pastor.dart
*	Purpose			:	Model for pastor
* Created			: 2019-06-11 15:59:36 by Detective Conan
*  Updated     :   2019-07-25 08:34 by Detective conan 
*  Changes     :   Added Author
*/
import 'package:json_annotation/json_annotation.dart';

part 'pastor.g.dart';

@JsonSerializable()
class Pastor {
  Pastor(
      this.id,
      this.branchId,
      this.typeId,
      this.mediaId,
      this.name,
      this.position,
      this.congregation,
      this.rank,
      this.dtCreated,
      this.dtUpdated,
      this.mediaPath,
      this.typeName,
      this.createdBy,
      this.updatedBy);

  final String id;
  @JsonKey(name: "branch_id")
  final String branchId;
  @JsonKey(name: "type_id")
  final String typeId;
  @JsonKey(name: "media_id")
  final String mediaId;
  final String name;
  final String position;
  final String congregation;
  final String rank;
  @JsonKey(name: "dt_created")
  final String dtCreated;
  @JsonKey(name: "dt_updated")
  final String dtUpdated;
  @JsonKey(name: "media_path")
  final String mediaPath;
  @JsonKey(name: "type_name")
  final String typeName;
  @JsonKey(name: "created_by")
  final String createdBy;
  @JsonKey(name: "updated_by")
  final String updatedBy;

  factory Pastor.fromJson(Map<String, dynamic> json) => _$PastorFromJson(json);

  Map<String, dynamic> toJson() => _$PastorToJson(this);
}
