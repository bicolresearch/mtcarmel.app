/*
*   Filename    :   fmh_hall_state.dart
*   Purpose     :
*   Created     :   28/11/2019 10:37 AM by Detective Conan
*   Updated     :   28/11/2019 10:37 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class FmhHallState extends Equatable {
  FmhHallState([List props = const []]) : super(props);
}

class FmhHallUninitialized extends FmhHallState {

  @override
  String toString() => 'FmhHallUninitialized';
}

class FmhHallLoading extends FmhHallState {

  @override
  String toString() => 'FmhHallLoading';
}

class FmhHallLoaded extends FmhHallState {

  @override
  String toString() => 'FmhHallLoaded';
}

class FmhHallError extends FmhHallState {

  final exception;

  FmhHallError(this.exception) : super([exception]);

  @override
  String toString() => 'FmhHallError';
}

class NoFmhHallLoaded extends FmhHallState {

  @override
  String toString() => 'No FmhHall Loaded';
}

class FmhHallNoConnection extends FmhHallState {

  @override
  String toString() => 'No Connection';
}

//TODO: Add states
