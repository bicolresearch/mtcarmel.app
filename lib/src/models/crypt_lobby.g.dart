// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypt_lobby.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptLobby _$CryptLobbyFromJson(Map<String, dynamic> json) {
  return CryptLobby(
    json['id'],
    json['name'],
    json['name_contact_person'],
    json['landline_contact_person'],
    json['mobile_contact_person'],
    json['dt_service'],
    json['time_service'],
    json['duration'],
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

Map<String, dynamic> _$CryptLobbyToJson(CryptLobby instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_contact_person': instance.nameContactPerson,
      'landline_contact_person': instance.landlineContactPerson,
      'mobile_contact_person': instance.mobileContactPerson,
      'dt_service': instance.dtService,
      'time_service': instance.timeService,
      'duration': instance.duration,
      'officiating_priest_id': instance.officiatingPriestId,
      'officiating_priest_name': instance.officiatingPriestName,
      'status_id': instance.statusId,
      'status_name': instance.statusName,
      'dt_created': instance.dtCreated,
      'dt_updated': instance.dtUpdated,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
