// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_priest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataPriest _$DataPriestFromJson(Map<String, dynamic> json) {
  return DataPriest(
    json['draw'] as int,
    json['recordsTotal'] as int,
    json['recordsFiltered'] as int,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Priest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataPriestToJson(DataPriest instance) =>
    <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data,
    };
