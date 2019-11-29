/*
*   Filename    :   liturgical.dart
*   Purpose     :
*   Created     :   29/11/2019 9:11 AM by Detective Conan
*   Updated     :   29/11/2019 9:11 AM by Detective Conan
*   Changes     :   
*/

import 'package:json_annotation/json_annotation.dart';

part 'liturgical.g.dart';

@JsonSerializable()
class Liturgical {
  Liturgical(this.id, this.name, this.statusId, this.statusName, this.dtUpdated,
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

  factory Liturgical.fromJson(Map<String, dynamic> json) =>
      _$LiturgicalFromJson(json);

  Map<String, dynamic> toJson() => _$LiturgicalToJson(this);
}

@JsonSerializable()
class DataActionLiturgical {
  DataActionLiturgical(this.data, this.actions);

  final DataLiturgical data;
  final Map<String, String> actions;

  factory DataActionLiturgical.fromJson(Map<String, dynamic> json) =>
      _$DataActionLiturgicalFromJson(json);

  Map<String, dynamic> toJson() => _$DataActionLiturgicalToJson(this);
}

@JsonSerializable()
class DataLiturgical {
  DataLiturgical(
      this.draw,
      this.recordsTotal,
      this.recordsFiltered,
      this.data,
      );

  final int draw;
  final int recordsTotal;
  final int recordsFiltered;
  final List<Liturgical> data;

  factory DataLiturgical.fromJson(Map<String, dynamic> json) =>
      _$DataLiturgicalFromJson(json);

  Map<String, dynamic> toJson() => _$DataLiturgicalToJson(this);
}

