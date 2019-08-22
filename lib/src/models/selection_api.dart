/*
*  Filename    :   selection_api.dart
*  Purpose     :	
*  Created     :   2019-08-22 12:59 by Detective Conan
*  Updated     :   2019-08-22 12:59 by Detective Conan 
*  Changes     :
*/

import 'package:json_annotation/json_annotation.dart';

part 'selection_api.g.dart';

@JsonSerializable()
class SelectionApi {
  SelectionApi(this.id, this.branchId, this.moduleId, this.subModuleId,
      this.name, this.description);

  final String id;
  @JsonKey(name: "branch_id")
  final String branchId;
  @JsonKey(name: "module_id")
  final String moduleId;
  @JsonKey(name: "sub_module_id")
  final String subModuleId;
  final String name;
  final String description;

  factory SelectionApi.fromJson(Map<String, dynamic> json) =>
      _$SelectionApiFromJson(json);

  Map<String, dynamic> toJson() => _$SelectionApiToJson(this);
}

