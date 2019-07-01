/*
*	Filename		:	location_map.dart
*	Purpose			:	model for the church location map
* Created			: 2019-06-21 17:52:50 by Detective Conan
*	Updated			:	2019-07-01 15:13:25 by Detective Conan
*	Changes			: Model for new api
*/

import 'package:json_annotation/json_annotation.dart';

part 'location_map.g.dart';

@JsonSerializable()
class LocationMap{


  LocationMap(this.mapCenter, this.mapBoundaries);

  @JsonKey(name: "map_center")
  final List<MapCenter> mapCenter;
  @JsonKey(name: "map_boundaries")
  final List<MapCoordinate> mapBoundaries;
  
  factory LocationMap.fromJson(Map<String, dynamic> json) => _$LocationMapFromJson(json);

  Map<String, dynamic> toJson() => _$LocationMapToJson(this);

}

@JsonSerializable()
class MapCoordinate {

  MapCoordinate(this.id, this.branchId, this.lat, this.lng);

  final String id;
  @JsonKey(name: "branch_id")
  final String branchId;
  final String lat;
  final String lng;

  factory MapCoordinate.fromJson(Map<String, dynamic> json) => _$MapCoordinateFromJson(json);

  Map<String, dynamic> toJson() => _$MapCoordinateToJson(this);
}

@JsonSerializable()
class MapCenter {

  MapCenter(this.id, this.branchId, this.lat_center, this.lng_center);

  final String id;
  @JsonKey(name: "branch_id")
  final String branchId;
  @JsonKey(name: "lat_center")
  final String lat_center;
  @JsonKey(name: "lng_center")
  final String lng_center;

  factory MapCenter.fromJson(Map<String, dynamic> json) => _$MapCenterFromJson(json);

  Map<String, dynamic> toJson() => _$MapCenterToJson(this);
}