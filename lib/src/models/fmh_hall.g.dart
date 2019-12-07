// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fmh_hall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FmhHall _$FmhHallFromJson(Map<String, dynamic> json) {
  return FmhHall(
    json['id'],
    json['name'],
    json['address_1'],
    json['address_2'],
    json['city'],
    json['province'],
    json['country'],
    json['event_id'],
    json['event_name'],
    json['name_contact_person'],
    json['landline_contact_person'],
    json['mobile_contact_person'],
    json['package_id'],
    json['package_name'],
    json['dt_service'],
    json['time_service'],
    json['duration'],
    json['status_id'],
    json['status_name'],
    json['dt_created'],
    json['dt_updated'],
    json['created_by'],
    json['updated_by'],
  );
}

Map<String, dynamic> _$FmhHallToJson(FmhHall instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address_1': instance.address1,
      'address_2': instance.address2,
      'city': instance.city,
      'province': instance.province,
      'country': instance.country,
      'event_id': instance.eventId,
      'event_name': instance.eventName,
      'name_contact_person': instance.nameContactPerson,
      'landline_contact_person': instance.landlineContactPerson,
      'mobile_contact_person': instance.mobileContactPerson,
      'package_id': instance.packageId,
      'package_name': instance.packageName,
      'dt_service': instance.dtService,
      'time_service': instance.timeService,
      'duration': instance.duration,
      'status_id': instance.statusId,
      'status_name': instance.statusName,
      'dt_created': instance.dtCreated,
      'dt_updated': instance.dtUpdated,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
