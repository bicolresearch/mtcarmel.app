// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_mass_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataMassRequest _$DataMassRequestFromJson(Map<String, dynamic> json) {
  return DataMassRequest(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : MassRequest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['actions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$DataMassRequestToJson(DataMassRequest instance) =>
    <String, dynamic>{
      'data': instance.data,
      'actions': instance.actions,
    };
