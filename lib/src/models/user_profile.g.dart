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
    json['city_code'],
    json['city_name'],
    json['province_code'],
    json['province_name'],
    json['country_code'],
    json['country_name'],
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
      'city_code': instance.cityCode,
      'city_name': instance.cityName,
      'province_code': instance.provinceCode,
      'province_name': instance.provinceName,
      'country_code': instance.countryCode,
      'country_name': instance.countryName,
      'mobile': instance.mobile,
      'landline': instance.landline,
      'role_id': instance.roleId,
      'role_name': instance.roleName,
      'media_id': instance.mediaId,
      'media_path': instance.mediaPath,
    };
