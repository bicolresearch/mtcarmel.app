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
    id: json['id'],
    name: json['name'],
    description: json['description'],
    churchOrderId: json['church_order_id'],
    churchOrderName: json['church_order_name'],
    dtCreated: json['dt_created'],
    dtUpdated: json['dt_updated'],
    createdBy: json['created_by'],
    updatedBy: json['updated_by'],
  );
}

Map<String, dynamic> _$BranchToJson(Branch instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'church_order_id': instance.churchOrderId,
      'church_order_name': instance.churchOrderName,
      'dt_created': instance.dtCreated,
      'dt_updated': instance.dtUpdated,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
