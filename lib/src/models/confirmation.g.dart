// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirmation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Confirmation _$ConfirmationFromJson(Map<String, dynamic> json) {
  return Confirmation(
    json['id'],
    json['name'],
    json['dt_birth'],
    json['address_1'],
    json['address_2'],
    json['city'],
    json['province'],
    json['country'],
    json['dt_baptism'],
    json['church_of_baptism'],
    json['father_name'],
    json['mother_name'],
    json['name_contact_person'],
    json['landline_contact_person'],
    json['mobile_contact_person'],
    json['remarks'],
    json['sponsor'],
    json['requirements'],
    json['status_id'],
    json['status_name'],
    json['dt_created'],
    json['dt_updated'],
    json['created_by'],
    json['updated_by'],
  );
}

Map<String, dynamic> _$ConfirmationToJson(Confirmation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dt_birth': instance.dtBirth,
      'address_1': instance.address1,
      'address_2': instance.address2,
      'city': instance.city,
      'province': instance.province,
      'country': instance.country,
      'dt_baptism': instance.dtBaptism,
      'church_of_baptism': instance.churchOfBaptism,
      'father_name': instance.fatherName,
      'mother_name': instance.motherName,
      'name_contact_person': instance.nameContactPerson,
      'landline_contact_person': instance.landlineContactPerson,
      'mobile_contact_person': instance.mobileContactPerson,
      'remarks': instance.remarks,
      'sponsor': instance.sponsor,
      'requirements': instance.requirements,
      'status_id': instance.statusId,
      'status_name': instance.statusName,
      'dt_created': instance.dtCreated,
      'dt_updated': instance.dtUpdated,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
