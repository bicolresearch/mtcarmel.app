// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_help.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendHelp _$SendHelpFromJson(Map<String, dynamic> json) {
  return SendHelp(
    json['id'] as String,
    json['name'] as String,
    json['branch_id'] as String,
    json['description'] as String,
    json['schedule'] as String,
    json['cover_photo'] as String,
  );
}

Map<String, dynamic> _$SendHelpToJson(SendHelp instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'branch_id': instance.branchId,
      'description': instance.description,
      'schedule': instance.schedule,
      'cover_photo': instance.coverPhoto,
    };
