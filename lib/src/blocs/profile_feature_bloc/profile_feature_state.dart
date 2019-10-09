/*
*   Filename    :   profile_feature_state.dart
*   Purpose     :
*   Created     :   13/09/2019 9:49 AM by Detective Conan
*   Updated     :   13/09/2019 9:49 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProfileFeatureState extends Equatable {
  ProfileFeatureState([List props = const []]) : super(props);
}

class ProfileFeatureUninitialized extends ProfileFeatureState {

  @override
  String toString() => 'ProfileUninitialized';
}

class ProfileFeatureLoading extends ProfileFeatureState {

  @override
  String toString() => 'ProfileLoading';
}

class ProfileFeatureLoaded extends ProfileFeatureState {

  @override
  String toString() => 'ProfileLoaded';
}

class ProfileFeatureError extends ProfileFeatureState {

  final exception;

  ProfileFeatureError(this.exception) : super([exception]);

  @override
  String toString() => 'ProfileError';
}

class NoProfileLoaded extends ProfileFeatureState{

  @override
  String toString() => 'NoProfileLoaded';
}
