// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pastor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pastor _$PastorFromJson(Map<String, dynamic> json) {
  return Pastor(
      json['id'] as String,
      json['branch_id'] as String,
      json['name'] as String,
      json['position'] as String,
      json['rank'] as String);
}

Map<String, dynamic> _$PastorToJson(Pastor instance) => <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'name': instance.name,
      'position': instance.position,
      'rank': instance.rank
    };
