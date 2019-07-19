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
      this.branchId,
      this.roleId,
      this.roleName,
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
      this.landLine,
      this.avatar);

  final String id;
  @JsonKey(name: "branch_id")
  final String branchId;
  @JsonKey(name: "role_id")
  final String roleId;
  @JsonKey(name: "role_name")
  final String roleName;
  final String username;
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "middle_name")
  final String middleName;
  @JsonKey(name: "last_name")
  final String lastName;
  final String email;
  @JsonKey(name: "address_1")
  final String address1;
  @JsonKey(name: "address_2")
  final String address2;
  final String city;
  final String province;
  final String country;
  final String mobile;
  @JsonKey(name: "landline")
  final String landLine;
  @JsonKey(name: "avatar")
  final String avatar;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
