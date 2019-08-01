// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ad _$AdFromJson(Map<String, dynamic> json) {
  return Ad(
    json['id'] as String,
    json['branch_id'] as String,
    json['name'] as String,
    json['cover_photo'] as String,
  );
}

Map<String, dynamic> _$AdToJson(Ad instance) => <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'name': instance.name,
      'cover_photo': instance.coverPhoto,
    };
