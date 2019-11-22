/*
*   Filename    :   confirmation_event.dart
*   Purpose     :
*   Created     :   22/11/2019 10:03 AM by Detective Conan
*   Updated     :   22/11/2019 10:03 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ConfirmationEvent extends Equatable {
  ConfirmationEvent([List props = const []]) : super(props);
}

class FetchConfirmation extends ConfirmationEvent {

  @override
  String toString() => 'FetchConfirmation';
}

class RefreshConfirmation extends ConfirmationEvent {

  @override
  String toString() => 'RefreshConfirmation';
}

//TODO: Add events
