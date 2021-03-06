/*
*   Filename    :   communion_of_the_sick_state.dart
*   Purpose     :
*   Created     :   22/11/2019 9:57 AM by Detective Conan
*	 Updated			:   28/11/2019 9:44 AM PM by Detective Conan
*	 Changes			:   Added no connection state
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CommunionOfTheSickState extends Equatable {
  CommunionOfTheSickState([List props = const []]) : super(props);
}

class CommunionOfTheSickUninitialized extends CommunionOfTheSickState {
  @override
  String toString() => 'CommunionOfTheSickUninitialized';
}

class CommunionOfTheSickLoading extends CommunionOfTheSickState {
  @override
  String toString() => 'CommunionOfTheSickLoading';
}

class CommunionOfTheSickLoaded extends CommunionOfTheSickState {
  @override
  String toString() => 'CommunionOfTheSickLoaded';
}

class CommunionOfTheSickError extends CommunionOfTheSickState {
  final exception;

  CommunionOfTheSickError(this.exception) : super([exception]);

  @override
  String toString() => 'CommunionOfTheSickError';
}

class NoCommunionOfTheSickLoaded extends CommunionOfTheSickState {
  @override
  String toString() => 'No CommunionOfTheSick Loaded';
}

class CommunionOfTheSickNoConnection extends CommunionOfTheSickState {
  @override
  String toString() => 'No Connection';
}

//TODO: Add states
