// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return Service(
      json['id'] as String,
      json['branch_id'] as String,
      json['name'] as String,
      json['description'] as String,
      json['cover_photo'] as String);
}

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'name': instance.name,
      'description': instance.description,
      'cover_photo': instance.coverPhoto
    };
