import 'package:json_annotation/json_annotation.dart';

part 'feed.g.dart';

@JsonSerializable()
class Feed{


  Feed(this.id,this.title, this.content, this.cover_photo);

  final int id;
  final String title;
  final String content;
  final String cover_photo;

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);

  Map<String, dynamic> toJson() => _$FeedToJson(this);

}

