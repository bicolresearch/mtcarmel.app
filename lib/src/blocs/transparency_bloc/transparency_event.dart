/*
*   Filename    :   transparency_event.dart
*   Purpose     :
*   Created     :   12/09/2019 3:54 PM by Detective Conan
*   Updated     :   12/09/2019 3:54 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class TransparencyEvent extends Equatable {
  TransparencyEvent([List props = const []]) : super(props);
}

class FetchTransparency extends TransparencyEvent {

  @override
  String toString() => 'FetchTransparency';
}

class RefreshTransparency extends TransparencyEvent {

  @override
  String toString() => 'RefreshTransparency';
}

//TODO: Add events
