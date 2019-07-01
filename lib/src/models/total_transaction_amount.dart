import 'package:json_annotation/json_annotation.dart';

part 'total_transaction_amount.g.dart';

@JsonSerializable()
class TotalTransactionAmount{


  TotalTransactionAmount(this.id,this.title, this.content, this.total);

  final int id;
  final String title;
  final String content;
  final double total;

  factory TotalTransactionAmount.fromJson(Map<String, dynamic> json) => _$TotalTransactionAmountFromJson(json);

  Map<String, dynamic> toJson() => _$TotalTransactionAmountToJson(this);

}

