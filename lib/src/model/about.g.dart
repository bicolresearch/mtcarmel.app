// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

About _$AboutFromJson(Map<String, dynamic> json) {
  return About(
      json['id'] as int,
      json['titular'] as String,
      json['diocese'] as String,
      json['date_of_establishment'] as String,
      json['feast_Day'] as String);
}

Map<String, dynamic> _$AboutToJson(About instance) => <String, dynamic>{
      'id': instance.id,
      'titular': instance.titular,
      'diocese': instance.diocese,
      'date_of_establishment': instance.date_of_establishment,
      'feast_Day': instance.feast_Day
    };
