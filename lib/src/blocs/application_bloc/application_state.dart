/*
*   Filename    :   application_state.dart
*   Purpose     :
*   Created     :   09/12/2019 10:12 AM by Detective Conan
*   Updated     :   09/12/2019 10:12 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ApplicationState extends Equatable {
  ApplicationState([List props = const []]) : super(props);
}

class ApplicationUninitialized extends ApplicationState {

  @override
  String toString() => 'ApplicationUninitialized';
}

class ApplicationLoading extends ApplicationState {

  @override
  String toString() => 'ApplicationLoading';
}

class ApplicationLoaded extends ApplicationState {

  @override
  String toString() => 'ApplicationLoaded';
}

class ApplicationError extends ApplicationState {

  final exception;

  ApplicationError(this.exception) : super([exception]);

  @override
  String toString() => 'ApplicationError';
}

class NoApplicationLoaded extends ApplicationState {

  @override
  String toString() => 'No Application Loaded';
}

class ApplicationNoConnection extends ApplicationState {

  @override
  String toString() => 'No Connection';
}

//TODO: Add states
