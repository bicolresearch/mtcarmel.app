/*
*  Filename    :   church_module.dart
*  Purpose     :	  Model for church service
*  Created     :   2019-07-15 11:08 by Detective Conan
*  Updated     :   2019-08-01 13:51 by Detective conan
*  Changes     :   Renamed service to module. Added model for current api structure
*/

import 'package:json_annotation/json_annotation.dart';

part 'church_module.g.dart';

@JsonSerializable()
class ChurchModule {
  final ModuleReference moduleReference;
  final String typeName;
  final String description;
  final List<ChurchSubModule> churchSubModules;

  ChurchModule(
      {this.moduleReference,
      this.churchSubModules,
      this.typeName,
      this.description});

  factory ChurchModule.fromJson(Map<String, dynamic> json) =>
      _$ChurchModuleFromJson(json);

  Map<String, dynamic> toJson() => _$ChurchModuleToJson(this);
}

@JsonSerializable()
class ChurchSubModule {
  ChurchSubModule(
      {this.name,
      this.acceptanceContent,
      this.formFields,
      this.thankYouContent,
      this.url});

  final String name;
  @JsonKey(name: "acceptance_content")
  final String acceptanceContent;
  @JsonKey(name: "form_fields")
  final List<ChurchFormField> formFields;
  @JsonKey(name: "thank_you_content")
  final String thankYouContent;
  final String url;

  factory ChurchSubModule.fromJson(Map<String, dynamic> json) =>
      _$ChurchSubModuleFromJson(json);

  Map<String, dynamic> toJson() => _$ChurchSubModuleToJson(this);
}

@JsonSerializable()
class ChurchFormField {
  ChurchFormField(
      this.attribute,
      this.labelText,
      this.hint,
      this.value,
      this.textFieldType,
      this.validatorIsRequired,
      this.validatorIsNumeric,
      this.validatorMinValue,
      this.validatorMaxValue,
      this.validatorPattern,
      this.validatorMinDate,
      this.validatorMaxDate,
      this.selections,
      this.errorText,
      this.maxLines);

  final String attribute;
  @JsonKey(name: "label_text")
  final String labelText;
  final String hint;
  final String value;
  @JsonKey(name: "text_field_type")
  final String textFieldType;
  @JsonKey(name: "validator_is_required")
  final String validatorIsRequired;
  @JsonKey(name: "validator_is_numeric")
  final String validatorIsNumeric;
  @JsonKey(name: "validator_min_value")
  final String validatorMinValue;
  @JsonKey(name: "validator_max_value")
  final String validatorMaxValue;
  @JsonKey(name: "validator_pattern")
  final String validatorPattern;
  @JsonKey(name: "validator_min_date")
  final String validatorMinDate;
  @JsonKey(name: "validatorMaxDate")
  final String validatorMaxDate;

//  final List<String> selections;
  final String selections;
  @JsonKey(name: "error_text")
  final String errorText;
  @JsonKey(name: "max_lines")
  final String maxLines;

  factory ChurchFormField.fromJson(Map<String, dynamic> json) =>
      _$ChurchFormFieldFromJson(json);

  Map<String, dynamic> toJson() => _$ChurchFormFieldToJson(this);
}

@JsonSerializable()
class ModuleReference {
  ModuleReference(
    this.id,
    this.branchId,
    this.name,
    this.description,
    this.coverPhoto,
    this.subModules,
  );

  final String id;
  @JsonKey(name: "branch_id")
  final String branchId;
  final String name;
  final String description;
  @JsonKey(name: "cover_photo")
  final String coverPhoto;
  @JsonKey(name: "sub_modules")
  final String subModules;

  factory ModuleReference.fromJson(Map<String, dynamic> json) =>
      _$ModuleReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$ModuleReferenceToJson(this);
}

//TODO Below
//TODO current api the FormFields in line with subModule. FormFields should be inside subModule
@JsonSerializable()
class SubModuleAndFormFields {
  SubModuleAndFormFields({this.subModule, this.formFields});

  @JsonKey(name: "sub_module")
  final SubModule subModule;
  @JsonKey(name: "form_fields")
  final List<ChurchFormField> formFields;

  factory SubModuleAndFormFields.fromJson(Map<String, dynamic> json) =>
      _$SubModuleAndFormFieldsFromJson(json);

  Map<String, dynamic> toJson() => _$SubModuleAndFormFieldsToJson(this);
}

@JsonSerializable()
class SubModule {
  SubModule(
      {this.name, this.acceptanceContent, this.thankYouContent, this.url});

  final String name;
  @JsonKey(name: "acceptance_content")
  final String acceptanceContent;
  @JsonKey(name: "thank_you_content")
  final String thankYouContent;
  final String url;

  factory SubModule.fromJson(Map<String, dynamic> json) =>
      _$SubModuleFromJson(json);

  Map<String, dynamic> toJson() => _$SubModuleToJson(this);
}
