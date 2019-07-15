/*
*  Filename    :   church_service_type.dart
*  Purpose     :	  Model for church service
*  Created     :   2019-07-15 11:08 by Detective Conan
*	 Updated			:   15/07/2019 10:09 PM PM by Detective Conan
*	 Changes			:   Changed the parameters in the constructor optional.
*/

import 'package:json_annotation/json_annotation.dart';

part 'church_service_type.g.dart';

@JsonSerializable()
class ChurchServiceType {
  final List<ChurchServiceSubtype> churchServiceSubtypes;

  ChurchServiceType({this.churchServiceSubtypes});

  factory ChurchServiceType.fromJson(Map<String, dynamic> json) =>
      _$ChurchServiceTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ChurchServiceTypeToJson(this);
}

@JsonSerializable()
class ChurchServiceSubtype {
  ChurchServiceSubtype({this.infoText, this.formFields, this.thankYouText});

  final String infoText;
  final List<ChurchFormField> formFields;
  final String thankYouText;

  factory ChurchServiceSubtype.fromJson(Map<String, dynamic> json) =>
      _$ChurchServiceSubtypeFromJson(json);

  Map<String, dynamic> toJson() => _$ChurchServiceSubtypeToJson(this);
}

@JsonSerializable()
class ChurchFormField {
  ChurchFormField(
      {this.attribute,
      this.textFieldType,
      this.value,
      this.hint,
      this.labelText,
      this.validators,
      this.selections});

  final String attribute;
  @JsonKey(name: "label_text")
  final String labelText;
  final String hint;
  final String value;
  @JsonKey(name: "text_field_type")
  final String textFieldType;
  final ChurchFormValidators validators;
  final List<String> selections;

  factory ChurchFormField.fromJson(Map<String, dynamic> json) =>
      _$ChurchFormFieldFromJson(json);

  Map<String, dynamic> toJson() => _$ChurchFormFieldToJson(this);
}

@JsonSerializable()
class ChurchFormValidators {
  ChurchFormValidators(
      {this.isNumeric,
      this.isRequired,
      this.maxValue,
      this.minValue,
      this.errorText});

  @JsonKey(name: "is_required")
  final String isRequired;
  @JsonKey(name: "is_numeric")
  final String isNumeric;
  @JsonKey(name: "min_value")
  final String minValue;
  @JsonKey(name: "max_value")
  final String maxValue;
  @JsonKey(name: "error_text")
  final String errorText;

  factory ChurchFormValidators.fromJson(Map<String, dynamic> json) =>
      _$ChurchFormValidatorsFromJson(json);

  Map<String, dynamic> toJson() => _$ChurchFormValidatorsToJson(this);
}
