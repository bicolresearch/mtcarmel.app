/*
*  Filename    :   prayer_request.dart
*  Purpose     :	
*  Created     :   2019-08-20 16:14 by Detective Conan
*  Updated     :   2019-08-20 16:14 by Detective Conan 
*  Changes     :
*/

import 'package:json_annotation/json_annotation.dart';

part 'prayer_request.g.dart';

@JsonSerializable()
class PrayerRequest {
  PrayerRequest(this.id, this.prayer, this.status, this.postedOn,
      this.updatedOn, this.author);

  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "prayer")
  final String prayer;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "posted_on")
  final String postedOn;
  @JsonKey(name: "updated_on")
  final String updatedOn;
  @JsonKey(name: "author")
  final String author;

  factory PrayerRequest.fromJson(Map<String, dynamic> json) =>
      _$PrayerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PrayerRequestToJson(this);
}
