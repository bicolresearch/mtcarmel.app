/*
*  Filename    :   donations.dart.dart
*  Purpose     :	 Model for total donations and list of 30 recent donations
*  Created     :   2019-07-01 17:20 by Detective Conan
*  Updated     :   2019-07-01 17:20 by Detective Conan 
*  Changes     :
*/

import 'package:json_annotation/json_annotation.dart';

part 'donations.g.dart';

@JsonSerializable()
class Donations{
  Donations(this.total, this.donationsList);

  final TotalDonations total;
  @JsonKey(name: "donations_list")
  final List<Donation> donationsList;


  factory Donations.fromJson(Map<String, dynamic> json) => _$DonationsFromJson(json);

  Map<String, dynamic> toJson() => _$DonationsToJson(this);
}

@JsonSerializable()
class TotalDonations{
  TotalDonations(this.totalDonations,);

  @JsonKey(name: "total_donations")
  final String totalDonations;


  factory TotalDonations.fromJson(Map<String, dynamic> json) => _$TotalDonationsFromJson(json);

  Map<String, dynamic> toJson() => _$TotalDonationsToJson(this);
}

@JsonSerializable()
class Donation{
  Donation(
      this.id,
      this.branchId,
      this.firstName,
      this.lastName,
      this.amount,
      this.postedOn,
      this.donationType,
      this.profilePhoto,
      );

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
  @JsonKey(name: "profile_photo")
  final String profilePhoto;



  factory Donation.fromJson(Map<String, dynamic> json) => _$DonationFromJson(json);

  Map<String, dynamic> toJson() => _$DonationToJson(this);
}
