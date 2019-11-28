/*
*   Filename    :   liturgical_state.dart
*   Purpose     :
*   Created     :   22/11/2019 8:59 AM by Detective Conan
*	 Updated			:   28/11/2019 9:43 AM PM by Detective Conan
*	 Changes			:   Added no connection state
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LiturgicalState extends Equatable {
  LiturgicalState([List props = const []]) : super(props);
}

class LiturgicalUninitialized extends LiturgicalState {

  @override
  String toString() => 'LiturgicalUninitialized';
}

class LiturgicalLoading extends LiturgicalState {

  @override
  String toString() => 'LiturgicalLoading';
}

class LiturgicalLoaded extends LiturgicalState {

  @override
  String toString() => 'LiturgicalLoaded';
}

class LiturgicalError extends LiturgicalState {

  final exception;

  LiturgicalError(this.exception) : super([exception]);

  @override
  String toString() => 'LiturgicalError';
}

class NoLiturgicalLoaded extends LiturgicalState {

  @override
  String toString() => 'No Liturgical Loaded';
}

class LiturgicalNoConnection extends LiturgicalState {

  @override
  String toString() => 'No Connection';
}

//TODO: Add states
