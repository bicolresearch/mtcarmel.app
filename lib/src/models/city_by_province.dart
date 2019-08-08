/*
*  Filename    :   city_by_province.dart
*  Purpose     :	
*  Created     :   2019-08-07 09:06 by Detective Conan
*  Updated     :   2019-08-07 09:06 by Detective Conan 
*  Changes     :
*/

import 'package:json_annotation/json_annotation.dart';

part 'city_by_province.g.dart';

@JsonSerializable()
class CityByProvince {
  CityByProvince(this.id, this.psgcCode, this.description, this.regionCode,
      this.provinceCode, this.cityCode, this.countryCode);

  final String id;
  @JsonKey(name: "psgc_code")
  final String psgcCode;
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

  factory CityByProvince.fromJson(Map<String, dynamic> json) =>
      _$CityByProvinceFromJson(json);

  Map<String, dynamic> toJson() => _$CityByProvinceToJson(this);
}
