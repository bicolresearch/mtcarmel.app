/*
*   Filename    :   priests_state.dart
*   Purpose     :
*   Created     :   17/09/2019 3:00 PM by Detective Conan
*   Updated     :   17/09/2019 3:00 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PriestsState extends Equatable {
  PriestsState([List props = const []]) : super(props);
}

class PriestsUninitialized extends PriestsState {

  @override
  String toString() => 'PriestsUninitialized';
}

class PriestsLoading extends PriestsState {

  @override
  String toString() => 'PriestsLoading';
}

class PriestsLoaded extends PriestsState {

  @override
  String toString() => 'PriestsLoaded';
}

class PriestsError extends PriestsState {

  final exception;

  PriestsError(this.exception) : super([exception]);

  @override
  String toString() => 'PriestsError';
}

class NoPriestsLoaded extends PriestsState {

  @override
  String toString() => 'NoPriestsLoaded';
}


