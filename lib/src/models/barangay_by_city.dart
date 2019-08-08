/*
*  Filename    :   barangay_by_city.dart
*  Purpose     :	
*  Created     :   2019-08-07 09:00 by Detective Conan
*  Updated     :   2019-08-07 09:00 by Detective Conan 
*  Changes     :
*/

import 'package:json_annotation/json_annotation.dart';

part 'barangay_by_city.g.dart';

@JsonSerializable()
class BarangayByCity {
  BarangayByCity(this.id, this.brgyCode, this.description, this.regionCode,
      this.provinceCode, this.cityCode, this.countryCode);

  final String id;
  @JsonKey(name: "brgy_code")
  final String brgyCode;
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

  factory BarangayByCity.fromJson(Map<String, dynamic> json) =>
      _$BarangayByCityFromJson(json);

  Map<String, dynamic> toJson() => _$BarangayByCityToJson(this);
}
