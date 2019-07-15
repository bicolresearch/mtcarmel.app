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
          ?.toList(),
      json['thankYouText'] as String);
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
      json['attribute'] as String,
      json['text_field_type'] as String,
      json['value'] as String,
      json['hint'] as String,
      json['label_text'] as String,
      json['validators'] == null
          ? null
          : ChurchFormValidators.fromJson(
              json['validators'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ChurchFormFieldToJson(ChurchFormField instance) =>
    <String, dynamic>{
      'attribute': instance.attribute,
      'label_text': instance.labelText,
      'hint': instance.hint,
      'value': instance.value,
      'text_field_type': instance.textFieldType,
      'validators': instance.validators
    };

ChurchFormValidators _$ChurchFormValidatorsFromJson(Map<String, dynamic> json) {
  return ChurchFormValidators(
      json['is_numeric'] as String,
      json['is_required'] as String,
      json['max_value'] as String,
      json['min_value'] as String,
      json['error_text'] as String);
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
