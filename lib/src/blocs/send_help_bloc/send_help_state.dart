/*
*   Filename    :   send_help_state.dart
*   Purpose     :
*   Created     :   12/09/2019 12:10 PM by Detective Conan
*   Updated     :   12/09/2019 12:10 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/send_help.dart';

@immutable
abstract class SendHelpState extends Equatable {
  SendHelpState([List props = const []]) : super(props);
}

class SendHelpUninitialized extends SendHelpState {
  @override
  String toString() => 'SendHelpUninitialized';
}

class SendHelpLoading extends SendHelpState {
  @override
  String toString() => 'SendHelpLoading';
}

class SendHelpLoaded extends SendHelpState {

  @override
  String toString() => 'SendHelpLoaded';
}

class SendHelpError extends SendHelpState {
  final exception;

  SendHelpError(this.exception) : super([exception]);

  @override
  String toString() => 'SendHelpError';
}

class NoSendHelpLoaded extends SendHelpState {

  @override
  String toString() => 'NoSendHelpLoaded';
}

