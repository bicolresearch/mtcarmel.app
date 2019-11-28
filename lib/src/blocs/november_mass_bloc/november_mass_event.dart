/*
*   Filename    :   november_mass_event.dart
*   Purpose     :
*   Created     :   28/11/2019 10:30 AM by Detective Conan
*   Updated     :   28/11/2019 10:30 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class NovemberMassEvent extends Equatable {
  NovemberMassEvent([List props = const []]) : super(props);
}

class FetchNovemberMass extends NovemberMassEvent {

  @override
  String toString() => 'FetchNovemberMass';
}

class RefreshNovemberMass extends NovemberMassEvent {

  @override
  String toString() => 'RefreshNovemberMass';
}

//TODO: Add events
