// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maps.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Maps _$MapsFromJson(Map<String, dynamic> json) {
  return Maps(json['id'] as String, json['branch_id'] as String,
      json['lat'] as String, json['lng'] as String);
}

Map<String, dynamic> _$MapsToJson(Maps instance) => <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'lat': instance.lat,
      'lng': instance.lng
    };
