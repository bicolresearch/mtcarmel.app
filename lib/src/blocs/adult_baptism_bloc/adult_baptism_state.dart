/*
*   Filename    :   adult_baptism_state.dart
*   Purpose     :
*   Created     :   22/11/2019 9:41 AM by Detective Conan
*   Updated     :   22/11/2019 9:41 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AdultBaptismState extends Equatable {
  AdultBaptismState([List props = const []]) : super(props);
}

class AdultBaptismUninitialized extends AdultBaptismState {

  @override
  String toString() => 'AdultBaptismUninitialized';
}

class AdultBaptismLoading extends AdultBaptismState {

  @override
  String toString() => 'AdultBaptismLoading';
}

class AdultBaptismLoaded extends AdultBaptismState {

  @override
  String toString() => 'AdultBaptismLoaded';
}

class AdultBaptismError extends AdultBaptismState {

  final exception;

  AdultBaptismError(this.exception) : super([exception]);

  @override
  String toString() => 'AdultBaptismError';
}

class NoAdultBaptismLoaded extends AdultBaptismState {

  @override
  String toString() => 'No AdultBaptism Loaded';
}

//TODO: Add states
