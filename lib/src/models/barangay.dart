/*
*  Filename    :   barangay.dart
*  Purpose     :	
*  Created     :   2019-08-07 09:00 by Detective Conan
*  Updated     :   2019-08-07 09:00 by Detective Conan 
*  Changes     :
*/

import 'package:json_annotation/json_annotation.dart';

part 'barangay.g.dart';

@JsonSerializable()
class Barangay {
  Barangay(this.id, this.brgyCode, this.name, this.regionCode,
      this.provinceCode, this.cityCode, this.countryCode);

  final String id;
  @JsonKey(name: "brgy_code")
  final String brgyCode;
  final String name;
  @JsonKey(name: "region_code")
  final String regionCode;
  @JsonKey(name: "province_code")
  final String provinceCode;
  @JsonKey(name: "city_code")
  final String cityCode;
  @JsonKey(name: "country_code")
  final String countryCode;

  factory Barangay.fromJson(Map<String, dynamic> json) =>
      _$BarangayFromJson(json);

  Map<String, dynamic> toJson() => _$BarangayToJson(this);
}
