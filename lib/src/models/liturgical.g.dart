// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liturgical.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Liturgical _$LiturgicalFromJson(Map<String, dynamic> json) {
  return Liturgical(
    json['id'],
    json['name'],
    json['status_id'],
    json['status_name'],
    json['dt_updated'],
    json['created_by'],
    json['updated_by'],
  );
}

Map<String, dynamic> _$LiturgicalToJson(Liturgical instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status_id': instance.statusId,
      'status_name': instance.statusName,
      'dt_updated': instance.dtUpdated,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };

DataActionLiturgical _$DataActionLiturgicalFromJson(Map<String, dynamic> json) {
  return DataActionLiturgical(
    json['data'] == null
        ? null
        : DataLiturgical.fromJson(json['data'] as Map<String, dynamic>),
    (json['actions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$DataActionLiturgicalToJson(
        DataActionLiturgical instance) =>
    <String, dynamic>{
      'data': instance.data,
      'actions': instance.actions,
    };

DataLiturgical _$DataLiturgicalFromJson(Map<String, dynamic> json) {
  return DataLiturgical(
    json['draw'] as int,
    json['recordsTotal'] as int,
    json['recordsFiltered'] as int,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Liturgical.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataLiturgicalToJson(DataLiturgical instance) =>
    <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data,
    };
