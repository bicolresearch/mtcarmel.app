import 'package:json_annotation/json_annotation.dart';

part 'service_item.g.dart';

@JsonSerializable()
class ServiceItem{
  ServiceItem(
  this.id,
  this.branchId,
  this.name,
  this.description,
  this.coverPhoto,);
  
  final String id;
  @JsonKey(name: "branch_id")
  final String branchId;
  final String name;
  final String description;
  @JsonKey(name: "cover_photo")
  final String coverPhoto;

  factory ServiceItem.fromJson(Map<String, dynamic> json) => _$ServiceItemFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceItemToJson(this);
}
