import 'package:json_annotation/json_annotation.dart';

part 'feed.g.dart';

@JsonSerializable()
class Feed {
  Feed(this.draw, this.recordsTotal, this.recordsFiltered, this.data);

  final draw;
  final recordsTotal;
  final recordsFiltered;
  final List<PostData> data;

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);

  Map<String, dynamic> toJson() => _$FeedToJson(this);
}

@JsonSerializable()
class PostData {
  PostData(
      this.id,
      this.branchId,
      this.mediaId,
      this.title,
      this.content,
      this.dtCreated,
      this.dtUpdated,
      this.mediaPath,
      this.createdBy,
      this.updatedBy);

  final id;
  @JsonKey(name: "branch_id")
  final String branchId;
  @JsonKey(name: "media_id")
  final String mediaId;
  final title;
  final content;
  @JsonKey(name: "dt_created")
  final String dtCreated;
  @JsonKey(name: "dt_updated")
  final String dtUpdated;
  @JsonKey(name: "media_path")
  final String mediaPath;
  @JsonKey(name: "created_by")
  final String createdBy;
  @JsonKey(name: "updated_by")
  final String updatedBy;

  factory PostData.fromJson(Map<String, dynamic> json) =>
      _$PostDataFromJson(json);

  Map<String, dynamic> toJson() => _$PostDataToJson(this);
}
