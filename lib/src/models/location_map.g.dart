// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationMap _$LocationMapFromJson(Map<String, dynamic> json) {
  return LocationMap(
    (json['map_center'] as List)
        ?.map((e) =>
            e == null ? null : MapCenter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['map_boundaries'] as List)
        ?.map((e) => e == null
            ? null
            : MapCoordinate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LocationMapToJson(LocationMap instance) =>
    <String, dynamic>{
      'map_center': instance.mapCenter,
      'map_boundaries': instance.mapBoundaries,
    };

MapCoordinate _$MapCoordinateFromJson(Map<String, dynamic> json) {
  return MapCoordinate(
    json['id'] as String,
    json['branch_id'] as String,
    json['lat'] as String,
    json['lng'] as String,
  );
}

Map<String, dynamic> _$MapCoordinateToJson(MapCoordinate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'lat': instance.lat,
      'lng': instance.lng,
    };

MapCenter _$MapCenterFromJson(Map<String, dynamic> json) {
  return MapCenter(
    json['id'] as String,
    json['branch_id'] as String,
    json['lat_center'] as String,
    json['lng_center'] as String,
  );
}

Map<String, dynamic> _$MapCenterToJson(MapCenter instance) => <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'lat_center': instance.lat_center,
      'lng_center': instance.lng_center,
    };
