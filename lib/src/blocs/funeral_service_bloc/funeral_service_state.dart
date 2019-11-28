/*
*   Filename    :   funeral_service_state.dart
*   Purpose     :
*   Created     :   28/11/2019 10:17 AM by Detective Conan
*   Updated     :   28/11/2019 10:17 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class FuneralServiceState extends Equatable {
  FuneralServiceState([List props = const []]) : super(props);
}

class FuneralServiceUninitialized extends FuneralServiceState {

  @override
  String toString() => 'FuneralServiceUninitialized';
}

class FuneralServiceLoading extends FuneralServiceState {

  @override
  String toString() => 'FuneralServiceLoading';
}

class FuneralServiceLoaded extends FuneralServiceState {

  @override
  String toString() => 'FuneralServiceLoaded';
}

class FuneralServiceError extends FuneralServiceState {

  final exception;

  FuneralServiceError(this.exception) : super([exception]);

  @override
  String toString() => 'FuneralServiceError';
}

class NoFuneralServiceLoaded extends FuneralServiceState {

  @override
  String toString() => 'No FuneralService Loaded';
}

class FuneralServiceNoConnection extends FuneralServiceState {

  @override
  String toString() => 'No Connection';
}

//TODO: Add states
