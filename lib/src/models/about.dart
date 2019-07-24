/*
*	Filename		:	about.dart
*	Purpose			:	model for the about the parish screen
* Created			: 2019-06-04 17:52:50 by Detective Conan
*	Updated			:	2019-07-02 09:56:21 by Detective Conan
*	Changes			: Changed the feast_Day to feast_day
*/

import 'dart:collection';

import 'package:json_annotation/json_annotation.dart';

part 'about.g.dart';

@JsonSerializable()
class About {
  About(
      this.id,
      this.branchId,
      this.titular,
      this.diocese,
      this.dateOfEstablishment,
      this.feastDay,
      this.content,
      this.postedOn,
      this.updatedOn,
      this.author);

  final String id;
  @JsonKey(name: "branch_id")
  final String branchId;
  final String titular;
  final String diocese;
  @JsonKey(name: "date_of_establishment")
  final String dateOfEstablishment;
  @JsonKey(name: "feast_day")
  final String feastDay;
  final String content;
  @JsonKey(name: "posted_on")
  final String postedOn;
  @JsonKey(name: "updated_on")
  final String updatedOn;
  final String author;

  factory About.fromJson(Map<String, dynamic> json) => _$AboutFromJson(json);

  Map<String, dynamic> toJson() => _$AboutToJson(this);
}
