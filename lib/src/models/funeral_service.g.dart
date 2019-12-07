// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'funeral_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FuneralService _$FuneralServiceFromJson(Map<String, dynamic> json) {
  return FuneralService(
    json['id'],
    json['name'],
    json['civil_status_id'],
    json['civil_status_name'],
    json['dt_birth'],
    json['dt_death'],
    json['cause_of_death'],
    json['funeral_location_id'],
    json['funeral_location_name'],
    json['service_id'],
    json['service_name'],
    json['dt_service'],
    json['time_service'],
    json['dt_internment'],
    json['time_internment'],
    json['place_internment'],
    json['name_contact_person'],
    json['landline_contact_person'],
    json['mobile_contact_person'],
    json['status_id'],
    json['status_name'],
    json['dt_created'],
    json['dt_updated'],
    json['created_by'],
    json['updated_by'],
  );
}

Map<String, dynamic> _$FuneralServiceToJson(FuneralService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'civil_status_id': instance.civilStatusId,
      'civil_status_name': instance.civilStatusName,
      'dt_birth': instance.dtBirth,
      'dt_death': instance.dtDeath,
      'cause_of_death': instance.causeOfDeath,
      'funeral_location_id': instance.funeralLocationId,
      'funeral_location_name': instance.funeralLocationName,
      'service_id': instance.serviceId,
      'service_name': instance.serviceName,
      'dt_service': instance.dtService,
      'time_service': instance.timeService,
      'dt_internment': instance.dtInternment,
      'time_internment': instance.timeInternment,
      'place_internment': instance.placeInternment,
      'name_contact_person': instance.nameContactPerson,
      'landline_contact_person': instance.landlineContactPerson,
      'mobile_contact_person': instance.mobileContactPerson,
      'status_id': instance.statusId,
      'status_name': instance.statusName,
      'dt_created': instance.dtCreated,
      'dt_updated': instance.dtUpdated,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
