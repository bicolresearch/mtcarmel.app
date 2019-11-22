/*
*   Filename    :   community_baptism_event.dart
*   Purpose     :
*   Created     :   22/11/2019 9:28 AM by Detective Conan
*   Updated     :   22/11/2019 9:28 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CommunityBaptismEvent extends Equatable {
  CommunityBaptismEvent([List props = const []]) : super(props);
}

class FetchCommunityBaptism extends CommunityBaptismEvent {

  @override
  String toString() => 'FetchCommunityBaptism';
}

class RefreshCommunityBaptism extends CommunityBaptismEvent {

  @override
  String toString() => 'RefreshCommunityBaptism';
}

//TODO: Add events
