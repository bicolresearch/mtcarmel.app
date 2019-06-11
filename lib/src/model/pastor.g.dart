// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pastor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pastor _$PastorFromJson(Map<String, dynamic> json) {
  return Pastor(
      json['id'] as int, json['name'] as String, json['position'] as String);
}

Map<String, dynamic> _$PastorToJson(Pastor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'position': instance.position
    };
