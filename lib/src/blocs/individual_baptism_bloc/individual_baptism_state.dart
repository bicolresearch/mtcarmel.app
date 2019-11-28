/*
*   Filename    :   individual_baptism_state.dart
*   Purpose     :
*   Created     :   22/11/2019 9:17 AM by Detective Conan
*	 Updated			:   28/11/2019 9:43 AM PM by Detective Conan
*	 Changes			:   Added no connection state
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class IndividualBaptismState extends Equatable {
  IndividualBaptismState([List props = const []]) : super(props);
}

class IndividualBaptismUninitialized extends IndividualBaptismState {
  @override
  String toString() => 'IndividualBaptismUninitialized';
}

class IndividualBaptismLoading extends IndividualBaptismState {
  @override
  String toString() => 'IndividualBaptismLoading';
}

class IndividualBaptismLoaded extends IndividualBaptismState {
  @override
  String toString() => 'IndividualBaptismLoaded';
}

class IndividualBaptismError extends IndividualBaptismState {
  final exception;

  IndividualBaptismError(this.exception) : super([exception]);

  @override
  String toString() => 'IndividualBaptismError';
}

class NoIndividualBaptismLoaded extends IndividualBaptismState {
  @override
  String toString() => 'No IndividualBaptism Loaded';
}

class IndividualBaptismNoConnection extends IndividualBaptismState {
  @override
  String toString() => 'No Connection';
}

//TODO: Add states
