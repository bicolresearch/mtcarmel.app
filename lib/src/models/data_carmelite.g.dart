// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_carmelite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataCarmelite _$DataCarmeliteFromJson(Map<String, dynamic> json) {
  return DataCarmelite(
    json['draw'] as int,
    json['recordsTotal'] as int,
    json['recordsFiltered'] as int,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Carmelite.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataCarmeliteToJson(DataCarmelite instance) =>
    <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data,
    };
