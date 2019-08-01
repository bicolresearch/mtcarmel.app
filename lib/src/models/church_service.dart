/*
*  Filename    :   church_service.dart
*  Purpose     :	  Model for church service
*  Created     :   2019-07-15 11:08 by Detective Conan
*  Updated     :   2019-08-01 08:44 by Detective conan
*  Changes     :   Moved the errorMessage to subtype, instead to the form.
*                  added url for the api.
*/

import 'package:json_annotation/json_annotation.dart';

part 'church_service.g.dart';

@JsonSerializable()
class ChurchService {
  final ServiceReference serviceReference;
  final String typeName;
  final String description;
  final List<ChurchServiceSubtype> churchServiceSubtypes;

  ChurchService(
      {this.serviceReference,
      this.churchServiceSubtypes,
      this.typeName,
      this.description});

  factory ChurchService.fromJson(Map<String, dynamic> json) =>
      _$ChurchServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ChurchServiceToJson(this);
}

@JsonSerializable()
class ChurchServiceSubtype {
  ChurchServiceSubtype(
      {this.subTypeName,
      this.infoText,
      this.formFields,
      this.thankYouText,
      this.url});

  final String subTypeName;
  final String infoText;
  final List<ChurchFormField> formFields;
  final String thankYouText;
  final String url;

  factory ChurchServiceSubtype.fromJson(Map<String, dynamic> json) =>
      _$ChurchServiceSubtypeFromJson(json);

  Map<String, dynamic> toJson() => _$ChurchServiceSubtypeToJson(this);
}

@JsonSerializable()
class ChurchFormField {
  ChurchFormField({
    this.attribute,
    this.textFieldType,
    this.value,
    this.hint,
    this.labelText,
    this.validators,
    this.selections,
    this.errorText,
  });

  final String attribute;
  @JsonKey(name: "label_text")
  final String labelText;
  final String hint;
  final String value;
  @JsonKey(name: "text_field_type")
  final String textFieldType;
  final ChurchFormValidators validators;
  final List<String> selections;
  @JsonKey(name: "error_text")
  final String errorText;

  factory ChurchFormField.fromJson(Map<String, dynamic> json) =>
      _$ChurchFormFieldFromJson(json);

  Map<String, dynamic> toJson() => _$ChurchFormFieldToJson(this);
}

@JsonSerializable()
class ChurchFormValidators {
  ChurchFormValidators(
      {this.isNumeric, this.isRequired, this.maxValue, this.minValue});

  @JsonKey(name: "is_required")
  final String isRequired;
  @JsonKey(name: "is_numeric")
  final String isNumeric;
  @JsonKey(name: "min_value")
  final String minValue;
  @JsonKey(name: "max_value")
  final String maxValue;

  factory ChurchFormValidators.fromJson(Map<String, dynamic> json) =>
      _$ChurchFormValidatorsFromJson(json);

  Map<String, dynamic> toJson() => _$ChurchFormValidatorsToJson(this);
}

@JsonSerializable()
class ServiceReference {
  ServiceReference(
    this.id,
    this.branchId,
    this.name,
    this.description,
    this.coverPhoto,
  );

  final String id;
  @JsonKey(name: "branch_id")
  final String branchId;
  final String name;
  final String description;
  @JsonKey(name: "cover_photo")
  final String coverPhoto;

  factory ServiceReference.fromJson(Map<String, dynamic> json) =>
      _$ServiceReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceReferenceToJson(this);
}
