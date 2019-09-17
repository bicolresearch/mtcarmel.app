/*
*   Filename    :   priests_event.dart
*   Purpose     :
*   Created     :   17/09/2019 3:00 PM by Detective Conan
*   Updated     :   17/09/2019 3:00 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PriestsEvent extends Equatable {
  PriestsEvent([List props = const []]) : super(props);
}

class FetchPriests extends PriestsEvent {

  @override
  String toString() => 'FetchPriests';
}

class RefreshPriests extends PriestsEvent {

  @override
  String toString() => 'RefreshPriests';
}

//TODO: Add events
