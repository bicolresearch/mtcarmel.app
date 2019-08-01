// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'church_module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChurchModule _$ChurchModuleFromJson(Map<String, dynamic> json) {
  return ChurchModule(
    moduleReference: json['moduleReference'] == null
        ? null
        : ModuleReference.fromJson(
            json['moduleReference'] as Map<String, dynamic>),
    churchSubModules: (json['churchSubModules'] as List)
        ?.map((e) => e == null
            ? null
            : ChurchSubModule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    typeName: json['typeName'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$ChurchModuleToJson(ChurchModule instance) =>
    <String, dynamic>{
      'moduleReference': instance.moduleReference,
      'typeName': instance.typeName,
      'description': instance.description,
      'churchSubModules': instance.churchSubModules,
    };

ChurchSubModule _$ChurchSubModuleFromJson(Map<String, dynamic> json) {
  return ChurchSubModule(
    name: json['name'] as String,
    acceptanceContent: json['acceptance_content'] as String,
    formFields: (json['formFields'] as List)
        ?.map((e) => e == null
            ? null
            : ChurchFormField.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    thankYouContent: json['thank_you_content'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$ChurchSubModuleToJson(ChurchSubModule instance) =>
    <String, dynamic>{
      'name': instance.name,
      'acceptance_content': instance.acceptanceContent,
      'formFields': instance.formFields,
      'thank_you_content': instance.thankYouContent,
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

ModuleReference _$ModuleReferenceFromJson(Map<String, dynamic> json) {
  return ModuleReference(
    json['id'] as String,
    json['branch_id'] as String,
    json['name'] as String,
    json['description'] as String,
    json['cover_photo'] as String,
  );
}

Map<String, dynamic> _$ModuleReferenceToJson(ModuleReference instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'name': instance.name,
      'description': instance.description,
      'cover_photo': instance.coverPhoto,
    };

SubModuleAndFormFields _$SubModuleAndFormFieldsFromJson(
    Map<String, dynamic> json) {
  return SubModuleAndFormFields(
    subModule: json['sub_module'] == null
        ? null
        : SubModule.fromJson(json['sub_module'] as Map<String, dynamic>),
    formFields: (json['formFields'] as List)
        ?.map((e) => e == null
            ? null
            : ChurchFormField.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SubModuleAndFormFieldsToJson(
        SubModuleAndFormFields instance) =>
    <String, dynamic>{
      'sub_module': instance.subModule,
      'formFields': instance.formFields,
    };

SubModule _$SubModuleFromJson(Map<String, dynamic> json) {
  return SubModule(
    name: json['name'] as String,
    acceptanceContent: json['acceptance_content'] as String,
    thankYouContent: json['thank_you_content'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$SubModuleToJson(SubModule instance) => <String, dynamic>{
      'name': instance.name,
      'acceptance_content': instance.acceptanceContent,
      'thank_you_content': instance.thankYouContent,
      'url': instance.url,
    };
