// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_authentication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAuthentication _$UserAuthenticationFromJson(Map<String, dynamic> json) {
  return UserAuthentication(
      json['id'] as String,
      json['branch_id'] as String,
      json['role_id'] as String,
      json['username'] as String,
      json['password'] as String,
      json['created_by'] as String,
      json['dt_created'] as String,
      json['updated_by'] as String,
      json['dt_updated'] as String,
      json['is_deleted'] as String);
}

Map<String, dynamic> _$UserAuthenticationToJson(UserAuthentication instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'role_id': instance.roleId,
      'username': instance.username,
      'password': instance.password,
      'created_by': instance.createdBy,
      'dt_created': instance.dtCreated,
      'updated_by': instance.updatedBy,
      'dt_updated': instance.dtUpdated,
      'is_deleted': instance.isDeleted
    };
