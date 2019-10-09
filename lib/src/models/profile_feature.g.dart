// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_feature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileFeatureData _$ProfileFeatureDataFromJson(Map<String, dynamic> json) {
  return ProfileFeatureData(
    json['draw'],
    json['recordsTotal'],
    json['recordsFiltered'],
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : ProfileFeature.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProfileFeatureDataToJson(ProfileFeatureData instance) =>
    <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data,
    };

ProfileFeature _$ProfileFeatureFromJson(Map<String, dynamic> json) {
  return ProfileFeature(
    json['id'],
    json['branch_id'],
    json['name'],
    json['description'],
    json['cover_photo'],
    json['sub_modules_ids'],
  );
}

Map<String, dynamic> _$ProfileFeatureToJson(ProfileFeature instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'name': instance.name,
      'description': instance.description,
      'cover_photo': instance.coverPhoto,
      'sub_modules_ids': instance.subModulesIds,
    };
