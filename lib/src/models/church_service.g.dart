// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'church_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChurchService _$ChurchServiceFromJson(Map<String, dynamic> json) {
  return ChurchService(
    serviceReference: json['serviceReference'] == null
        ? null
        : ServiceReference.fromJson(
            json['serviceReference'] as Map<String, dynamic>),
    churchServiceSubtypes: (json['churchServiceSubtypes'] as List)
        ?.map((e) => e == null
            ? null
            : ChurchServiceSubtype.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    typeName: json['typeName'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$ChurchServiceToJson(ChurchService instance) =>
    <String, dynamic>{
      'serviceReference': instance.serviceReference,
      'typeName': instance.typeName,
      'description': instance.description,
      'churchServiceSubtypes': instance.churchServiceSubtypes,
    };

ChurchServiceSubtype _$ChurchServiceSubtypeFromJson(Map<String, dynamic> json) {
  return ChurchServiceSubtype(
    subTypeName: json['subTypeName'] as String,
    infoText: json['infoText'] as String,
    formFields: (json['formFields'] as List)
        ?.map((e) => e == null
            ? null
            : ChurchFormField.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    thankYouText: json['thankYouText'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$ChurchServiceSubtypeToJson(
        ChurchServiceSubtype instance) =>
    <String, dynamic>{
      'subTypeName': instance.subTypeName,
      'infoText': instance.infoText,
      'formFields': instance.formFields,
      'thankYouText': instance.thankYouText,
      'url': instance.url,
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
    selections: (json['selections'] as List)?.map((e) => e as String)?.toList(),
    errorText: json['error_text'] as String,
  );
}

Map<String, dynamic> _$ChurchFormFieldToJson(ChurchFormField instance) =>
    <String, dynamic>{
      'attribute': instance.attribute,
      'label_text': instance.labelText,
      'hint': instance.hint,
      'value': instance.value,
      'text_field_type': instance.textFieldType,
      'validators': instance.validators,
      'selections': instance.selections,
      'error_text': instance.errorText,
    };

ChurchFormValidators _$ChurchFormValidatorsFromJson(Map<String, dynamic> json) {
  return ChurchFormValidators(
    isNumeric: json['is_numeric'] as String,
    isRequired: json['is_required'] as String,
    maxValue: json['max_value'] as String,
    minValue: json['min_value'] as String,
  );
}

Map<String, dynamic> _$ChurchFormValidatorsToJson(
        ChurchFormValidators instance) =>
    <String, dynamic>{
      'is_required': instance.isRequired,
      'is_numeric': instance.isNumeric,
      'min_value': instance.minValue,
      'max_value': instance.maxValue,
    };

ServiceReference _$ServiceReferenceFromJson(Map<String, dynamic> json) {
  return ServiceReference(
    json['id'] as String,
    json['branch_id'] as String,
    json['name'] as String,
    json['description'] as String,
    json['cover_photo'] as String,
  );
}

Map<String, dynamic> _$ServiceReferenceToJson(ServiceReference instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'name': instance.name,
      'description': instance.description,
      'cover_photo': instance.coverPhoto,
    };
