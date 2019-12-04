// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'individual_baptism.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndividualBaptism _$IndividualBaptismFromJson(Map<String, dynamic> json) {
  return IndividualBaptism(
    json['id'] as String,
    json['name'] as String,
    json['status_id'],
    json['status_name'] as String,
    json['dt_created'],
    json['dt_updated'],
    json['created_by'],
    json['updated_by'],
  );
}

Map<String, dynamic> _$IndividualBaptismToJson(IndividualBaptism instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status_id': instance.statusId,
      'status_name': instance.statusName,
      'dt_created': instance.dtCreated,
      'dt_updated': instance.dtUpdated,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };

DataActionIndividualBaptism _$DataActionIndividualBaptismFromJson(
    Map<String, dynamic> json) {
  return DataActionIndividualBaptism(
    json['data'] == null
        ? null
        : DataIndividualBaptism.fromJson(json['data'] as Map<String, dynamic>),
    (json['actions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$DataActionIndividualBaptismToJson(
        DataActionIndividualBaptism instance) =>
    <String, dynamic>{
      'data': instance.data,
      'actions': instance.actions,
    };

DataIndividualBaptism _$DataIndividualBaptismFromJson(
    Map<String, dynamic> json) {
  return DataIndividualBaptism(
    json['draw'] as int,
    json['recordsTotal'] as int,
    json['recordsFiltered'] as int,
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : IndividualBaptism.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataIndividualBaptismToJson(
        DataIndividualBaptism instance) =>
    <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data,
    };
