/*
*   Filename    :   about_event.dart
*   Purpose     :
*   Created     :   18/09/2019 10:18 AM by Detective Conan
*   Updated     :   18/09/2019 10:18 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AboutEvent extends Equatable {
  AboutEvent([List props = const []]) : super(props);
}

class FetchAbout extends AboutEvent {

  @override
  String toString() => 'FetchAbout';
}

class RefreshAbout extends AboutEvent {

  @override
  String toString() => 'RefreshAbout';
}

//TODO: Add events
