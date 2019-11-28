/*
*   Filename    :   funeral_chapel_event.dart
*   Purpose     :
*   Created     :   28/11/2019 10:21 AM by Detective Conan
*   Updated     :   28/11/2019 10:21 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class FuneralChapelEvent extends Equatable {
  FuneralChapelEvent([List props = const []]) : super(props);
}

class FetchFuneralChapel extends FuneralChapelEvent {

  @override
  String toString() => 'FetchFuneralChapel';
}

class RefreshFuneralChapel extends FuneralChapelEvent {

  @override
  String toString() => 'RefreshFuneralChapel';
}

//TODO: Add events
