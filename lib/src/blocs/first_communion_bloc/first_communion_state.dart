/*
*   Filename    :   first_communion_state.dart
*   Purpose     :
*   Created     :   22/11/2019 9:53 AM by Detective Conan
*   Updated     :   22/11/2019 9:53 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class FirstCommunionState extends Equatable {
  FirstCommunionState([List props = const []]) : super(props);
}

class FirstCommunionUninitialized extends FirstCommunionState {

  @override
  String toString() => 'FirstCommunionUninitialized';
}

class FirstCommunionLoading extends FirstCommunionState {

  @override
  String toString() => 'FirstCommunionLoading';
}

class FirstCommunionLoaded extends FirstCommunionState {

  @override
  String toString() => 'FirstCommunionLoaded';
}

class FirstCommunionError extends FirstCommunionState {

  final exception;

  FirstCommunionError(this.exception) : super([exception]);

  @override
  String toString() => 'FirstCommunionError';
}

class NoFirstCommunionLoaded extends FirstCommunionState {

  @override
  String toString() => 'No FirstCommunion Loaded';
}

//TODO: Add states
