/*
*   Filename    :   funeral_service.dart
*   Purpose     :
*   Created     :   07/12/2019 2:32 PM by Detective Conan
*   Updated     :   07/12/2019 2:32 PM by Detective Conan
*   Changes     :   
*/

import 'package:json_annotation/json_annotation.dart';

part 'funeral_service.g.dart';

@JsonSerializable()
class FuneralService {
  FuneralService(
      this.id,
      this.name,
      this.civilStatusId,
      this.civilStatusName,
      this.dtBirth,
      this.dtDeath,
      this.causeOfDeath,
      this.funeralLocationId,
      this.funeralLocationName,
      this.serviceId,
      this.serviceName,
      this.dtService,
      this.timeService,
      this.dtInternment,
      this.timeInternment,
      this.placeInternment,
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
  @JsonKey(name: "civil_status_id")
  final civilStatusId;
  @JsonKey(name: "civil_status_name")
  final civilStatusName;
  @JsonKey(name: "dt_birth")
  final dtBirth;
  @JsonKey(name: "dt_death")
  final dtDeath;
  @JsonKey(name: "cause_of_death")
  final causeOfDeath;
  @JsonKey(name: "funeral_location_id")
  final funeralLocationId;
  @JsonKey(name: "funeral_location_name")
  final funeralLocationName;
  @JsonKey(name: "service_id")
  final serviceId;
  @JsonKey(name: "service_name")
  final serviceName;
  @JsonKey(name: "dt_service")
  final dtService;
  @JsonKey(name: "time_service")
  final timeService;
  @JsonKey(name: "dt_internment")
  final dtInternment;
  @JsonKey(name: "time_internment")
  final timeInternment;
  @JsonKey(name: "place_internment")
  final placeInternment;
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

  factory FuneralService.fromJson(Map<String, dynamic> json) =>
      _$FuneralServiceFromJson(json);

  Map<String, dynamic> toJson() => _$FuneralServiceToJson(this);
}
