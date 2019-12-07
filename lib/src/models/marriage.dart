/*
*   Filename    :   marriage.dart
*   Purpose     :
*   Created     :   07/12/2019 2:24 PM by Detective Conan
*   Updated     :   07/12/2019 2:24 PM by Detective Conan
*   Changes     :   
*/

import 'package:json_annotation/json_annotation.dart';

part 'marriage.g.dart';

@JsonSerializable()
class Marriage {
  Marriage(
      this.id,
      this.withPreviousMarriage,
      this.isAnyoneAnOfw,
      this.livingAbroad,
      this.isWidower,
      this.groomName,
      this.groomNickname,
      this.groomDtBirth,
      this.groomBirthPlace,
      this.groomReligionId,
      this.groomReligionName,
      this.groomOccupation,
      this.groomWorkPlace,
      this.groomNationalityId,
      this.groomNationalityName,
      this.groomLandline,
      this.groomMobile,
      this.groomEmail,
      this.groomAddress1,
      this.groomAddress2,
      this.groomCity,
      this.groomProvince,
      this.groomCountry,
      this.groomParishName,
      this.groomParishAddress,
      this.groomProvincialAddress,
      this.groomFatherName,
      this.groomFatherNationalityId,
      this.groomFatherNationalityName,
      this.groomMotherName,
      this.groomMotherNationalityId,
      this.groomMotherNationalityName,
      this.brideName,
      this.brideNickname,
      this.brideDtBirth,
      this.brideBirthPlace,
      this.brideReligionId,
      this.brideReligionName,
      this.brideOccupation,
      this.brideWorkPlace,
      this.brideNationalityId,
      this.brideNationalityName,
      this.brideLandline,
      this.brideMobile,
      this.brideEmail,
      this.brideAddress1,
      this.brideAddress2,
      this.brideCity,
      this.brideProvince,
      this.brideCountry,
      this.brideParishName,
      this.brideParishAddress,
      this.brideProvincialAddress,
      this.brideFatherName,
      this.brideFatherNationalityId,
      this.brideFatherNationalityName,
      this.brideMotherName,
      this.brideMotherNationalityId,
      this.brideMotherNationalityName,
      this.sponsorsName,
      this.sponsorsAge,
      this.sponsorsLandline,
      this.sponsorsMobile,
      this.sponsorsAddress,
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
  @JsonKey(name: "with_previous_marriage")
  final withPreviousMarriage;
  @JsonKey(name: "is_anyone_an_ofw")
  final isAnyoneAnOfw;
  @JsonKey(name: "living_abroad")
  final livingAbroad;
  @JsonKey(name: "is_widower")
  final isWidower;
  @JsonKey(name: "groom_name")
  final groomName;
  @JsonKey(name: "groom_nickname")
  final groomNickname;
  @JsonKey(name: "groom_dt_birth")
  final groomDtBirth;
  @JsonKey(name: "groom_birth_place")
  final groomBirthPlace;
  @JsonKey(name: "groom_religion_id")
  final groomReligionId;
  @JsonKey(name: "groom_religion_name")
  final groomReligionName;
  @JsonKey(name: "groom_occupation")
  final groomOccupation;
  @JsonKey(name: "groom_work_place")
  final groomWorkPlace;
  @JsonKey(name: "groom_nationality_id")
  final groomNationalityId;
  @JsonKey(name: "groom_nationality_name")
  final groomNationalityName;
  @JsonKey(name: "groom_landline")
  final groomLandline;
  @JsonKey(name: "groom_mobile")
  final groomMobile;
  @JsonKey(name: "groom_email")
  final groomEmail;
  @JsonKey(name: "groom_address_1")
  final groomAddress1;
  @JsonKey(name: "groom_address_2")
  final groomAddress2;
  @JsonKey(name: "groom_city")
  final groomCity;
  @JsonKey(name: "groom_province")
  final groomProvince;
  @JsonKey(name: "groom_country")
  final groomCountry;
  @JsonKey(name: "groom_parish_name")
  final groomParishName;
  @JsonKey(name: "groom_parish_address")
  final groomParishAddress;
  @JsonKey(name: "groom_provincial_address")
  final groomProvincialAddress;
  @JsonKey(name: "groom_father_name")
  final groomFatherName;
  @JsonKey(name: "groom_father_nationality_id")
  final groomFatherNationalityId;
  @JsonKey(name: "groom_father_nationality_name")
  final groomFatherNationalityName;
  @JsonKey(name: "groom_mother_name")
  final groomMotherName;
  @JsonKey(name: "groom_mother_nationality_id")
  final groomMotherNationalityId;
  @JsonKey(name: "groom_mother_nationality_name")
  final groomMotherNationalityName;
  @JsonKey(name: "bride_name")
  final brideName;
  @JsonKey(name: "bride_nickname")
  final brideNickname;
  @JsonKey(name: "bride_dt_birth")
  final brideDtBirth;
  @JsonKey(name: "bride_birth_place")
  final brideBirthPlace;
  @JsonKey(name: "bride_religion_id")
  final brideReligionId;
  @JsonKey(name: "bride_religion_name")
  final brideReligionName;
  @JsonKey(name: "bride_occupation")
  final brideOccupation;
  @JsonKey(name: "bride_work_place")
  final brideWorkPlace;
  @JsonKey(name: "bride_nationality_id")
  final brideNationalityId;
  @JsonKey(name: "bride_nationality_name")
  final brideNationalityName;
  @JsonKey(name: "bride_landline")
  final brideLandline;
  @JsonKey(name: "bride_mobile")
  final brideMobile;
  @JsonKey(name: "bride_email")
  final brideEmail;
  @JsonKey(name: "bride_address_1")
  final brideAddress1;
  @JsonKey(name: "bride_address_2")
  final brideAddress2;
  @JsonKey(name: "bride_city")
  final brideCity;
  @JsonKey(name: "bride_province")
  final brideProvince;
  @JsonKey(name: "bride_country")
  final brideCountry;
  @JsonKey(name: "bride_parish_name")
  final brideParishName;
  @JsonKey(name: "bride_parish_address")
  final brideParishAddress;
  @JsonKey(name: "bride_provincial_address")
  final brideProvincialAddress;
  @JsonKey(name: "bride_father_name")
  final brideFatherName;
  @JsonKey(name: "bride_father_nationality_id")
  final brideFatherNationalityId;
  @JsonKey(name: "bride_father_nationality_name")
  final brideFatherNationalityName;
  @JsonKey(name: "bride_mother_name")
  final brideMotherName;
  @JsonKey(name: "bride_mother_nationality_id")
  final brideMotherNationalityId;
  @JsonKey(name: "bride_mother_nationality_name")
  final brideMotherNationalityName;
  @JsonKey(name: "sponsors_name")
  final sponsorsName;
  @JsonKey(name: "sponsors_age")
  final sponsorsAge;
  @JsonKey(name: "sponsors_landline")
  final sponsorsLandline;
  @JsonKey(name: "sponsors_mobile")
  final sponsorsMobile;
  @JsonKey(name: "sponsors_address")
  final sponsorsAddress;
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

  factory Marriage.fromJson(Map<String, dynamic> json) =>
      _$MarriageFromJson(json);

  Map<String, dynamic> toJson() => _$MarriageToJson(this);
}
