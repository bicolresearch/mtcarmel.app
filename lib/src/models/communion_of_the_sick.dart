/*
*   Filename    :   communion_of_the_sick.dart
*   Purpose     :
*   Created     :   07/12/2019 2:07 PM by Detective Conan
*   Updated     :   07/12/2019 2:07 PM by Detective Conan
*   Changes     :   
*/

import 'package:json_annotation/json_annotation.dart';

part 'communion_of_the_sick.g.dart';

@JsonSerializable()
class CommunionOfTheSick {
  CommunionOfTheSick(
      this.id,
      this.name,
      this.dtBirth,
      this.spouseName,
      this.spouseDtBirth,
      this.address1,
      this.address2,
      this.city,
      this.province,
      this.country,
      this.landline,
      this.mobile,
      this.dtMarriage,
      this.dtLastConfession,
      this.timePreferredVisit,
      this.dayPreferredVisit,
      this.householdsName,
      this.householdsAge,
      this.householdsLandline,
      this.householdsMobile,
      this.householdsAddress,
      this.nameContactPerson,
      this.landlineContactPerson,
      this.mobileContactPerson,
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
  @JsonKey(name: "spouse_name")
  final spouseName;
  @JsonKey(name: "spouse_dt_birth")
  final spouseDtBirth;
  @JsonKey(name: "address_1")
  final address1;
  @JsonKey(name: "address_2")
  final address2;
  final city;
  final province;
  final country;
  final landline;
  final mobile;
  @JsonKey(name: "dt_marriage")
  final dtMarriage;
  @JsonKey(name: "dt_last_confession")
  final dtLastConfession;
  @JsonKey(name: "time_preferred_visit")
  final timePreferredVisit;
  @JsonKey(name: "day_preferred_visit")
  final dayPreferredVisit;
  @JsonKey(name: "households_name")
  final householdsName;
  @JsonKey(name: "households_age")
  final householdsAge;
  @JsonKey(name: "households_landline")
  final householdsLandline;
  @JsonKey(name: "households_mobile")
  final householdsMobile;
  @JsonKey(name: "households_address")
  final householdsAddress;
  @JsonKey(name: "name_contact_person")
  final nameContactPerson;
  @JsonKey(name: "landline_contact_person")
  final landlineContactPerson;
  @JsonKey(name: "mobile_contact_person")
  final mobileContactPerson;
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

  factory CommunionOfTheSick.fromJson(Map<String, dynamic> json) =>
      _$CommunionOfTheSickFromJson(json);

  Map<String, dynamic> toJson() => _$CommunionOfTheSickToJson(this);
}
