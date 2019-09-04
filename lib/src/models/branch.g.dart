// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Branch _$BranchFromJson(Map<String, dynamic> json) {
  return Branch(
    json['id'],
    json['branch_id'],
    json['news_feed'],
    json['send_help'],
    json['services'],
    json['transparency'],
    json['profile'],
  );
}

Map<String, dynamic> _$BranchToJson(Branch instance) => <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'news_feed': instance.newsFeed,
      'send_help': instance.sendHelp,
      'services': instance.services,
      'transparency': instance.transparency,
      'profile': instance.profile,
    };
