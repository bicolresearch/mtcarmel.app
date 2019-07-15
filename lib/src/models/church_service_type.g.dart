// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'church_service_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChurchServiceType _$ChurchServiceTypeFromJson(Map<String, dynamic> json) {
  return ChurchServiceType(
      churchServiceSubtypes: (json['churchServiceSubtypes'] as List)
          ?.map((e) => e == null
              ? null
              : ChurchServiceSubtype.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ChurchServiceTypeToJson(ChurchServiceType instance) =>
    <String, dynamic>{'churchServiceSubtypes': instance.churchServiceSubtypes};

ChurchServiceSubtype _$ChurchServiceSubtypeFromJson(Map<String, dynamic> json) {
  return ChurchServiceSubtype(
      infoText: json['infoText'] as String,
      formFields: (json['formFields'] as List)
          ?.map((e) => e == null
              ? null
              : ChurchFormField.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      thankYouText: json['thankYouText'] as String);
}

Map<String, dynamic> _$ChurchServiceSubtypeToJson(
        ChurchServiceSubtype instance) =>
    <String, dynamic>{
      'infoText': instance.infoText,
      'formFields': instance.formFields,
      'thankYouText': instance.thankYouText
    };

ChurchFormField _$ChurchFormFieldFromJson(Map<String, dynamic> json) {
  return ChurchFormField(
      attribute: json['attribute'] as String,
      textFieldType: json['text_field_type'] as String,
      value: json['value'] as String,
      hint: json['hint'] as String,
      labelText: json['label_text'] as String,
      validators: json['validators'] == null
          ? null
          : ChurchFormValidators.fromJson(
              json['validators'] as Map<String, dynamic>),
      selections:
          (json['selections'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$ChurchFormFieldToJson(ChurchFormField instance) =>
    <String, dynamic>{
      'attribute': instance.attribute,
      'label_text': instance.labelText,
      'hint': instance.hint,
      'value': instance.value,
      'text_field_type': instance.textFieldType,
      'validators': instance.validators,
      'selections': instance.selections
    };

ChurchFormValidators _$ChurchFormValidatorsFromJson(Map<String, dynamic> json) {
  return ChurchFormValidators(
      isNumeric: json['is_numeric'] as String,
      isRequired: json['is_required'] as String,
      maxValue: json['max_value'] as String,
      minValue: json['min_value'] as String,
      errorText: json['error_text'] as String);
}

Map<String, dynamic> _$ChurchFormValidatorsToJson(
        ChurchFormValidators instance) =>
    <String, dynamic>{
      'is_required': instance.isRequired,
      'is_numeric': instance.isNumeric,
      'min_value': instance.minValue,
      'max_value': instance.maxValue,
      'error_text': instance.errorText
    };
