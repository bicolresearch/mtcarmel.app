// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_authentication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAuthentication _$UserAuthenticationFromJson(Map<String, dynamic> json) {
  return UserAuthentication(
    json['id'] as String,
    json['username'] as String,
    json['first_name'],
    json['middle_name'],
    json['email'],
    json['role_id'] as String,
    json['role_name'],
    json['media_id'],
    json['media_path'],
  );
}

Map<String, dynamic> _$UserAuthenticationToJson(UserAuthentication instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'first_name': instance.firstName,
      'middle_name': instance.middleName,
      'email': instance.email,
      'role_id': instance.roleId,
      'role_name': instance.roleName,
      'media_id': instance.mediaId,
      'media_path': instance.mediaPath,
    };
