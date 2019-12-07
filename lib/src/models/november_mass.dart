/*
*   Filename    :   november_mass.dart
*   Purpose     :
*   Created     :   07/12/2019 2:34 PM by Detective Conan
*   Updated     :   07/12/2019 2:34 PM by Detective Conan
*   Changes     :   
*/

import 'package:json_annotation/json_annotation.dart';

part 'november_mass.g.dart';

@JsonSerializable()
class NovemberMass {
  NovemberMass(
      this.id,
      this.name,
      this.nameContactPerson,
      this.address1,
      this.address2,
      this.city,
      this.province,
      this.country,
      this.statusId,
      this.statusName,
      this.dtCreated,
      this.dtUpdated,
      this.createdBy,
      this.updatedBy);

  final id;
  final name;
  @JsonKey(name: "name_contact_person")
  final nameContactPerson;
  @JsonKey(name: "address_1")
  final address1;
  @JsonKey(name: "address_2")
  final address2;
  final city;
  final province;
  final country;
  @JsonKey(name: "status_id")
  final statusId;
  @JsonKey(name: "status_name")
  final statusName;
  @JsonKey(name: "dt_created")
  final dtCreated;
  @JsonKey(name: "dt_updated")
  final dtUpdated;
  @JsonKey(name: "created_by")
  final createdBy;
  @JsonKey(name: "updated_by")
  final updatedBy;

  factory NovemberMass.fromJson(Map<String, dynamic> json) =>
      _$NovemberMassFromJson(json);

  Map<String, dynamic> toJson() => _$NovemberMassToJson(this);
}
