/*
*   Filename    :   funeral_chapel.dart
*   Purpose     :
*   Created     :   07/12/2019 2:29 PM by Detective Conan
*   Updated     :   07/12/2019 2:29 PM by Detective Conan
*   Changes     :   
*/

import 'package:json_annotation/json_annotation.dart';

part 'funeral_chapel.g.dart';

@JsonSerializable()
class FuneralChapel {
  FuneralChapel(
      this.id,
      this.name,
      this.age,
      this.civilStatusId,
      this.civilStatusName,
      this.address1,
      this.address2,
      this.city,
      this.province,
      this.country,
      this.dtBirth,
      this.dtDeath,
      this.causeOfDeath,
      this.dtBurial,
      this.placeOfBurial,
      this.nameContactPerson,
      this.relationshipWithTheDeceased,
      this.landlineContactPerson,
      this.mobileContactPerson,
      this.emailContactPerson,
      this.statusId,
      this.statusName,
      this.dtCreated,
      this.dtUpdated,
      this.createdBy,
      this.updatedBy);

  final id;
  final name;
  final age;
  @JsonKey(name: "civil_status_id")
  final civilStatusId;
  @JsonKey(name: "civil_status_name")
  final civilStatusName;
  @JsonKey(name: "address_1")
  final address1;
  @JsonKey(name: "address_2")
  final address2;
  final city;
  final province;
  final country;
  @JsonKey(name: "dt_birth")
  final dtBirth;
  @JsonKey(name: "dt_death")
  final dtDeath;
  @JsonKey(name: "cause_of_death")
  final causeOfDeath;
  @JsonKey(name: "dt_burial")
  final dtBurial;
  @JsonKey(name: "place_of_burial")
  final placeOfBurial;
  @JsonKey(name: "name_contact_person")
  final nameContactPerson;
  @JsonKey(name: "relationship_with_the_deceased")
  final relationshipWithTheDeceased;
  @JsonKey(name: "landline_contact_person")
  final landlineContactPerson;
  @JsonKey(name: "mobile_contact_person")
  final mobileContactPerson;
  @JsonKey(name: "email_contact_person")
  final emailContactPerson;
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

  factory FuneralChapel.fromJson(Map<String, dynamic> json) =>
      _$FuneralChapelFromJson(json);

  Map<String, dynamic> toJson() => _$FuneralChapelToJson(this);
}
