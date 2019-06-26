import 'package:json_annotation/json_annotation.dart';

part 'ad.g.dart';

@JsonSerializable()
class Ad {
  Ad(this.id, this.branchId, this.name, this.coverPhoto);

  final String id;
  @JsonKey(name: "branch_id")
  final String branchId;
  final String name;
  @JsonKey(name: 'cover_photo')
  final String coverPhoto;

  factory Ad.fromJson(Map<String, dynamic> json) => _$AdFromJson(json);

  Map<String, dynamic> toJson() => _$AdToJson(this);
}
