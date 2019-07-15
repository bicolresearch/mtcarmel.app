// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'church_service_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChurchServiceType _$ChurchServiceTypeFromJson(Map<String, dynamic> json) {
  return ChurchServiceType((json['churchServiceSubtypes'] as List)
      ?.map((e) => e == null
          ? null
          : ChurchServiceSubtype.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$ChurchServiceTypeToJson(ChurchServiceType instance) =>
    <String, dynamic>{'churchServiceSubtypes': instance.churchServiceSubtypes};

ChurchServiceSubtype _$ChurchServiceSubtypeFromJson(Map<String, dynamic> json) {
  return ChurchServiceSubtype(
      json['infoText'] as String,
      (json['formFields'] as List)
          ?.map((e) => e == null
              ? null
              : ChurchFormField.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ChurchServiceSubtypeToJson(
        ChurchServiceSubtype instance) =>
    <String, dynamic>{
      'infoText': instance.infoText,
      'formFields': instance.formFields
    };

ChurchFormField _$ChurchFormFieldFromJson(Map<String, dynamic> json) {
  return ChurchFormField(json['label'] as String,
      json['textFieldType'] as String, json['value'] as String);
}

Map<String, dynamic> _$ChurchFormFieldToJson(ChurchFormField instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'textFieldType': instance.textFieldType
    };
