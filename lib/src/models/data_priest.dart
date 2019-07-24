/*
*  Filename    :   data_priest.dart
*  Purpose     :	
*  Created     :   2019-07-24 15:24 by Detective Conan
*  Updated     :   2019-07-24 15:24 by Detective Conan 
*  Changes     :
*/

import 'package:json_annotation/json_annotation.dart';
import 'package:mt_carmel_app/src/models/priest.dart';

part 'data_priest.g.dart';

@JsonSerializable()
class DataPriest{
  DataPriest(
      this.draw,
      this.recordsTotal,
      this.recordsFiltered,
      this.data,
      );

  final int draw;
  final int recordsTotal;
  final int recordsFiltered;
  final List<Priest> data;

  factory DataPriest.fromJson(Map<String, dynamic> json) => _$DataPriestFromJson(json);

  Map<String, dynamic> toJson() => _$DataPriestToJson(this);
}