/*
*   Filename    :   transparency_state.dart
*   Purpose     :
*   Created     :   12/09/2019 3:54 PM by Detective Conan
*   Updated     :   12/09/2019 3:54 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class TransparencyState extends Equatable {
  TransparencyState([List props = const []]) : super(props);
}

class TransparencyUninitialized extends TransparencyState {

  @override
  String toString() => 'TransparencyUninitialized';
}

class TransparencyLoading extends TransparencyState {

  @override
  String toString() => 'TransparencyLoading';
}

class TransparencyLoaded extends TransparencyState {

  @override
  String toString() => 'TransparencyLoaded';
}

class TransparencyError extends TransparencyState {

  final exception;

  TransparencyError(this.exception) : super([exception]);

  @override
  String toString() => 'TransparencyError';
}

//TODO: Add states
