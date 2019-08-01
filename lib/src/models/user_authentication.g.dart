// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_authentication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAuthentication _$UserAuthenticationFromJson(Map<String, dynamic> json) {
  return UserAuthentication(
    json['id'] as String,
    json['role_id'] as String,
    json['username'] as String,
    json['password'] as String,
  );
}

Map<String, dynamic> _$UserAuthenticationToJson(UserAuthentication instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role_id': instance.roleId,
      'username': instance.username,
      'password': instance.password,
    };
