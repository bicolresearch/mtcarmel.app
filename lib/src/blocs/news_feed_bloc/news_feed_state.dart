/*
*   Filename    :   news_feed_state.dart
*   Purpose     :
*   Created     :   04/09/2019 7:10 PM by Detective Conan
*   Updated     :   04/09/2019 7:10 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/feed.dart';

@immutable
abstract class NewsFeedState extends Equatable {
  NewsFeedState([List props = const []]) : super(props);
}


class FeedUninitialized extends NewsFeedState {

  @override
  String toString() => 'FeedUninitialized';
}

class FeedLoading extends  NewsFeedState{

  @override
  String toString() => 'FeedLoading';
}

class FeedLoaded extends NewsFeedState {
  final Feed feed;

  FeedLoaded(this.feed):super([feed]);

  @override
  String toString() => 'FeedLoaded';
}

class FeedNotChanged extends NewsFeedState {

  @override
  String toString() => 'FeedNotChanged';
}

class FeedErrorLoading extends NewsFeedState {

  @override
  String toString() => 'FeedErrorLoading';
}

class FeedRefreshing extends NewsFeedState {

  @override
  String toString() => 'FeedRefreshing';
}

class FeedRefreshError extends NewsFeedState {

  @override
  String toString() => 'FeedRefreshError';
}
