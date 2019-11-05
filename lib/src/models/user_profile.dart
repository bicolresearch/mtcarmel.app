/*
*  Filename    :   user_profile.dart
*  Purpose     :	  Model for user profile
*  Created     :   2019-07-11 16:04 by Detective Conan
*  Updated     :   2019-07-11 16:04 by Detective Conan
*  Changes     :
*/

import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile {
  UserProfile(
      this.id,
      this.username,
      this.firstName,
      this.middleName,
      this.lastName,
      this.email,
      this.address1,
      this.address2,
      this.city,
      this.province,
      this.country,
      this.mobile,
      this.landline,
      this.roleId,
      this.roleName,
      this.mediaId,
      this.mediaPath);

  final id;
  final username;
  @JsonKey(name: "first_name")
  final firstName;
  @JsonKey(name: "middle_name")
  final middleName;
  @JsonKey(name: "last_name")
  final lastName;
  final email;
  @JsonKey(name: "address_1")
  final address1;
  @JsonKey(name: "address_2")
  final address2;
  final city;
  final province;
  final country;
  final mobile;
  final landline;
  @JsonKey(name: "role_id")
  final roleId;
  @JsonKey(name: "role_name")
  final roleName;
  @JsonKey(name: "media_id")
  final mediaId;
  @JsonKey(name: "media_path")
  final mediaPath;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
