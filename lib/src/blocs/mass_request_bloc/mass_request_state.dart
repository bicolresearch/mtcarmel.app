/*
*   Filename    :   mass_request_state.dart
*   Purpose     :
*   Created     :   21/11/2019 10:02 AM by Detective Conan
*	 Updated			:   28/11/2019 9:43 AM PM by Detective Conan
*	 Changes			:   Added no connection state
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MassRequestState extends Equatable {
  MassRequestState([List props = const []]) : super(props);
}

class MassRequestUninitialized extends MassRequestState {

  @override
  String toString() => 'MassRequestUninitialized';
}

class MassRequestLoading extends MassRequestState {

  @override
  String toString() => 'MassRequestLoading';
}

class MassRequestLoaded extends MassRequestState {

  @override
  String toString() => 'MassRequestLoaded';
}

class MassRequestError extends MassRequestState {

  final exception;

  MassRequestError(this.exception) : super([exception]);

  @override
  String toString() => 'MassRequestError';
}

class NoMassRequestLoaded extends MassRequestState {

  @override
  String toString() => 'No MassRequest Loaded';
}

class MassRequestNoConnection extends MassRequestState {

  @override
  String toString() => 'No Connection';
}

//TODO: Add states
