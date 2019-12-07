// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_baptism.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityBaptism _$CommunityBaptismFromJson(Map<String, dynamic> json) {
  return CommunityBaptism(
    json['id'],
    json['name'],
    json['dt_birth'],
    json['birth_place'],
    json['father_name'],
    json['father_religion_id'],
    json['father_religion_name'],
    json['father_dt_birth'],
    json['father_birth_place'],
    json['mother_name'],
    json['mother_religion_id'],
    json['mother_religion_name'],
    json['mother_dt_birth'],
    json['mother_birth_place'],
    json['address_1'],
    json['address_2'],
    json['city'],
    json['province'],
    json['country'],
    json['marriage_id'],
    json['marriage_name'],
    json['place_marriage'],
    json['name_contact_person'],
    json['landline_contact_person'],
    json['mobile_contact_person'],
    json['dt_baptism'],
    json['time_baptism'],
    json['status_id'],
    json['status_name'],
    json['dt_created'],
    json['dt_updated'],
    json['created_by'],
    json['updated_by'],
  );
}

Map<String, dynamic> _$CommunityBaptismToJson(CommunityBaptism instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dt_birth': instance.dtBirth,
      'birth_place': instance.birthPlace,
      'father_name': instance.fatherName,
      'father_religion_id': instance.fatherReligionId,
      'father_religion_name': instance.fatherReligionName,
      'father_dt_birth': instance.fatherDtBirth,
      'father_birth_place': instance.fatherBirthPlace,
      'mother_name': instance.motherName,
      'mother_religion_id': instance.motherReligionId,
      'mother_religion_name': instance.motherReligionName,
      'mother_dt_birth': instance.motherDtBirth,
      'mother_birth_place': instance.motherBirthPlace,
      'address_1': instance.address1,
      'address_2': instance.address2,
      'city': instance.city,
      'province': instance.province,
      'country': instance.country,
      'marriage_id': instance.marriageId,
      'marriage_name': instance.marriageName,
      'place_marriage': instance.placeMarriage,
      'name_contact_person': instance.nameContactPerson,
      'landline_contact_person': instance.landlineContactPerson,
      'mobile_contact_person': instance.mobileContactPerson,
      'dt_baptism': instance.dtBaptism,
      'time_baptism': instance.timeBaptism,
      'status_id': instance.statusId,
      'status_name': instance.statusName,
      'dt_created': instance.dtCreated,
      'dt_updated': instance.dtUpdated,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
