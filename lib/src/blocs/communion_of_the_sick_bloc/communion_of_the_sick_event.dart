/*
*   Filename    :   communion_of_the_sick_event.dart
*   Purpose     :
*   Created     :   22/11/2019 9:57 AM by Detective Conan
*   Updated     :   22/11/2019 9:57 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CommunionOfTheSickEvent extends Equatable {
  CommunionOfTheSickEvent([List props = const []]) : super(props);
}

class FetchCommunionOfTheSick extends CommunionOfTheSickEvent {

  @override
  String toString() => 'FetchCommunionOfTheSick';
}

class RefreshCommunionOfTheSick extends CommunionOfTheSickEvent {

  @override
  String toString() => 'RefreshCommunionOfTheSick';
}

//TODO: Add events
