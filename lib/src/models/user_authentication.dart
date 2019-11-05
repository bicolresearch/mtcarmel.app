/*
*  Filename    :   user_authentication.dart
*  Purpose     :	 Model fro user authentication
*  Created     :   2019-07-09 12:46 by Detective Conan
*  Updated     :   2019-07-09 12:46 by Detective Conan 
*  Changes     :
*/

import 'package:json_annotation/json_annotation.dart';

part 'user_authentication.g.dart';

@JsonSerializable()
class UserAuthentication {
  UserAuthentication(this.id, this.username, this.firstName, this.middleName,
      this.email, this.roleId, this.roleName, this.mediaId, this.mediaPath);

  final String id;
  final String username;
  @JsonKey(name: "first_name")
  final firstName;
  @JsonKey(name: "middle_name")
  final middleName;
  final email;
  @JsonKey(name: "role_id")
  final String roleId;
  @JsonKey(name: "role_name")
  final roleName;
  @JsonKey(name: "media_id")
  final mediaId;
  @JsonKey(name: "media_path")
  final mediaPath;

  factory UserAuthentication.fromJson(Map<String, dynamic> json) =>
      _$UserAuthenticationFromJson(json);

  Map<String, dynamic> toJson() => _$UserAuthenticationToJson(this);
}
