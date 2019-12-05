/*
*   Filename    :   module_model.dart
*   Purpose     :
*   Created     :   04/12/2019 3:02 PM by Detective Conan
*   Updated     :   04/12/2019 3:02 PM by Detective Conan
*   Changes     :   
*/

import 'package:json_annotation/json_annotation.dart';

part 'module_model.g.dart';

@JsonSerializable()
class ModuleModel {
  ModuleModel(this.id, this.prayer, this.statusId, this.statusName,
      this.dtCreated, this.dtUpdated, this.createdBy, this.updatedBy);

  @JsonKey(name: "id")
  final String id;
  final String prayer;
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

  factory ModuleModel.fromJson(Map<String, dynamic> json) =>
      _$ModuleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ModuleModelToJson(this);
}

@JsonSerializable()
class DataActionModuleModel {
  DataActionModuleModel(this.data, this.actions);

  final DataModuleModel data;
  final Map<String, String> actions;

  factory DataActionModuleModel.fromJson(Map<String, dynamic> json) =>
      _$DataActionModuleModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataActionModuleModelToJson(this);
}

@JsonSerializable()
class DataModuleModel {
  DataModuleModel(
      this.draw,
      this.recordsTotal,
      this.recordsFiltered,
      this.data,
      );

  final int draw;
  final int recordsTotal;
  final int recordsFiltered;
  final List<ModuleModel> data;

  factory DataModuleModel.fromJson(Map<String, dynamic> json) =>
      _$DataModuleModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModuleModelToJson(this);
}