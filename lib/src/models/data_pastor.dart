/*
*  Filename    :   data_pastor.dart
*  Purpose     :	 model for records of pastors
*  Created     :   2019-07-24 15:57 by Detective Conan
*  Updated     :   2019-07-24 15:57 by Detective Conan 
*  Changes     :
*/

import 'package:json_annotation/json_annotation.dart';
import 'package:mt_carmel_app/src/models/pastor.dart';

part 'data_pastor.g.dart';

@JsonSerializable()
class DataPastor{
  DataPastor(
      this.draw,
      this.recordsTotal,
      this.recordsFiltered,
      this.data,
      );

  final int draw;
  final int recordsTotal;
  final int recordsFiltered;
  final List<Pastor> data;

  factory DataPastor.fromJson(Map<String, dynamic> json) => _$DataPastorFromJson(json);

  Map<String, dynamic> toJson() => _$DataPastorToJson(this);
}