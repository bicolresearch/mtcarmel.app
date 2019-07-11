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
  PostData(this.id, this.branchId, this.title, this.content, this.coverPhoto,
      this.postedOn, this.author, this.updatedOn);

  final String id;
  final String title;
  final String content;

  @JsonKey(name: 'posted_on')
  final String postedOn;

  @JsonKey(name: 'branch_id')
  final String branchId;

  @JsonKey(name: 'updated_on')
  final String updatedOn;

  @JsonKey(name: 'cover_photo')
  final String coverPhoto;

  final String author;

  factory PostData.fromJson(Map<String, dynamic> json) =>
      _$PostDataFromJson(json);

  Map<String, dynamic> toJson() => _$PostDataToJson(this);
}

