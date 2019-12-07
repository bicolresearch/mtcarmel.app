/*
*   Filename    :   crypt_lobby.dart
*   Purpose     :
*   Created     :   07/12/2019 2:26 PM by Detective Conan
*   Updated     :   07/12/2019 2:26 PM by Detective Conan
*   Changes     :   
*/

import 'package:json_annotation/json_annotation.dart';

part 'crypt_lobby.g.dart';

@JsonSerializable()
class CryptLobby {
  CryptLobby(
      this.id,
      this.name,
      this.nameContactPerson,
      this.landlineContactPerson,
      this.mobileContactPerson,
      this.dtService,
      this.timeService,
      this.duration,
      this.officiatingPriestId,
      this.officiatingPriestName,
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
  @JsonKey(name: "landline_contact_person")
  final landlineContactPerson;
  @JsonKey(name: "mobile_contact_person")
  final mobileContactPerson;
  @JsonKey(name: "dt_service")
  final dtService;
  @JsonKey(name: "time_service")
  final timeService;
  final duration;
  @JsonKey(name: "officiating_priest_id")
  final officiatingPriestId;
  @JsonKey(name: "officiating_priest_name")
  final officiatingPriestName;
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

  factory CryptLobby.fromJson(Map<String, dynamic> json) =>
      _$CryptLobbyFromJson(json);

  Map<String, dynamic> toJson() => _$CryptLobbyToJson(this);
}
