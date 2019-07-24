/*
*  Filename    :   data_contact.dart
*  Purpose     :	
*  Created     :   2019-07-24 16:22 by Detective Conan
*  Updated     :   2019-07-24 16:22 by Detective Conan 
*  Changes     :
*/

import 'package:json_annotation/json_annotation.dart';
import 'package:mt_carmel_app/src/models/contact.dart';

part 'data_contact.g.dart';

@JsonSerializable()
class DataContact{
  DataContact(
      this.draw,
      this.recordsTotal,
      this.recordsFiltered,
      this.data,
      );

  final int draw;
  final int recordsTotal;
  final int recordsFiltered;
  final List<Contact> data;

  factory DataContact.fromJson(Map<String, dynamic> json) => _$DataContactFromJson(json);

  Map<String, dynamic> toJson() => _$DataContactToJson(this);
}