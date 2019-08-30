// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Donations _$DonationsFromJson(Map<String, dynamic> json) {
  return Donations(
    json['total_donations'] == null
        ? null
        : TotalDonations.fromJson(
            json['total_donations'] as Map<String, dynamic>),
    (json['donations_list'] as List)
        ?.map((e) =>
            e == null ? null : Donation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DonationsToJson(Donations instance) => <String, dynamic>{
      'total_donations': instance.totalDonations,
      'donations_list': instance.donationsList,
    };

TotalDonations _$TotalDonationsFromJson(Map<String, dynamic> json) {
  return TotalDonations(
    json['amount'] as String,
  );
}

Map<String, dynamic> _$TotalDonationsToJson(TotalDonations instance) =>
    <String, dynamic>{
      'amount': instance.amount,
    };

Donation _$DonationFromJson(Map<String, dynamic> json) {
  return Donation(
    json['id'],
    json['branch_id'] as String,
    json['amount'],
    json['donation_type'] as String,
    json['first_name'] as String,
    json['last_name'] as String,
    json['media_path'] as String,
    json['dt_created'] as String,
    json['dt_updated'] as String,
    json['created_by'] as String,
    json['updated_by'] as String,
  );
}

Map<String, dynamic> _$DonationToJson(Donation instance) => <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'amount': instance.amount,
      'donation_type': instance.donationType,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'media_path': instance.mediaPath,
      'dt_created': instance.dtCreated,
      'dt_updated': instance.dtUpdated,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
