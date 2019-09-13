/*
*   Filename    :   profile_event.dart
*   Purpose     :
*   Created     :   13/09/2019 9:50 AM by Detective Conan
*   Updated     :   13/09/2019 9:50 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProfileEvent extends Equatable {
  ProfileEvent([List props = const []]) : super(props);
}

class FetchProfile extends ProfileEvent {

  @override
  String toString() => 'FetchProfile';
}

class RefreshProfile extends ProfileEvent {

  @override
  String toString() => 'RefreshProfile';
}

//TODO: Add events
