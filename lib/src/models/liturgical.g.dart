// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liturgical.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Liturgical _$LiturgicalFromJson(Map<String, dynamic> json) {
  return Liturgical(
    json['id'],
    json['dt_service'],
    json['time_service'],
    json['address_venue'],
    json['occasion_id'],
    json['occasion_name'],
    json['name_contact_person'],
    json['landline_contact_person'],
    json['mobile_contact_person'],
    json['officiating_priest_id'],
    json['officiating_priest_name'],
    json['status_id'],
    json['status_name'],
    json['dt_created'],
    json['dt_updated'],
    json['created_by'],
    json['updated_by'],
  );
}

Map<String, dynamic> _$LiturgicalToJson(Liturgical instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dt_service': instance.dtService,
      'time_service': instance.timeService,
      'address_venue': instance.addressVenue,
      'occasion_id': instance.occasionId,
      'occasion_name': instance.occasionName,
      'name_contact_person': instance.nameContactPerson,
      'landline_contact_person': instance.landlineContactPerson,
      'mobile_contact_person': instance.mobileContactPerson,
      'officiating_priest_id': instance.officiatingPriestId,
      'officiating_priest_name': instance.officiatingPriestName,
      'status_id': instance.statusId,
      'status_name': instance.statusName,
      'dt_created': instance.dtCreated,
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
