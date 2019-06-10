import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction{


  Transaction(this.id,this.name, this.amount, this.hour, this.module, this.photo);

  final int id;
  final String name;
  final double amount;
  final String hour;
  final String module;
  final String photo;

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

}
