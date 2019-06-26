import 'package:json_annotation/json_annotation.dart';

part 'maps.g.dart';

@JsonSerializable()
class Maps{


  Maps(this.id, this.branchId, this.lat, this.lng);

  final String id;  
  @JsonKey(name: "branch_id")
  final String branchId;
  final String lat;
  final String lng;
  
  factory Maps.fromJson(Map<String, dynamic> json) => _$MapsFromJson(json);

  Map<String, dynamic> toJson() => _$MapsToJson(this);

}
