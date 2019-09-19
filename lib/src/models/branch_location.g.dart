// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchLocation _$BranchLocationFromJson(Map<String, dynamic> json) {
  return BranchLocation(
    json['id'],
    json['name'],
    json['description'],
    json['dt_created'],
    json['dt_updated'],
    json['created_by'],
    json['updated_by'],
  );
}

Map<String, dynamic> _$BranchLocationToJson(BranchLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'dt_created': instance.dtCreated,
      'dt_updated': instance.dtUpdated,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };

DataBranchLocation _$DataBranchLocationFromJson(Map<String, dynamic> json) {
  return DataBranchLocation(
    json['draw'],
    json['recordsTotal'],
    json['recordsFiltered'],
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : BranchLocation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataBranchLocationToJson(DataBranchLocation instance) =>
    <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data,
    };
