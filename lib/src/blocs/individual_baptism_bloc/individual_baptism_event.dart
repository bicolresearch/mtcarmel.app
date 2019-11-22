/*
*   Filename    :   individual_baptism_event.dart
*   Purpose     :
*   Created     :   22/11/2019 9:16 AM by Detective Conan
*   Updated     :   22/11/2019 9:16 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class IndividualBaptismEvent extends Equatable {
  IndividualBaptismEvent([List props = const []]) : super(props);
}

class FetchIndividualBaptism extends IndividualBaptismEvent {

  @override
  String toString() => 'FetchIndividualBaptism';
}

class RefreshIndividualBaptism extends IndividualBaptismEvent {

  @override
  String toString() => 'RefreshIndividualBaptism';
}

//TODO: Add events
