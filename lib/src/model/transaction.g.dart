// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction(
      json['id'] as int,
      json['name'] as String,
      (json['amount'] as num)?.toDouble(),
      json['hour'] as String,
      json['module'] as String,
      json['photo'] as String);
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
      'hour': instance.hour,
      'module': instance.module,
      'photo': instance.photo
    };
