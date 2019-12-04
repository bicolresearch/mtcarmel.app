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
  IndividualBaptism(this.id, this.name, this.statusId, this.statusName,
      this.dtCreated, this.dtUpdated, this.createdBy, this.updatedBy);

  final String id;
  final String name;
  @JsonKey(name: "status_id")
  final statusId;
  @JsonKey(name: "status_name")
  final String statusName;
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
