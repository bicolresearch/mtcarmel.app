// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_about.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataAbout _$DataAboutFromJson(Map<String, dynamic> json) {
  return DataAbout(
      json['draw'] as int,
      json['recordsTotal'] as int,
      json['recordsFiltered'] as int,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : About.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DataAboutToJson(DataAbout instance) => <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data
    };
