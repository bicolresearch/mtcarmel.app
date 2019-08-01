// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataContact _$DataContactFromJson(Map<String, dynamic> json) {
  return DataContact(
    json['draw'] as int,
    json['recordsTotal'] as int,
    json['recordsFiltered'] as int,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Contact.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataContactToJson(DataContact instance) =>
    <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data,
    };
