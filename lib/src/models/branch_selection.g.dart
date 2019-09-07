// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_selection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchId _$BranchSelectionFromJson(Map<String, dynamic> json) {
  return BranchId(
    json['id'],
    json['branch_id'],
    json['branch_name'],
  );
}

Map<String, dynamic> _$BranchSelectionToJson(BranchId instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'branch_name': instance.branchName,
    };
