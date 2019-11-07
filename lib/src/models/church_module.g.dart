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
    typeName: json['typeName'] as String,
    description: json['description'] as String,
    subModuleAndFormFieldsList: (json['subModuleAndFormFields'] as List)
        ?.map((e) => e == null
            ? null
            : SubModuleAndFormFields.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ChurchModuleToJson(ChurchModule instance) =>
    <String, dynamic>{
      'moduleReference': instance.moduleReference,
      'typeName': instance.typeName,
      'description': instance.description,
      'subModuleAndFormFields': instance.subModuleAndFormFieldsList,
    };

ChurchSubModule _$ChurchSubModuleFromJson(Map<String, dynamic> json) {
  return ChurchSubModule(
    name: json['name'] as String,
    acceptanceContent: json['acceptance_content'] as String,
    formFields: (json['form_fields'] as List)
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
      'form_fields': instance.formFields,
      'thank_you_content': instance.thankYouContent,
      'url': instance.url,
    };

ChurchFormField _$ChurchFormFieldFromJson(Map<String, dynamic> json) {
  return ChurchFormField(
    json['attribute'] as String,
    json['label_text'] as String,
    json['hint'] as String,
    json['value'] as String,
    json['text_field_type'] as String,
    json['validator_is_required'] as String,
    json['validator_is_numeric'] as String,
    json['validator_min_value'] as String,
    json['validator_max_value'] as String,
    json['validator_pattern'] as String,
    json['validator_min_date'] as String,
    json['validatorMaxDate'] as String,
    json['selections'] as String,
    json['error_text'] as String,
    json['max_lines'] as String,
  );
}

Map<String, dynamic> _$ChurchFormFieldToJson(ChurchFormField instance) =>
    <String, dynamic>{
      'attribute': instance.attribute,
      'label_text': instance.labelText,
      'hint': instance.hint,
      'value': instance.value,
      'text_field_type': instance.textFieldType,
      'validator_is_required': instance.validatorIsRequired,
      'validator_is_numeric': instance.validatorIsNumeric,
      'validator_min_value': instance.validatorMinValue,
      'validator_max_value': instance.validatorMaxValue,
      'validator_pattern': instance.validatorPattern,
      'validator_min_date': instance.validatorMinDate,
      'validatorMaxDate': instance.validatorMaxDate,
      'selections': instance.selections,
      'error_text': instance.errorText,
      'max_lines': instance.maxLines,
    };

ModuleReferenceRoot _$ModuleReferenceRootFromJson(Map<String, dynamic> json) {
  return ModuleReferenceRoot(
    json['draw'],
    json['recordsTotal'],
    json['recordsFiltered'],
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : ModuleReference.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ModuleReferenceRootToJson(
        ModuleReferenceRoot instance) =>
    <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data,
    };

ModuleReference _$ModuleReferenceFromJson(Map<String, dynamic> json) {
  return ModuleReference(
    json['id'] as String,
    json['branch_id'] as String,
    json['name'] as String,
    json['description'] as String,
    json['cover_photo'] as String,
    json['sub_modules_ids'] as String,
  );
}

Map<String, dynamic> _$ModuleReferenceToJson(ModuleReference instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'name': instance.name,
      'description': instance.description,
      'cover_photo': instance.coverPhoto,
      'sub_modules_ids': instance.subModuleIds,
    };

SubModuleAndFormFields _$SubModuleAndFormFieldsFromJson(
    Map<String, dynamic> json) {
  return SubModuleAndFormFields(
    subModule: json['sub_module'] == null
        ? null
        : SubModule.fromJson(json['sub_module'] as Map<String, dynamic>),
    formFields: (json['form_fields'] as List)
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
      'form_fields': instance.formFields,
    };

SubModuleRoot _$SubModuleRootFromJson(Map<String, dynamic> json) {
  return SubModuleRoot(
    json['draw'],
    json['recordsTotal'],
    json['recordsFiltered'],
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : SubModule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SubModuleRootToJson(SubModuleRoot instance) =>
    <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data,
    };

SubModule _$SubModuleFromJson(Map<String, dynamic> json) {
  return SubModule(
    json['module_id'],
    json['id'],
    json['name'],
    json['description'],
    json['acceptance_content'],
    json['thank_you_content'],
    json['url'],
    json['cover_photo'],
  );
}

Map<String, dynamic> _$SubModuleToJson(SubModule instance) => <String, dynamic>{
      'module_id': instance.moduleId,
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'acceptance_content': instance.acceptanceContent,
      'thank_you_content': instance.thankYouContent,
      'url': instance.url,
      'cover_photo': instance.coverPhoto,
    };
