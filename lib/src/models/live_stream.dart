/*
*   Filename    :   live_stream.dart
*   Purpose     :
*   Created     :   10/09/2019 4:33 PM by Detective Conan
*   Updated     :   10/09/2019 4:33 PM by Detective Conan
*   Changes     :   
*/

import 'package:json_annotation/json_annotation.dart';

part 'live_stream.g.dart';

@JsonSerializable()
class LiveStream {
  LiveStream(this.draw, this.recordsTotal, this.recordsFiltered, this.data);

  final draw;
  final recordsTotal;
  final recordsFiltered;
  final List<LiveStreamData> data;

  factory LiveStream.fromJson(Map<String, dynamic> json) =>
      _$LiveStreamFromJson(json);

  Map<String, dynamic> toJson() => _$LiveStreamToJson(this);
}

@JsonSerializable()
class LiveStreamData {
  LiveStreamData(this.id, this.title, this.description, this.videoId,
      this.dtCreated, this.dtUpdated, this.createdBy, this.updatedBy);

  final id;
  final title;
  final description;
  @JsonKey(name: "video_id")
  final videoId;
  @JsonKey(name: "dt_created")
  final dtCreated;
  @JsonKey(name: "dt_updated")
  final dtUpdated;
  @JsonKey(name: "created_by")
  final createdBy;
  @JsonKey(name: "updated_by")
  final updatedBy;

  factory LiveStreamData.fromJson(Map<String, dynamic> json) =>
      _$LiveStreamDataFromJson(json);

  Map<String, dynamic> toJson() => _$LiveStreamDataToJson(this);
}
