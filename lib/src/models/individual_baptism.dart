/*
*   Filename    :   individual_baptism.dart
*   Purpose     :
*   Created     :   04/12/2019 9:57 AM by Detective Conan
*   Updated     :   04/12/2019 9:57 AM by Detective Conan
*   Changes     :   
*/

import 'package:json_annotation/json_annotation.dart';

part 'individual_baptism.g.dart';

@JsonSerializable()
class IndividualBaptism {
  IndividualBaptism(
      this.id,
      this.name,
      this.dtBirth,
      this.birthPlace,
      this.fatherName,
      this.fatherReligionId,
      this.fatherReligionName,
      this.fatherDtBirth,
      this.fatherBirthPlace,
      this.motherName,
      this.motherReligionId,
      this.motherReligionName,
      this.motherDtBirth,
      this.motherBirthPlace,
      this.address1,
      this.address2,
      this.city,
      this.province,
      this.country,
      this.marriageId,
      this.marriageName,
      this.placeMarriage,
      this.nameContactPerson,
      this.landlineContactPerson,
      this.mobileContactPerson,
      this.officiatingPriestId,
      this.officiatingPriestName,
      this.dtBaptism,
      this.timeBaptism,
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
  @JsonKey(name: "birth_place")
  final birthPlace;
  @JsonKey(name: "father_name")
  final fatherName;
  @JsonKey(name: "father_religion_id")
  final fatherReligionId;
  @JsonKey(name: "father_religion_name")
  final fatherReligionName;
  @JsonKey(name: "father_dt_birth")
  final fatherDtBirth;
  @JsonKey(name: "father_birth_place")
  final fatherBirthPlace;
  @JsonKey(name: "mother_name")
  final motherName;
  @JsonKey(name: "mother_religion_id")
  final motherReligionId;
  @JsonKey(name: "mother_religion_name")
  final motherReligionName;
  @JsonKey(name: "mother_dt_birth")
  final motherDtBirth;
  @JsonKey(name: "mother_birth_place")
  final motherBirthPlace;
  @JsonKey(name: "address_1")
  final address1;
  @JsonKey(name: "address_2")
  final address2;
  final city;
  final province;
  final country;
  @JsonKey(name: "marriage_id")
  final marriageId;
  @JsonKey(name: "marriage_name")
  final marriageName;
  @JsonKey(name: "place_marriage")
  final placeMarriage;
  @JsonKey(name: "name_contact_person")
  final nameContactPerson;
  @JsonKey(name: "landline_contact_person")
  final landlineContactPerson;
  @JsonKey(name: "mobile_contact_person")
  final mobileContactPerson;
  @JsonKey(name: "officiating_priest_id")
  final officiatingPriestId;
  @JsonKey(name: "officiating_priest_name")
  final officiatingPriestName;
  @JsonKey(name: "dt_baptism")
  final dtBaptism;
  @JsonKey(name: "time_baptism")
  final timeBaptism;
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

  factory IndividualBaptism.fromJson(Map<String, dynamic> json) =>
      _$IndividualBaptismFromJson(json);

  Map<String, dynamic> toJson() => _$IndividualBaptismToJson(this);
}

@JsonSerializable()
class DataActionIndividualBaptism {
  DataActionIndividualBaptism(this.data, this.actions);

  final DataIndividualBaptism data;
  final Map<String, String> actions;

  factory DataActionIndividualBaptism.fromJson(Map<String, dynamic> json) =>
      _$DataActionIndividualBaptismFromJson(json);

  Map<String, dynamic> toJson() => _$DataActionIndividualBaptismToJson(this);
}

@JsonSerializable()
class DataIndividualBaptism {
  DataIndividualBaptism(
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.data,
  );

  final int draw;
  final int recordsTotal;
  final int recordsFiltered;
  final List<IndividualBaptism> data;

  factory DataIndividualBaptism.fromJson(Map<String, dynamic> json) =>
      _$DataIndividualBaptismFromJson(json);

  Map<String, dynamic> toJson() => _$DataIndividualBaptismToJson(this);
}
