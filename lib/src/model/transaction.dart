import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction{


  Transaction(this.id, this.branchId, this.firstName, this.lastName, this.amount, this.postedOn, this.donationType, this.coverPhoto);

  final String id;  
  @JsonKey(name: "branch_id")
  final String branchId;
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastName;
  final String amount;
  @JsonKey(name: "posted_on")
  final String postedOn;
  @JsonKey(name: "donation_type")
  final String donationType;
  @JsonKey(name: "cover_photo")
  final String coverPhoto;

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

}
