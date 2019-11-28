/*
*  Filename    :   carmelite.dart
*  Purpose     :   Priest model
*  Created     :   2019-07-24 15:38 by Detective Conan
*	 Updated			:   25/09/2019 4:40 PM PM by Detective Conan
*	 Changes			:   Renamed to Carmelite. This model is not just for Priest
*                   this can be used for Pastor and nun
*/

import 'package:json_annotation/json_annotation.dart';

part 'carmelite.g.dart';

@JsonSerializable()
class Carmelite {
  Carmelite(
      this.id,
      this.branchId,
      this.name,
      this.position,
      this.congregation,
      this.sequence,
      this.mediaId,
      this.mediaPath,
      this.typeId,
      this.typeName,
      this.dtCreated,
      this.dtUpdated,
      this.createdBy,
      this.updatedBy);

  final id;

  @JsonKey(name: "branch_id")
  final String branchId;
  final name;
  final position;
  final congregation;
  final sequence;
  @JsonKey(name: "media_id")
  final mediaId;
  @JsonKey(name: "media_path")
  final mediaPath;
  @JsonKey(name: "type_id")
  final typeId;
  @JsonKey(name: "type_name")
  final typeName;
  @JsonKey(name: "dt_created")
  final dtCreated;
  @JsonKey(name: "dt_updated")
  final dtUpdated;
  @JsonKey(name: "created_by")
  final createdBy;
  @JsonKey(name: "updated_by")
  final updatedBy;

  factory Carmelite.fromJson(Map<String, dynamic> json) => _$CarmeliteFromJson(json);

  Map<String, dynamic> toJson() => _$CarmeliteToJson(this);
}

@JsonSerializable()
class DataCarmelite{
  DataCarmelite(
      this.draw,
      this.recordsTotal,
      this.recordsFiltered,
      this.data,
      );

  final int draw;
  final int recordsTotal;
  final int recordsFiltered;
  final List<Carmelite> data;

  factory DataCarmelite.fromJson(Map<String, dynamic> json) => _$DataCarmeliteFromJson(json);

  Map<String, dynamic> toJson() => _$DataCarmeliteToJson(this);
}
