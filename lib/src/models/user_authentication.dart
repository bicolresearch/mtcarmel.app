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
  UserAuthentication(
      this.id,
//      this.branchId,
      this.roleId,
      this.username,
      this.password,
//      this.createdBy,
//      this.dtCreated,
//      this.updatedBy,
//      this.dtUpdated,
//      this.isDeleted
      );

  final String id;
//  @JsonKey(name: "branch_id")
//  final String branchId;
  @JsonKey(name: "role_id")
  final String roleId;
  final String username;
  final String password;
//  @JsonKey(name: "created_by")
//  final String createdBy;
//  @JsonKey(name: "dt_created")
//  final String dtCreated;
//  @JsonKey(name: "updated_by")
//  final String updatedBy;
//  @JsonKey(name: "dt_updated")
//  final String dtUpdated;
//  @JsonKey(name: "is_deleted")
//  final String isDeleted;

  factory UserAuthentication.fromJson(Map<String, dynamic> json) =>
      _$UserAuthenticationFromJson(json);

  Map<String, dynamic> toJson() => _$UserAuthenticationToJson(this);
}
