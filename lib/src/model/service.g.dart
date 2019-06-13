// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return Service(
      json['service_name'] as String, json['service_description'] as String);
}

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'service_name': instance.service_name,
      'service_description': instance.service_description
    };
