/*
*  Filename    :   data_carmelite.dart
*  Purpose     :	
*  Created     :   2019-07-24 15:24 by Detective Conan
*	 Updated			:   25/09/2019 4:39 PM PM by Detective Conan
*	 Changes			:   Renamed to Carmelite. This model is not just for Priest
*                   this can be used for Pastor and nun
*
*/

import 'package:json_annotation/json_annotation.dart';
import 'package:mt_carmel_app/src/models/carmelite.dart';

part 'data_carmelite.g.dart';

@JsonSerializable()
class DataCarmelite{
  DataCarmelite(
      this.draw,
      this.recordsTotal,
      this.recordsFiltered,
      this.data,
      );

  final int draw;
  final int recordsTotal;
  final int recordsFiltered;
  final List<Carmelite> data;

  factory DataCarmelite.fromJson(Map<String, dynamic> json) => _$DataCarmeliteFromJson(json);

  Map<String, dynamic> toJson() => _$DataCarmeliteToJson(this);
}