/*
*   Filename    :   fmh_hall.dart
*   Purpose     :
*   Created     :   07/12/2019 2:16 PM by Detective Conan
*   Updated     :   07/12/2019 2:16 PM by Detective Conan
*   Changes     :   
*/

import 'package:json_annotation/json_annotation.dart';

part 'fmh_hall.g.dart';

@JsonSerializable()
class FmhHall {
  FmhHall(
      this.id,
      this.name,
      this.address1,
      this.address2,
      this.city,
      this.province,
      this.country,
      this.eventId,
      this.eventName,
      this.nameContactPerson,
      this.landlineContactPerson,
      this.mobileContactPerson,
      this.packageId,
      this.packageName,
      this.dtService,
      this.timeService,
      this.duration,
      this.statusId,
      this.statusName,
      this.dtCreated,
      this.dtUpdated,
      this.createdBy,
      this.updatedBy);

  final id;
  final name;
  @JsonKey(name: "address_1")
  final address1;
  @JsonKey(name: "address_2")
  final address2;
  final city;
  final province;
  final country;
  @JsonKey(name: "event_id")
  final eventId;
  @JsonKey(name: "event_name")
  final eventName;
  @JsonKey(name: "name_contact_person")
  final nameContactPerson;
  @JsonKey(name: "landline_contact_person")
  final landlineContactPerson;
  @JsonKey(name: "mobile_contact_person")
  final mobileContactPerson;
  @JsonKey(name: "package_id")
  final packageId;
  @JsonKey(name: "package_name")
  final packageName;
  @JsonKey(name: "dt_service")
  final dtService;
  @JsonKey(name: "time_service")
  final timeService;
  final duration;
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

  factory FmhHall.fromJson(Map<String, dynamic> json) =>
      _$FmhHallFromJson(json);

  Map<String, dynamic> toJson() => _$FmhHallToJson(this);
}
