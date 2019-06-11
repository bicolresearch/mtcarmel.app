/*
*	Filename		:	pastor.dart
*	Purpose			:	Model for pastor
* Created			: 2019-06-11 15:59:36 by Detective Conan
*	Updated			: 2019-06-11 15:59:36 by Detective Conan 
*	Changes			:
*/
import 'package:json_annotation/json_annotation.dart';

part 'pastor.g.dart';

@JsonSerializable()
class Pastor{
  Pastor(this.id,this.name, this.position);
  
  final int id;
  final String name;
  final String position;

  factory Pastor.fromJson(Map<String, dynamic> json) => _$PastorFromJson(json);

  Map<String, dynamic> toJson() => _$PastorToJson(this);
}

