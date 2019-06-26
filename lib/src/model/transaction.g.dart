// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction(
      json['id'] as String,
      json['branch_id'] as String,
      json['first_name'] as String,
      json['last_name'] as String,
      json['amount'] as String,
      json['posted_on'] as String,
      json['donation_type'] as String,
      json['cover_photo'] as String);
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'amount': instance.amount,
      'posted_on': instance.postedOn,
      'donation_type': instance.donationType,
      'cover_photo': instance.coverPhoto
    };
