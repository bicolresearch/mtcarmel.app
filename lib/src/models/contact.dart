import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  Contact(
      this.id,
      this.branchId,
      this.name,
      this.address1,
      this.address2,
      this.city,
      this.province,
      this.country,
      this.mobile,
      this.email,
      this.socialMedia,
      this.landLine,
      this.description,
      this.postedOn,
      this.updatedOn);

  final String id;
  @JsonKey(name: "branch_id")
  final String branchId;
  final String name;
  final String address1;
  final String address2;
  final String city;
  final String province;
  final String country;
  @JsonKey(name: "landline")
  final String landLine;
  final String mobile;
  final String email;
  @JsonKey(name: "social_media")
  final String socialMedia;
  final String description;
  @JsonKey(name: "posted_on")
  final String postedOn;
  @JsonKey(name: "updated_on")
  final String updatedOn;

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
