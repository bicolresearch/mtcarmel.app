/*
*   Filename    :   about_state.dart
*   Purpose     :
*   Created     :   18/09/2019 10:17 AM by Detective Conan
*   Updated     :   18/09/2019 10:17 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AboutState extends Equatable {
  AboutState([List props = const []]) : super(props);
}

class AboutUninitialized extends AboutState {

  @override
  String toString() => 'AboutUninitialized';
}

class AboutLoading extends AboutState {

  @override
  String toString() => 'AboutLoading';
}

class AboutLoaded extends AboutState {

  @override
  String toString() => 'AboutLoaded';
}

class AboutError extends AboutState {

  final exception;

  AboutError(this.exception) : super([exception]);

  @override
  String toString() => 'AboutError';
}

class NoAboutLoaded extends AboutState {

  @override
  String toString() => 'No About Loaded';
}

class AboutNoConnection extends AboutState {

  @override
  String toString() => 'AboutNoConnection';
}
