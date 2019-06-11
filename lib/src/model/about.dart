import 'package:json_annotation/json_annotation.dart';

part 'about.g.dart';

@JsonSerializable()
class About{
  About(this.id,this.titular, this.diocese, this.date_of_establishment, this.feast_Day);
  
  final int id;
  final String titular;
  final String diocese;
  final String date_of_establishment;
  final String feast_Day;

  factory About.fromJson(Map<String, dynamic> json) => _$AboutFromJson(json);

  Map<String, dynamic> toJson() => _$AboutToJson(this);
}

