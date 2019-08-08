/*
*  Filename    :   province_by_country.dart
*  Purpose     :	
*  Created     :   2019-08-07 09:49 by Detective Conan
*  Updated     :   2019-08-07 09:49 by Detective Conan 
*  Changes     :
*/

import 'package:json_annotation/json_annotation.dart';

part 'province_by_country.g.dart';

@JsonSerializable()
class ProvinceByCountry {
  ProvinceByCountry(this.id, this.csgpCode, this.description, this.regionCode,
      this.provinceCode, this.cityCode, this.countryCode);

  final String id;
  @JsonKey(name: "csgp_code")
  final String csgpCode;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "region_code")
  final String regionCode;
  @JsonKey(name: "province_code")
  final String provinceCode;
  @JsonKey(name: "city_code")
  final String cityCode;
  @JsonKey(name: "country_code")
  final String countryCode;

  factory ProvinceByCountry.fromJson(Map<String, dynamic> json) =>
      _$ProvinceByCountryFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceByCountryToJson(this);
}
