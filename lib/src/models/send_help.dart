/*
*  Filename    :   send_help.dart.dart
*  Purpose     :	 Model for type of donation
*  Created     :   2019-07-02 16:13 by Detective Conan
*  Updated     :   2019-07-02 16:13 by Detective Conan 
*  Changes     :
*/

import 'package:json_annotation/json_annotation.dart';

part 'send_help.g.dart';

@JsonSerializable()
class SendHelp {
  SendHelp(this.draw, this.recordsTotal, this.recordsFiltered, this.data);

  final draw;
  @JsonKey(name: "recordsTotal")
  final recordsTotal;
  @JsonKey(name: "recordsFiltered")
  final recordsFiltered;
  final List<SendHelpData> data;


  factory SendHelp.fromJson(Map<String, dynamic> json) =>
      _$SendHelpFromJson(json);

  Map<String, dynamic> toJson() => _$SendHelpToJson(this);
}


@JsonSerializable()
class SendHelpData {

  SendHelpData(this.id, this.name, this.description, this.dtCreated,
      this.dtUpdated, this.createdBy, this.updatedBy);

  final id;
  final name;
  final description;
  @JsonKey(name: "dt_created")
  final dtCreated;
  @JsonKey(name: "dt_updated")
  final dtUpdated;
  @JsonKey(name: "created_by")
  final createdBy;
  @JsonKey(name: "updated_by")
  final updatedBy;

  factory SendHelpData.fromJson(Map<String, dynamic> json) =>
      _$SendHelpDataFromJson(json);

  Map<String, dynamic> toJson() => _$SendHelpDataToJson(this);
}
