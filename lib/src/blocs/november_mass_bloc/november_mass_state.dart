/*
*   Filename    :   november_mass_state.dart
*   Purpose     :
*   Created     :   28/11/2019 10:30 AM by Detective Conan
*   Updated     :   28/11/2019 10:30 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class NovemberMassState extends Equatable {
  NovemberMassState([List props = const []]) : super(props);
}

class NovemberMassUninitialized extends NovemberMassState {

  @override
  String toString() => 'NovemberMassUninitialized';
}

class NovemberMassLoading extends NovemberMassState {

  @override
  String toString() => 'NovemberMassLoading';
}

class NovemberMassLoaded extends NovemberMassState {

  @override
  String toString() => 'NovemberMassLoaded';
}

class NovemberMassError extends NovemberMassState {

  final exception;

  NovemberMassError(this.exception) : super([exception]);

  @override
  String toString() => 'NovemberMassError';
}

class NoNovemberMassLoaded extends NovemberMassState {

  @override
  String toString() => 'No NovemberMass Loaded';
}

class NovemberMassNoConnection extends NovemberMassState {

  @override
  String toString() => 'No Connection';
}

//TODO: Add states
