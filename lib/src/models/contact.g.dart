// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return Contact(
      json['id'] as String,
      json['branch_id'] as String,
      json['name'] as String,
      json['address1'] as String,
      json['address2'] as String,
      json['city'] as String,
      json['province'] as String,
      json['country'] as String,
      json['mobile'] as String,
      json['email'] as String,
      json['social_media'] as String,
      json['landline'] as String,
      json['description'] as String,
      json['posted_on'] as String,
      json['updated_on'] as String,
      json['author'] as String);
}

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'name': instance.name,
      'address1': instance.address1,
      'address2': instance.address2,
      'city': instance.city,
      'province': instance.province,
      'country': instance.country,
      'landline': instance.landLine,
      'mobile': instance.mobile,
      'email': instance.email,
      'social_media': instance.socialMedia,
      'description': instance.description,
      'posted_on': instance.postedOn,
      'updated_on': instance.updatedOn,
      'author': instance.author
    };
