// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'priest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Priest _$PriestFromJson(Map<String, dynamic> json) {
  return Priest(
      json['id'] as String,
      json['branch_id'] as String,
      json['name'] as String,
      json['position'] as String,
      json['rank'] as String,
      json['cover_photo'] as String,
      json['posted_on'] as String,
      json['updated_on'] as String);
}

Map<String, dynamic> _$PriestToJson(Priest instance) => <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'name': instance.name,
      'position': instance.position,
      'rank': instance.rank,
      'posted_on': instance.postedOn,
      'updated_on': instance.updatedOn,
      'cover_photo': instance.coverPhoto
    };
