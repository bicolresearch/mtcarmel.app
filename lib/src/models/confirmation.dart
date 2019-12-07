/*
*   Filename    :   confirmation.dart
*   Purpose     :
*   Created     :   07/12/2019 2:14 PM by Detective Conan
*   Updated     :   07/12/2019 2:14 PM by Detective Conan
*   Changes     :   
*/

import 'package:json_annotation/json_annotation.dart';

part 'confirmation.g.dart';

@JsonSerializable()
class Confirmation {
  Confirmation(
      this.id,
      this.name,
      this.dtBirth,
      this.address1,
      this.address2,
      this.city,
      this.province,
      this.country,
      this.dtBaptism,
      this.churchOfBaptism,
      this.fatherName,
      this.motherName,
      this.nameContactPerson,
      this.landlineContactPerson,
      this.mobileContactPerson,
      this.remarks,
      this.sponsor,
      this.requirements,
      this.statusId,
      this.statusName,
      this.dtCreated,
      this.dtUpdated,
      this.createdBy,
      this.updatedBy);

  final id;
  final name;
  @JsonKey(name: "dt_birth")
  final dtBirth;
  @JsonKey(name: "address_1")
  final address1;
  @JsonKey(name: "address_2")
  final address2;
  final city;
  final province;
  final country;
  @JsonKey(name: "dt_baptism")
  final dtBaptism;
  @JsonKey(name: "church_of_baptism")
  final churchOfBaptism;
  @JsonKey(name: "father_name")
  final fatherName;
  @JsonKey(name: "mother_name")
  final motherName;
  @JsonKey(name: "name_contact_person")
  final nameContactPerson;
  @JsonKey(name: "landline_contact_person")
  final landlineContactPerson;
  @JsonKey(name: "mobile_contact_person")
  final mobileContactPerson;
  final remarks;
  final sponsor;
  final requirements;
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

  factory Confirmation.fromJson(Map<String, dynamic> json) =>
      _$ConfirmationFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmationToJson(this);
}
