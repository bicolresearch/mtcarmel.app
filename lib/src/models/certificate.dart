/*
*   Filename    :   Certificate.dart
*   Purpose     :
*   Created     :   29/11/2019 9:11 AM by Detective Conan
*   Updated     :   29/11/2019 9:11 AM by Detective Conan
*   Changes     :   
*/

import 'package:json_annotation/json_annotation.dart';

part 'certificate.g.dart';

@JsonSerializable()
class Certificate {
  Certificate(
      this.id,
      this.name,
      this.certificateId,
      this.certificateName,
      this.purposeCertificateId,
      this.purposeCertificateName,
      this.nameContactPerson,
      this.landlineContactPerson,
      this.mobileContactPerson,
      this.dtMarriage,
      this.statusId,
      this.statusName,
      this.dtCreated,
      this.dtUpdated,
      this.createdBy,
      this.updatedBy);

  final id;
  final name;
  @JsonKey(name: "certificate_id")
  final certificateId;
  @JsonKey(name: "certificate_name")
  final certificateName;
  @JsonKey(name: "purpose_certificate_id")
  final purposeCertificateId;
  @JsonKey(name: "purpose_certificate_name")
  final purposeCertificateName;
  @JsonKey(name: "name_contact_person")
  final nameContactPerson;
  @JsonKey(name: "landline_contact_person")
  final landlineContactPerson;
  @JsonKey(name: "mobile_contact_person")
  final mobileContactPerson;
  @JsonKey(name: "dt_marriage")
  final dtMarriage;
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

  factory Certificate.fromJson(Map<String, dynamic> json) =>
      _$CertificateFromJson(json);

  Map<String, dynamic> toJson() => _$CertificateToJson(this);
}
