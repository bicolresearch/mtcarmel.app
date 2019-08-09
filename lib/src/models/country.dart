/*
*  Filename    :   country.dart
*  Purpose     :	
*  Created     :   2019-08-09 09:02 by Detective Conan
*  Updated     :   2019-08-09 09:02 by Detective Conan 
*  Changes     :
*/

import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country {
  Country(this.id, this.name, this.countryCode, this.landlineFormat,
      this.mobileFormat, this.code);

  final String id;
  final String name;
  final String code;
  @JsonKey(name: "country_code")
  final String countryCode;
  @JsonKey(name: "landline_format")
  final String landlineFormat;
  @JsonKey(name: "mobile_format")
  final String mobileFormat;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}