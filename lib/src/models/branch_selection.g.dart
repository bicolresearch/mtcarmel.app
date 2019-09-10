// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_selection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchId _$BranchIdFromJson(Map<String, dynamic> json) {
  return BranchId(
    json['id'],
    json['branch_id'],
    json['branch_name'],
  );
}

Map<String, dynamic> _$BranchIdToJson(BranchId instance) => <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'branch_name': instance.branchName,
    };
