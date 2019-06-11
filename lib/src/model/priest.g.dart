// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'priest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Priest _$PriestFromJson(Map<String, dynamic> json) {
  return Priest(json['id'] as int, json['name'] as String,
      json['position'] as String, json['cover_photo'] as String);
}

Map<String, dynamic> _$PriestToJson(Priest instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'position': instance.position,
      'cover_photo': instance.cover_photo
    };
