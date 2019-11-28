/*
*   Filename    :   funeral_chapel_state.dart
*   Purpose     :
*   Created     :   28/11/2019 10:22 AM by Detective Conan
*   Updated     :   28/11/2019 10:22 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class FuneralChapelState extends Equatable {
  FuneralChapelState([List props = const []]) : super(props);
}

class FuneralChapelUninitialized extends FuneralChapelState {

  @override
  String toString() => 'FuneralChapelUninitialized';
}

class FuneralChapelLoading extends FuneralChapelState {

  @override
  String toString() => 'FuneralChapelLoading';
}

class FuneralChapelLoaded extends FuneralChapelState {

  @override
  String toString() => 'FuneralChapelLoaded';
}

class FuneralChapelError extends FuneralChapelState {

  final exception;

  FuneralChapelError(this.exception) : super([exception]);

  @override
  String toString() => 'FuneralChapelError';
}

class NoFuneralChapelLoaded extends FuneralChapelState {

  @override
  String toString() => 'No FuneralChapel Loaded';
}

class FuneralChapelNoConnection extends FuneralChapelState {

  @override
  String toString() => 'No Connection';
}

//TODO: Add states
