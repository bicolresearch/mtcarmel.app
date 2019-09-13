/*
*   Filename    :   profile_state.dart
*   Purpose     :
*   Created     :   13/09/2019 9:49 AM by Detective Conan
*   Updated     :   13/09/2019 9:49 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProfileState extends Equatable {
  ProfileState([List props = const []]) : super(props);
}

class ProfileUninitialized extends ProfileState {

  @override
  String toString() => 'ProfileUninitialized';
}

class ProfileLoading extends ProfileState {

  @override
  String toString() => 'ProfileLoading';
}

class ProfileLoaded extends ProfileState {

  @override
  String toString() => 'ProfileLoaded';
}

class ProfileError extends ProfileState {

  final exception;

  ProfileError(this.exception) : super([exception]);

  @override
  String toString() => 'ProfileError';
}

//TODO: Add states
