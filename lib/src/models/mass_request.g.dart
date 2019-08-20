// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mass_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MassRequest _$MassRequestFromJson(Map<String, dynamic> json) {
  return MassRequest(
    json['id'] as String,
    json['prayer'] as String,
    json['status'] as String,
    json['posted_on'] as String,
    json['updated_on'] as String,
    json['author'] as String,
  );
}

Map<String, dynamic> _$MassRequestToJson(MassRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prayer': instance.prayer,
      'status': instance.status,
      'posted_on': instance.postedOn,
      'updated_on': instance.updatedOn,
      'author': instance.author,
    };
