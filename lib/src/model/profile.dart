import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile{
  final String birthday;
  final String firstName;
  final String lastName;
  final String photo;  
  final int id;

  Profile(this.id, this.firstName, this.lastName, this.birthday, this.photo);


  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

