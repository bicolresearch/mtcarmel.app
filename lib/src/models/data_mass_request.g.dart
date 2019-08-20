// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_mass_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataMassRequest _$DataMassRequestFromJson(Map<String, dynamic> json) {
  return DataMassRequest(
    json['draw'] as int,
    json['recordsTotal'] as int,
    json['recordsFiltered'] as int,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : MassRequest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataMassRequestToJson(DataMassRequest instance) =>
    <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data,
    };
