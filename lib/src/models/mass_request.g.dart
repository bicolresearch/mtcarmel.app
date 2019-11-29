// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mass_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MassRequest _$MassRequestFromJson(Map<String, dynamic> json) {
  return MassRequest(
    json['id'] as String,
    json['name'] as String,
    json['purpose_mass'] as String,
    json['dt_offered'] as String,
    json['time_offered'] as String,
    json['status_name'] as String,
    json['posted_on'] as String,
    json['updated_on'] as String,
    json['created_by'] as String,
  );
}

Map<String, dynamic> _$MassRequestToJson(MassRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'purpose_mass': instance.purposeMass,
      'dt_offered': instance.dtOffered,
      'time_offered': instance.timeOffered,
      'status_name': instance.statusName,
      'posted_on': instance.postedOn,
      'updated_on': instance.updatedOn,
      'created_by': instance.createdBy,
    };

DataActionMassRequest _$DataActionMassRequestFromJson(
    Map<String, dynamic> json) {
  return DataActionMassRequest(
    json['data'] == null
        ? null
        : DataMassRequest.fromJson(json['data'] as Map<String, dynamic>),
    (json['actions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$DataActionMassRequestToJson(
        DataActionMassRequest instance) =>
    <String, dynamic>{
      'data': instance.data,
      'actions': instance.actions,
    };

DataMassRequest _$DataMassRequestFromJson(Map<String, dynamic> json) {
  return DataMassRequest(
    json['draw'] as int,
    json['recordsTotal'] as int,
    json['recordsFiltered'] as int,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : MassRequest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataMassRequestToJson(DataMassRequest instance) =>
    <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data,
    };
