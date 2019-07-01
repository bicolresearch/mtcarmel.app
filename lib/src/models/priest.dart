import 'package:json_annotation/json_annotation.dart';

part 'priest.g.dart';

@JsonSerializable()
class Priest{
  Priest(this.id, this.branchId, this.name, this.position, this.rank, this.coverPhoto);
  
  final String id;
  @JsonKey(name: "branch_id")
  final String branchId;
  final String name;
  final String position;
  final String rank;
  @JsonKey(name: "cover_photo")
  final String coverPhoto;

  factory Priest.fromJson(Map<String, dynamic> json) => _$PriestFromJson(json);

  Map<String, dynamic> toJson() => _$PriestToJson(this);
}

