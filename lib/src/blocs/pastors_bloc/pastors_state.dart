/*
*   Filename    :   pastors_state.dart
*   Purpose     :
*   Created     :   17/09/2019 4:51 PM by Detective Conan
*   Updated     :   17/09/2019 4:51 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PastorsState extends Equatable {
  PastorsState([List props = const []]) : super(props);
}

class PastorsUninitialized extends PastorsState {

  @override
  String toString() => 'PastorsUninitialized';
}

class PastorsLoading extends PastorsState {

  @override
  String toString() => 'PastorsLoading';
}

class PastorsLoaded extends PastorsState {

  @override
  String toString() => 'PastorsLoaded';
}

class PastorsError extends PastorsState {

  final exception;

  PastorsError(this.exception) : super([exception]);

  @override
  String toString() => 'PastorsError';
}

class NoPastorsLoaded extends PastorsState {

  @override
  String toString() => 'No Pastors Loaded';
}

//TODO: Add states
