// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selection_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectionApi _$SelectionApiFromJson(Map<String, dynamic> json) {
  return SelectionApi(
    json['id'] as String,
    json['branch_id'] as String,
    json['module_id'] as String,
    json['sub_module_id'] as String,
    json['name'] as String,
    json['description'] as String,
  );
}

Map<String, dynamic> _$SelectionApiToJson(SelectionApi instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'module_id': instance.moduleId,
      'sub_module_id': instance.subModuleId,
      'name': instance.name,
      'description': instance.description,
    };
