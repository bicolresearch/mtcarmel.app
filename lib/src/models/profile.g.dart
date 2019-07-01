// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
      json['id'] as int,
      json['firstName'] as String,
      json['lastName'] as String,
      json['birthday'] as String,
      json['photo'] as String);
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'birthday': instance.birthday,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'photo': instance.photo,
      'id': instance.id
    };
