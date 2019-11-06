/*
*   Filename    :   profile_feature_event.dart
*   Purpose     :
*   Created     :   13/09/2019 9:50 AM by Detective Conan
*   Updated     :   13/09/2019 9:50 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProfileFeatureEvent extends Equatable {
  ProfileFeatureEvent([List props = const []]) : super(props);
}

class FetchProfileFeature extends ProfileFeatureEvent {

  @override
  String toString() => 'FetchProfileFeature';
}

class RefreshProfileFeature extends ProfileFeatureEvent {

  @override
  String toString() => 'RefreshProfileFeature';
}

class LogoutProfileFeature extends ProfileFeatureEvent {

  @override
  String toString() => 'LogoutProfileFeature';
}
