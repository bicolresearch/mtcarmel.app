/*
*  Filename    :   church_service_type.dart
*  Purpose     :	 Model for church service
*  Created     :   2019-07-15 11:08 by Detective Conan
*  Updated     :   2019-07-15 11:08 by Detective Conan 
*  Changes     :
*/

import 'package:json_annotation/json_annotation.dart';

part 'church_service_type.g.dart';

@JsonSerializable()
class ChurchServiceType {
  final List<ChurchServiceSubtype> churchServiceSubtypes;

  ChurchServiceType(this.churchServiceSubtypes);

  factory ChurchServiceType.fromJson(Map<String, dynamic> json) =>
      _$ChurchServiceTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ChurchServiceTypeToJson(this);
}

@JsonSerializable()
class ChurchServiceSubtype {
  ChurchServiceSubtype(this.infoText, this.formFields);

  final String infoText;
  final List<ChurchFormField> formFields;

  factory ChurchServiceSubtype.fromJson(Map<String, dynamic> json) =>
      _$ChurchServiceSubtypeFromJson(json);

  Map<String, dynamic> toJson() => _$ChurchServiceSubtypeToJson(this);
}

@JsonSerializable()
class ChurchFormField {
  ChurchFormField(this.label, this.textFieldType, this.value);

  final String label;
  final String value;
  final String textFieldType;

  factory ChurchFormField.fromJson(Map<String, dynamic> json) =>
      _$ChurchFormFieldFromJson(json);

  Map<String, dynamic> toJson() => _$ChurchFormFieldToJson(this);
}
