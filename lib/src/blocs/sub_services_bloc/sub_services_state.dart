/*
*   Filename    :   sub_services_state.dart
*   Purpose     :
*   Created     :   11/09/2019 12:52 PM by Detective Conan
*   Updated     :   11/09/2019 12:52 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';

@immutable
abstract class SubServicesState extends Equatable {
  SubServicesState([List props = const []]) : super(props);
}

class SubServicesUninitialized extends SubServicesState {
  @override
  String toString() => 'SubServicesUninitialized';
}

class SubServicesLoading extends SubServicesState {
  @override
  String toString() => 'SubServicesLoading';
}

class SubServicesLoaded extends SubServicesState {
  @override
  String toString() => 'SubServicesLoaded';
}

class SubServicesError extends SubServicesState {
  final exception;
  final ModuleReference moduleReference;

  SubServicesError(this.exception, this.moduleReference)
      : super([exception, moduleReference]);

  @override
  String toString() => 'SubServicesError';
}

class NoSubServicesLoaded extends SubServicesState {
  final ModuleReference moduleReference;

  NoSubServicesLoaded(this.moduleReference) : super([moduleReference]);

  @override
  String toString() => 'NoSubServicesLoaded';
}

class SubServicesNoConnection extends SubServicesState {
  final ModuleReference moduleReference;

  SubServicesNoConnection(this.moduleReference) : super([moduleReference]);

  @override
  String toString() => 'SubServicesNoConnection';
}
