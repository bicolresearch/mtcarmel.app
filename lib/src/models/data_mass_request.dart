/*
*  Filename    :   data_mass_request.dart
*  Purpose     :	
*  Created     :   2019-08-20 16:08 by Detective Conan
*  Updated     :   2019-08-20 16:08 by Detective Conan 
*  Changes     :
*/

import 'package:json_annotation/json_annotation.dart';
import 'package:mt_carmel_app/src/models/mass_request.dart';

part 'data_mass_request.g.dart';

@JsonSerializable()
class DataActionMassRequest {
  DataActionMassRequest(this.data, this.actions);

  final DataMassRequest data;
  final Map<String, String> actions;

  factory DataActionMassRequest.fromJson(Map<String, dynamic> json) =>
      _$DataActionMassRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DataActionMassRequestToJson(this);
}

@JsonSerializable()
class DataMassRequest {
  DataMassRequest(
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.data,
  );

  final int draw;
  final int recordsTotal;
  final int recordsFiltered;
  final List<MassRequest> data;

  factory DataMassRequest.fromJson(Map<String, dynamic> json) =>
      _$DataMassRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DataMassRequestToJson(this);
}
