import 'dart:collection';

import 'package:json_annotation/json_annotation.dart';

part 'about.g.dart';

@JsonSerializable()
class About{
  About(this.id, this.branchId, this.titular, this.diocese, this.dateOfEstablishment, this.feastDay, this.content);
  
  final String id;
  @JsonKey(name: "branch_id")
  final String branchId;
  final String titular;
  final String diocese;
  @JsonKey(name: "date_of_establishment")
  final String dateOfEstablishment;
  @JsonKey(name: "feast_Day")
  final String feastDay;
  final String content;

  factory About.fromJson(Map<String, dynamic> json) => _$AboutFromJson(json);

  Map<String, dynamic> toJson() => _$AboutToJson(this);
}

