/*
*   Filename    :   fmh_hall_event.dart
*   Purpose     :
*   Created     :   28/11/2019 10:37 AM by Detective Conan
*   Updated     :   28/11/2019 10:37 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class FmhHallEvent extends Equatable {
  FmhHallEvent([List props = const []]) : super(props);
}

class FetchFmhHall extends FmhHallEvent {

  @override
  String toString() => 'FetchFmhHall';
}

class RefreshFmhHall extends FmhHallEvent {

  @override
  String toString() => 'RefreshFmhHall';
}

//TODO: Add events
