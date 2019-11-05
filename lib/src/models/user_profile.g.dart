// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return UserProfile(
    json['id'],
    json['username'],
    json['first_name'],
    json['middle_name'],
    json['last_name'],
    json['email'],
    json['address_1'],
    json['address_2'],
    json['city'],
    json['province'],
    json['country'],
    json['mobile'],
    json['landline'],
    json['role_id'],
    json['role_name'],
    json['media_id'],
    json['media_path'],
  );
}

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'first_name': instance.firstName,
      'middle_name': instance.middleName,
      'last_name': instance.lastName,
      'email': instance.email,
      'address_1': instance.address1,
      'address_2': instance.address2,
      'city': instance.city,
      'province': instance.province,
      'country': instance.country,
      'mobile': instance.mobile,
      'landline': instance.landline,
      'role_id': instance.roleId,
      'role_name': instance.roleName,
      'media_id': instance.mediaId,
      'media_path': instance.mediaPath,
    };
