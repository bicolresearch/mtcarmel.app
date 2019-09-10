/*
*   Filename    :   live_stream_state.dart
*   Purpose     :
*   Created     :   10/09/2019 3:46 PM by Detective Conan
*   Updated     :   10/09/2019 3:46 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/live_stream.dart';

@immutable
abstract class LiveStreamState extends Equatable {
  LiveStreamState([List props = const []]) : super(props);
}

class LiveStreamUninitialized extends LiveStreamState {

  @override
  String toString() => 'LiveStreamUninitialized';
}

class LiveStreamLoading extends LiveStreamState {

  @override
  String toString() => 'LiveStreamLoading';
}

class LiveStreamLoaded extends LiveStreamState {
  final liveStream;

  LiveStreamLoaded(this.liveStream):super([liveStream]);


  @override
  String toString() => 'LiveStreamLoaded';
}

class LiveStreamError extends LiveStreamState {
  final exception;
  LiveStreamError(this.exception):super([exception]);


  @override
  String toString() => 'LiveStreamError';
}

