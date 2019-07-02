// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Donations _$DonationsFromJson(Map<String, dynamic> json) {
  return Donations(
      json['total'] == null
          ? null
          : TotalDonations.fromJson(json['total'] as Map<String, dynamic>),
      (json['donations_list'] as List)
          ?.map((e) =>
              e == null ? null : Donation.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DonationsToJson(Donations instance) => <String, dynamic>{
      'total': instance.total,
      'donations_list': instance.donationsList
    };

TotalDonations _$TotalDonationsFromJson(Map<String, dynamic> json) {
  return TotalDonations(json['total_donations'] as String);
}

Map<String, dynamic> _$TotalDonationsToJson(TotalDonations instance) =>
    <String, dynamic>{'total_donations': instance.totalDonations};

Donation _$DonationFromJson(Map<String, dynamic> json) {
  return Donation(
      json['id'] as String,
      json['branch_id'] as String,
      json['first_name'] as String,
      json['last_name'] as String,
      json['amount'] as String,
      json['posted_on'] as String,
      json['donation_type'] as String,
      json['profile_photo'] as String);
}

Map<String, dynamic> _$DonationToJson(Donation instance) => <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'amount': instance.amount,
      'posted_on': instance.postedOn,
      'donation_type': instance.donationType,
      'profile_photo': instance.profilePhoto
    };
