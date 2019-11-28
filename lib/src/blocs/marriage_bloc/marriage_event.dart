/*
*   Filename    :   marriage_event.dart
*   Purpose     :
*   Created     :   28/11/2019 8:34 AM by Detective Conan
*   Updated     :   28/11/2019 8:34 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MarriageEvent extends Equatable {
  MarriageEvent([List props = const []]) : super(props);
}

class FetchMarriage extends MarriageEvent {

  @override
  String toString() => 'FetchMarriage';
}

class RefreshMarriage extends MarriageEvent {

  @override
  String toString() => 'RefreshMarriage';
}

//TODO: Add events
