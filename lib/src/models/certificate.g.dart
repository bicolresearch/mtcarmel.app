// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Certificate _$CertificateFromJson(Map<String, dynamic> json) {
  return Certificate(
    json['id'],
    json['name'],
    json['status_id'],
    json['status_name'],
    json['dt_updated'],
    json['created_by'],
    json['updated_by'],
  );
}

Map<String, dynamic> _$CertificateToJson(Certificate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status_id': instance.statusId,
      'status_name': instance.statusName,
      'dt_updated': instance.dtUpdated,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };

DataActionCertificate _$DataActionCertificateFromJson(
    Map<String, dynamic> json) {
  return DataActionCertificate(
    json['data'] == null
        ? null
        : DataCertificate.fromJson(json['data'] as Map<String, dynamic>),
    (json['actions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$DataActionCertificateToJson(
        DataActionCertificate instance) =>
    <String, dynamic>{
      'data': instance.data,
      'actions': instance.actions,
    };

DataCertificate _$DataCertificateFromJson(Map<String, dynamic> json) {
  return DataCertificate(
    json['draw'] as int,
    json['recordsTotal'] as int,
    json['recordsFiltered'] as int,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Certificate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataCertificateToJson(DataCertificate instance) =>
    <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data,
    };
