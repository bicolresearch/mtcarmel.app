/*
*   Filename    :   adult_baptism_event.dart
*   Purpose     :
*   Created     :   22/11/2019 9:41 AM by Detective Conan
*   Updated     :   22/11/2019 9:41 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AdultBaptismEvent extends Equatable {
  AdultBaptismEvent([List props = const []]) : super(props);
}

class FetchAdultBaptism extends AdultBaptismEvent {

  @override
  String toString() => 'FetchAdultBaptism';
}

class RefreshAdultBaptism extends AdultBaptismEvent {

  @override
  String toString() => 'RefreshAdultBaptism';
}

//TODO: Add events
