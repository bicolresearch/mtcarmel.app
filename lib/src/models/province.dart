/*
*  Filename    :   province.dart
*  Purpose     :	
*  Created     :   2019-08-07 09:49 by Detective Conan
*  Updated     :   2019-08-07 09:49 by Detective Conan 
*  Changes     :
*/

import 'package:json_annotation/json_annotation.dart';

part 'province.g.dart';

@JsonSerializable()
class Province {
  Province(this.id, this.psgcCode, this.name, this.regionCode,
      this.provinceCode, this.countryCode);

  final String id;
  @JsonKey(name: "psgc_code")
  final String psgcCode;
  final String name;
  @JsonKey(name: "region_code")
  final String regionCode;
  @JsonKey(name: "province_code")
  final String provinceCode;
  @JsonKey(name: "country_code")
  final String countryCode;

  factory Province.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceToJson(this);
}
