// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

About _$AboutFromJson(Map<String, dynamic> json) {
  return About(
      json['id'] as String,
      json['branch_id'] as String,
      json['titular'] as String,
      json['diocese'] as String,
      json['date_of_establishment'] as String,
      json['feast_Day'] as String,
      json['content'] as String);
}

Map<String, dynamic> _$AboutToJson(About instance) => <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'titular': instance.titular,
      'diocese': instance.diocese,
      'date_of_establishment': instance.dateOfEstablishment,
      'feast_Day': instance.feastDay,
      'content': instance.content
    };