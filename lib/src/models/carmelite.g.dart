// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carmelite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Carmelite _$CarmeliteFromJson(Map<String, dynamic> json) {
  return Carmelite(
    json['id'],
    json['branch_id'] as String,
    json['name'],
    json['position'],
    json['congregation'],
    json['sequence'],
    json['media_id'],
    json['media_path'],
    json['type_id'],
    json['type_name'],
    json['dt_created'],
    json['dt_updated'],
    json['created_by'],
    json['updated_by'],
  );
}

Map<String, dynamic> _$CarmeliteToJson(Carmelite instance) => <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'name': instance.name,
      'position': instance.position,
      'congregation': instance.congregation,
      'sequence': instance.sequence,
      'media_id': instance.mediaId,
      'media_path': instance.mediaPath,
      'type_id': instance.typeId,
      'type_name': instance.typeName,
      'dt_created': instance.dtCreated,
      'dt_updated': instance.dtUpdated,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };

DataCarmelite _$DataCarmeliteFromJson(Map<String, dynamic> json) {
  return DataCarmelite(
    json['draw'] as int,
    json['recordsTotal'] as int,
    json['recordsFiltered'] as int,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Carmelite.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataCarmeliteToJson(DataCarmelite instance) =>
    <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data,
    };
