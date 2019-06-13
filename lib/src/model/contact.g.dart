// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return Contact(
      json['id'] as int,
      json['name'] as String,
      json['address'] as String,
      json['email'] as String,
      json['social_media'] as String,
      json['landline'] as String,
      json['mobile'] as String);
}

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'email': instance.email,
      'social_media': instance.social_media,
      'landline': instance.landline,
      'mobile': instance.mobile
    };
