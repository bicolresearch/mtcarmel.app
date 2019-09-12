/*
*   Filename    :   send_help_event.dart
*   Purpose     :
*   Created     :   12/09/2019 12:11 PM by Detective Conan
*   Updated     :   12/09/2019 12:11 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SendHelpEvent extends Equatable {
  SendHelpEvent([List props = const []]) : super(props);
}

class FetchSendHelp extends SendHelpEvent {

  @override
  String toString() => 'FetchSendHelp';
}

class RefreshSendHelp extends SendHelpEvent {

  @override
  String toString() => 'RefreshSendHelp';
}

//TODO: Add events
