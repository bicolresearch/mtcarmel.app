// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Certificate _$CertificateFromJson(Map<String, dynamic> json) {
  return Certificate(
    json['id'],
    json['name'],
    json['certificate_id'],
    json['certificate_name'],
    json['purpose_certificate_id'],
    json['purpose_certificate_name'],
    json['name_contact_person'],
    json['landline_contact_person'],
    json['mobile_contact_person'],
    json['dt_marriage'],
    json['status_id'],
    json['status_name'],
    json['dt_created'],
    json['dt_updated'],
    json['created_by'],
    json['updated_by'],
  );
}

Map<String, dynamic> _$CertificateToJson(Certificate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'certificate_id': instance.certificateId,
      'certificate_name': instance.certificateName,
      'purpose_certificate_id': instance.purposeCertificateId,
      'purpose_certificate_name': instance.purposeCertificateName,
      'name_contact_person': instance.nameContactPerson,
      'landline_contact_person': instance.landlineContactPerson,
      'mobile_contact_person': instance.mobileContactPerson,
      'dt_marriage': instance.dtMarriage,
      'status_id': instance.statusId,
      'status_name': instance.statusName,
      'dt_created': instance.dtCreated,
      'dt_updated': instance.dtUpdated,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
