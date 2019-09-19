// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataBranch _$DataBranchFromJson(Map<String, dynamic> json) {
  return DataBranch(
    json['draw'] as int,
    json['recordsTotal'] as int,
    json['recordsFiltered'] as int,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Branch.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataBranchToJson(DataBranch instance) =>
    <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data,
    };

Branch _$BranchFromJson(Map<String, dynamic> json) {
  return Branch(
    json['id'],
    json['name'],
    json['description'],
    json['location_id'],
    json['location_name'],
    json['church_order_id'],
    json['church_order_name'],
    json['dt_created'],
    json['dt_updated'],
    json['created_by'],
    json['updated_by'],
  );
}

Map<String, dynamic> _$BranchToJson(Branch instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'location_id': instance.locationId,
      'location_name': instance.locationName,
      'church_order_id': instance.churchOrderId,
      'church_order_name': instance.churchOrderName,
      'dt_created': instance.dtCreated,
      'dt_updated': instance.dtUpdated,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
