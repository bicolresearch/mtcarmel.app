/*
*   Filename    :   application_event.dart
*   Purpose     :
*   Created     :   09/12/2019 10:11 AM by Detective Conan
*   Updated     :   09/12/2019 10:11 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ApplicationEvent extends Equatable {
  ApplicationEvent([List props = const []]) : super(props);
}

class FetchApplication extends ApplicationEvent {

  @override
  String toString() => 'FetchApplication';
}

class RefreshApplication extends ApplicationEvent {

  @override
  String toString() => 'RefreshApplication';
}

//TODO: Add events
