/*
*  Filename    :   contact.dart
*  Purpose     :	
*  Created     :   2019-07-24 16:22 by Detective Conan
*	 Updated			:   11/09/2019 9:26 AM PM by Detective Conan
*	 Changes			:   Mixed with the list contactData. Adapted to new api
*/

import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  Contact(
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.data,
  );

  final int draw;
  final int recordsTotal;
  final int recordsFiltered;
  final List<ContactData> data;

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}

@JsonSerializable()
class ContactData {
  ContactData(
      this.id,
      this.name,
      this.description,
      this.address1,
      this.address2,
      this.cityCode,
      this.provinceCode,
      this.countryCode,
      this.landLine,
      this.mobile,
      this.email,
      this.dtCreated,
      this.dtUpdated,
      this.cityName,
      this.provinceName,
      this.countryName,
      this.createdBy,
      this.updatedBy);

  final id;
  final name;
  final description;
  final address1;
  final address2;
  @JsonKey(name: "city_code")
  final cityCode;
  @JsonKey(name: "province_code")
  final provinceCode;
  @JsonKey(name: "country_code")
  final countryCode;
  @JsonKey(name: "landline")
  final landLine;
  final mobile;
  final email;
  @JsonKey(name: "dt_created")
  final dtCreated;
  @JsonKey(name: "dt_updated")
  final dtUpdated;
  @JsonKey(name: "city_name")
  final cityName;
  @JsonKey(name: "province_name")
  final provinceName;
  @JsonKey(name: "country_name")
  final countryName;
  @JsonKey(name: "created_by")
  final createdBy;
  @JsonKey(name: "updated_by")
  final updatedBy;

  factory ContactData.fromJson(Map<String, dynamic> json) =>
      _$ContactDataFromJson(json);

  Map<String, dynamic> toJson() => _$ContactDataToJson(this);
}
