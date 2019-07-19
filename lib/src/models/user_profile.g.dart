// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return UserProfile(
      json['id'] as String,
      json['branch_id'] as String,
      json['role_id'] as String,
      json['role_name'] as String,
      json['username'] as String,
      json['first_name'] as String,
      json['middle_name'] as String,
      json['last_name'] as String,
      json['email'] as String,
      json['address_1'] as String,
      json['address_2'] as String,
      json['city'] as String,
      json['province'] as String,
      json['country'] as String,
      json['mobile'] as String,
      json['landline'] as String,
      json['avatar'] as String);
}

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'role_id': instance.roleId,
      'role_name': instance.roleName,
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
      'landline': instance.landLine,
      'avatar': instance.avatar
    };
