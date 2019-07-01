import 'package:json_annotation/json_annotation.dart';

part 'feed.g.dart';

@JsonSerializable()
class Feed{


  Feed(this.id,
    this.branchId, 
    this.title, 
    this.content, 
    this.coverPhoto);

  final String id;
  final String title;
  final String content;

  @JsonKey(name: 'branch_id')
  final String branchId;

  @JsonKey(name: 'cover_photo')
  final String coverPhoto;

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);

  Map<String, dynamic> toJson() => _$FeedToJson(this);

}