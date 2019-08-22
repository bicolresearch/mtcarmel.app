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
    json['status'] as String,
    json['posted_on'] as String,
    json['updated_on'] as String,
    json['author'] as String,
  );
}

Map<String, dynamic> _$MassRequestToJson(MassRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'purpose_mass': instance.purposeMass,
      'dt_offered': instance.dtOffered,
      'time_offered': instance.timeOffered,
      'status': instance.status,
      'posted_on': instance.postedOn,
      'updated_on': instance.updatedOn,
      'author': instance.author,
    };
