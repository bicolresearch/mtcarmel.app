import 'package:json_annotation/json_annotation.dart';

part 'ad.g.dart';

@JsonSerializable()
class Ad{
  Ad(this.id,this.icon);
  
  final int id;
  final String icon;

  factory Ad.fromJson(Map<String, dynamic> json) => _$AdFromJson(json);

  Map<String, dynamic> toJson() => _$AdToJson(this);
}

