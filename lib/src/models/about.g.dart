// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

About _$AboutFromJson(Map<String, dynamic> json) {
  return About(
    json['id'] as String,
    json['branch_id'] as String,
    json['titular'] as String,
    json['diocese'] as String,
    json['date_of_establishment'] as String,
    json['feast_day'] as String,
    json['content'] as String,
    json['posted_on'] as String,
    json['updated_on'] as String,
    json['author'] as String,
  );
}

Map<String, dynamic> _$AboutToJson(About instance) => <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'titular': instance.titular,
      'diocese': instance.diocese,
      'date_of_establishment': instance.dateOfEstablishment,
      'feast_day': instance.feastDay,
      'content': instance.content,
      'posted_on': instance.postedOn,
      'updated_on': instance.updatedOn,
      'author': instance.author,
    };

DataAbout _$DataAboutFromJson(Map<String, dynamic> json) {
  return DataAbout(
    json['draw'] as int,
    json['recordsTotal'] as int,
    json['recordsFiltered'] as int,
    (json['data'] as List)
        ?.map(
            (e) => e == null ? null : About.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataAboutToJson(DataAbout instance) => <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data,
    };
