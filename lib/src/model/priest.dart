import 'package:json_annotation/json_annotation.dart';

part 'priest.g.dart';

@JsonSerializable()
class Priest{
  Priest(this.id,this.name, this.position, this.cover_photo);
  
  final int id;
  final String name;
  final String position;
  final String cover_photo;

  factory Priest.fromJson(Map<String, dynamic> json) => _$PriestFromJson(json);

  Map<String, dynamic> toJson() => _$PriestToJson(this);
}

