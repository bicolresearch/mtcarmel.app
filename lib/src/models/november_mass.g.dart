// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'november_mass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NovemberMass _$NovemberMassFromJson(Map<String, dynamic> json) {
  return NovemberMass(
    json['id'],
    json['name'],
    json['name_contact_person'],
    json['address_1'],
    json['address_2'],
    json['city'],
    json['province'],
    json['country'],
    json['status_id'],
    json['status_name'],
    json['dt_created'],
    json['dt_updated'],
    json['created_by'],
    json['updated_by'],
  );
}

Map<String, dynamic> _$NovemberMassToJson(NovemberMass instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_contact_person': instance.nameContactPerson,
      'address_1': instance.address1,
      'address_2': instance.address2,
      'city': instance.city,
      'province': instance.province,
      'country': instance.country,
      'status_id': instance.statusId,
      'status_name': instance.statusName,
      'dt_created': instance.dtCreated,
      'dt_updated': instance.dtUpdated,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
