// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_pastor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataPastor _$DataPastorFromJson(Map<String, dynamic> json) {
  return DataPastor(
    json['draw'] as int,
    json['recordsTotal'] as int,
    json['recordsFiltered'] as int,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Pastor.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataPastorToJson(DataPastor instance) =>
    <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data,
    };
