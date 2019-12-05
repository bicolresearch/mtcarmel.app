// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModuleModel _$ModuleModelFromJson(Map<String, dynamic> json) {
  return ModuleModel(
    json['id'] as String,
    json['prayer'] as String,
    json['status_id'],
    json['status_name'],
    json['dt_created'],
    json['dt_updated'],
    json['created_by'],
    json['updated_by'],
  );
}

Map<String, dynamic> _$ModuleModelToJson(ModuleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prayer': instance.prayer,
      'status_id': instance.statusId,
      'status_name': instance.statusName,
      'dt_created': instance.dtCreated,
      'dt_updated': instance.dtUpdated,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };

DataActionModuleModel _$DataActionModuleModelFromJson(
    Map<String, dynamic> json) {
  return DataActionModuleModel(
    json['data'] == null
        ? null
        : DataModuleModel.fromJson(json['data'] as Map<String, dynamic>),
    (json['actions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$DataActionModuleModelToJson(
        DataActionModuleModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'actions': instance.actions,
    };

DataModuleModel _$DataModuleModelFromJson(Map<String, dynamic> json) {
  return DataModuleModel(
    json['draw'] as int,
    json['recordsTotal'] as int,
    json['recordsFiltered'] as int,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : ModuleModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataModuleModelToJson(DataModuleModel instance) =>
    <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data,
    };
