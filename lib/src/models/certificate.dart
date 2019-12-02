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
  Certificate(this.id, this.name, this.statusId, this.statusName, this.dtUpdated,
      this.createdBy, this.updatedBy);

  final id;
  final name;
  @JsonKey(name: "status_id")
  final statusId;
  @JsonKey(name: "status_name")
  final statusName;
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

@JsonSerializable()
class DataActionCertificate {
  DataActionCertificate(this.data, this.actions);

  final DataCertificate data;
  final Map<String, String> actions;

  factory DataActionCertificate.fromJson(Map<String, dynamic> json) =>
      _$DataActionCertificateFromJson(json);

  Map<String, dynamic> toJson() => _$DataActionCertificateToJson(this);
}

@JsonSerializable()
class DataCertificate {
  DataCertificate(
      this.draw,
      this.recordsTotal,
      this.recordsFiltered,
      this.data,
      );

  final int draw;
  final int recordsTotal;
  final int recordsFiltered;
  final List<Certificate> data;

  factory DataCertificate.fromJson(Map<String, dynamic> json) =>
      _$DataCertificateFromJson(json);

  Map<String, dynamic> toJson() => _$DataCertificateToJson(this);
}

