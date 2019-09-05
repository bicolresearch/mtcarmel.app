/*
*   Filename    :   news_feed_event.dart
*   Purpose     :
*   Created     :   04/09/2019 7:10 PM by Detective Conan
*   Updated     :   04/09/2019 7:10 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class NewsFeedEvent extends Equatable {
  NewsFeedEvent([List props = const []]) : super(props);
}

class FetchFeed extends NewsFeedEvent {

  @override
  String toString() => 'Fetch';
}

class RefreshFeed extends NewsFeedEvent {

  @override
  String toString() => 'RefreshFeed';
}
