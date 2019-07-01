// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_transaction_amount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotalTransactionAmount _$TotalTransactionAmountFromJson(
    Map<String, dynamic> json) {
  return TotalTransactionAmount(json['id'] as int, json['title'] as String,
      json['content'] as String, (json['total'] as num)?.toDouble());
}

Map<String, dynamic> _$TotalTransactionAmountToJson(
        TotalTransactionAmount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'total': instance.total
    };
