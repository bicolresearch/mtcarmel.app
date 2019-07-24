/*
*  Filename    :   data_about.dart
*  Purpose     :	 Model for the about records
*  Created     :   2019-07-24 16:08 by Detective Conan
*  Updated     :   2019-07-24 16:08 by Detective Conan 
*  Changes     :
*/

import 'package:json_annotation/json_annotation.dart';
import 'package:mt_carmel_app/src/models/about.dart';

part 'data_about.g.dart';

@JsonSerializable()
class DataAbout{
  DataAbout(
      this.draw,
      this.recordsTotal,
      this.recordsFiltered,
      this.data,
      );

  final int draw;
  final int recordsTotal;
  final int recordsFiltered;
  final List<About> data;

  factory DataAbout.fromJson(Map<String, dynamic> json) => _$DataAboutFromJson(json);

  Map<String, dynamic> toJson() => _$DataAboutToJson(this);
}