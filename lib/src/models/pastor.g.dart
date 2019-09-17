// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pastor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pastor _$PastorFromJson(Map<String, dynamic> json) {
  return Pastor(
    json['id'] as String,
    json['branch_id'] as String,
    json['type_id'] as String,
    json['media_id'] as String,
    json['name'] as String,
    json['position'] as String,
    json['congregation'] as String,
    json['rank'] as String,
    json['dt_created'] as String,
    json['dt_updated'] as String,
    json['media_path'] as String,
    json['type_name'] as String,
    json['created_by'] as String,
    json['updated_by'] as String,
  );
}

Map<String, dynamic> _$PastorToJson(Pastor instance) => <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'type_id': instance.typeId,
      'media_id': instance.mediaId,
      'name': instance.name,
      'position': instance.position,
      'congregation': instance.congregation,
      'rank': instance.rank,
      'dt_created': instance.dtCreated,
      'dt_updated': instance.dtUpdated,
      'media_path': instance.mediaPath,
      'type_name': instance.typeName,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
