/*
*   Filename    :   marriage_state.dart
*   Purpose     :
*   Created     :   28/11/2019 8:34 AM by Detective Conan
*   Updated     :   28/11/2019 8:34 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MarriageState extends Equatable {
  MarriageState([List props = const []]) : super(props);
}

class MarriageUninitialized extends MarriageState {

  @override
  String toString() => 'MarriageUninitialized';
}

class MarriageLoading extends MarriageState {

  @override
  String toString() => 'MarriageLoading';
}

class MarriageLoaded extends MarriageState {

  @override
  String toString() => 'MarriageLoaded';
}

class MarriageError extends MarriageState {

  final exception;

  MarriageError(this.exception) : super([exception]);

  @override
  String toString() => 'MarriageError';
}

class NoMarriageLoaded extends MarriageState {

  @override
  String toString() => 'No Marriage Loaded';
}

class MarriageNoConnection extends MarriageState{

  @override
  String toString() => 'No Connection';
}
