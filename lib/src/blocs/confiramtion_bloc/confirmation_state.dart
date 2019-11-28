/*
*   Filename    :   confirmation_state.dart
*   Purpose     :
*   Created     :   22/11/2019 10:04 AM by Detective Conan
*	 Updated			:   28/11/2019 9:44 AM PM by Detective Conan
*	 Changes			:   Added no connection state
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ConfirmationState extends Equatable {
  ConfirmationState([List props = const []]) : super(props);
}

class ConfirmationUninitialized extends ConfirmationState {
  @override
  String toString() => 'ConfirmationUninitialized';
}

class ConfirmationLoading extends ConfirmationState {
  @override
  String toString() => 'ConfirmationLoading';
}

class ConfirmationLoaded extends ConfirmationState {
  @override
  String toString() => 'ConfirmationLoaded';
}

class ConfirmationError extends ConfirmationState {
  final exception;

  ConfirmationError(this.exception) : super([exception]);

  @override
  String toString() => 'ConfirmationError';
}

class NoConfirmationLoaded extends ConfirmationState {
  @override
  String toString() => 'No Confirmation Loaded';
}

class ConfirmationNoConnection extends ConfirmationState {
  @override
  String toString() => 'No Connection';
}

//TODO: Add states
