import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact{
  Contact(this.id,
    this.name,
    this.address,
    this.email,
    this.social_media,
    this.landline,
    this.mobile);
  
  final int id;
  final String name;
  final String address;
  final String email;
  final String social_media;
  final String landline;
  final String mobile;

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

