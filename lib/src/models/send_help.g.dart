// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_help.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendHelp _$SendHelpFromJson(Map<String, dynamic> json) {
  return SendHelp(
    json['draw'],
    json['recordsTotal'],
    json['recordsFiltered'],
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : SendHelpData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SendHelpToJson(SendHelp instance) => <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data,
    };

SendHelpData _$SendHelpDataFromJson(Map<String, dynamic> json) {
  return SendHelpData(
    json['id'],
    json['name'],
    json['description'],
    json['dt_created'],
    json['dt_updated'],
    json['created_by'],
    json['updated_by'],
  );
}

Map<String, dynamic> _$SendHelpDataToJson(SendHelpData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'dt_created': instance.dtCreated,
      'dt_updated': instance.dtUpdated,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
