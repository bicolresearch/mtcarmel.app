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
  final List<SubModuleAndFormFields> subModuleAndFormFieldsList;

  ChurchModule({
    this.moduleReference,
    this.typeName,
    this.description,
    this.subModuleAndFormFieldsList,
  });

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
class ModuleReferenceRoot {
  ModuleReferenceRoot(
      this.draw, this.recordsTotal, this.recordsFiltered, this.data);

  final draw;
  @JsonKey(name: "recordsTotal")
  final recordsTotal;
  @JsonKey(name: "recordsFiltered")
  final recordsFiltered;
  final List<ModuleReference> data;

  factory ModuleReferenceRoot.fromJson(Map<String, dynamic> json) =>
      _$ModuleReferenceRootFromJson(json);

  Map<String, dynamic> toJson() => _$ModuleReferenceRootToJson(this);
}

@JsonSerializable()
class ModuleReference {
  ModuleReference(
    this.id,
    this.branchId,
    this.name,
    this.description,
    this.coverPhoto,
    this.subModuleIds,
  );

  final String id;
  @JsonKey(name: "branch_id")
  final String branchId;
  final String name;
  final String description;
  @JsonKey(name: "cover_photo")
  final String coverPhoto;
  @JsonKey(name: "sub_modules_ids")
  final String subModuleIds;

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
class SubModuleRoot {
  SubModuleRoot(this.draw, this.recordsTotal, this.recordsFiltered, this.data);

  final draw;
  @JsonKey(name: "recordsTotal")
  final recordsTotal;
  @JsonKey(name: "recordsFiltered")
  final recordsFiltered;
  final List<SubModule> data;

  factory SubModuleRoot.fromJson(Map<String, dynamic> json) =>
      _$SubModuleRootFromJson(json);

  Map<String, dynamic> toJson() => _$SubModuleRootToJson(this);
}

@JsonSerializable()
class SubModule {
  SubModule(this.moduleId, this.id, this.name, this.description,
      this.acceptanceContent, this.thankYouContent, this.url, this.coverPhoto);

  @JsonKey(name: "module_id")
  final moduleId;
  final id;
  final name;
  final description;
  @JsonKey(name: "acceptance_content")
  final acceptanceContent;
  @JsonKey(name: "thank_you_content")
  final thankYouContent;
  final url;
  @JsonKey(name: "cover_photo")
  final coverPhoto;

  factory SubModule.fromJson(Map<String, dynamic> json) =>
      _$SubModuleFromJson(json);

  Map<String, dynamic> toJson() => _$SubModuleToJson(this);
}
