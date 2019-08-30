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
class Donations {
  Donations(this.totalDonations, this.donationsList);

  @JsonKey(name: "total_donations")
  final TotalDonations totalDonations;
  @JsonKey(name: "donations_list")
  final List<Donation> donationsList;

  factory Donations.fromJson(Map<String, dynamic> json) =>
      _$DonationsFromJson(json);

  Map<String, dynamic> toJson() => _$DonationsToJson(this);
}

@JsonSerializable()
class TotalDonations {
  TotalDonations(
    this.amount,
  );

  final String amount;

  factory TotalDonations.fromJson(Map<String, dynamic> json) =>
      _$TotalDonationsFromJson(json);

  Map<String, dynamic> toJson() => _$TotalDonationsToJson(this);
}

@JsonSerializable()
class Donation {
  Donation(
      this.id,
      this.branchId,
      this.amount,
      this.donationType,
      this.firstName,
      this.lastName,
      this.mediaPath,
      this.dtCreated,
      this.dtUpdated,
      this.createdBy,
      this.updatedBy);

  final id;
  @JsonKey(name: "branch_id")
  final String branchId;
  final amount;
  @JsonKey(name: "donation_type")
  final String donationType;
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastName;
  @JsonKey(name: "media_path")
  final String mediaPath;
  @JsonKey(name: "dt_created")
  final String dtCreated;
  @JsonKey(name: "dt_updated")
  final String dtUpdated;
  @JsonKey(name: "created_by")
  final String createdBy;
  @JsonKey(name: "updated_by")
  final String updatedBy;

  factory Donation.fromJson(Map<String, dynamic> json) =>
      _$DonationFromJson(json);

  Map<String, dynamic> toJson() => _$DonationToJson(this);
}
