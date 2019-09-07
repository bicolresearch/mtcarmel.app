/*
*   Filename    :   services_state.dart
*   Purpose     :
*   Created     :   05/09/2019 6:31 PM by Detective Conan
*   Updated     :   05/09/2019 6:31 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ServicesState extends Equatable {
  ServicesState([List props = const []]) : super(props);
}

class ServicesUninitialized extends ServicesState {

  @override
  String toString() => 'ServicesUninitialized';
}

class ServicesLoading extends  ServicesState {

  @override
  String toString() => 'ServicesLoading';
}

class ServicesLoaded extends ServicesState {

  @override
  String toString() => 'ServicesLoaded';
}


class ServicesErrorLoading extends ServicesState {

  @override
  String toString() => 'ServicesErrorLoading';
}

class NoServicesLoaded extends ServicesState {

  @override
  String toString() => 'NoServicesLoaded';
}
