import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact{
  Contact(this.id,
    this.branchId,
    this.name,
    this.address1,
    this.address2,
    this.city,
    this.province,
    this.country,
    this.landline,
    this.mobile,
    this.email,
    this.socialMedia);
  
  final String id;
  @JsonKey(name: "branch_id")
  final String branchId;
  final String name;
  final String address1;
  final String address2;
  final String city;
  final String province;
  final String country;
  final String landline;
  final String mobile;
  final String email;
  @JsonKey(name: "social_media")
  final String socialMedia;
  

  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}

        // "id": 1,
        // "name": "Minor Basilica of the National Shrine of Our Ladyof Mount Carmel",
        // "address": "J.Rodriguez Ave. cor 5th St., New Manila, Quezon City 1112 Philippines",
        // "email": "basilica@mountcarmel.ph",
        // "social_media": "@mountcarmel.ph",
        // "landline": "(632) 7245938, (632) 7015867, (632) 7015868, (632) 7015869",
        // "mobile": "0918-4077760 and 0956-6583660"

