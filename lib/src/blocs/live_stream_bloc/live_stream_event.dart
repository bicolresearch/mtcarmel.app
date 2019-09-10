/*
*   Filename    :   live_stream_event.dart
*   Purpose     :
*   Created     :   10/09/2019 3:46 PM by Detective Conan
*   Updated     :   10/09/2019 3:46 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LiveStreamEvent extends Equatable {
  LiveStreamEvent([List props = const []]) : super(props);
}

class FetchLiveStream extends LiveStreamEvent {

  @override
  String toString() => 'FetchLiveStream';
}

class RefreshLiveStream extends LiveStreamEvent {

  @override
  String toString() => 'RefreshLiveStream';
}
