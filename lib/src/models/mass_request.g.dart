// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mass_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MassRequest _$MassRequestFromJson(Map<String, dynamic> json) {
  return MassRequest(
    json['id'] as String,
    json['name'] as String,
    json['purpose_id'],
    json['purpose_name'] as String,
    json['dt_offered'] as String,
    json['status_id'],
    json['status_name'] as String,
    json['dt_created'],
    json['dt_updated'],
    json['created_by'] as String,
    json['updated_by'],
  );
}

Map<String, dynamic> _$MassRequestToJson(MassRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'purpose_id': instance.purposeId,
      'purpose_name': instance.purposeName,
      'dt_offered': instance.dtOffered,
      'status_id': instance.statusId,
      'status_name': instance.statusName,
      'dt_created': instance.dtCreated,
      'dt_updated': instance.dtUpdated,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
