/*
*   Filename    :   mass_request_event.dart
*   Purpose     :
*   Created     :   21/11/2019 10:01 AM by Detective Conan
*   Updated     :   21/11/2019 10:01 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MassRequestEvent extends Equatable {
  MassRequestEvent([List props = const []]) : super(props);
}

class FetchMassRequest extends MassRequestEvent {
//  final id;
//
//  FetchMassRequest(this.id) : super([id]);

  @override
  String toString() => 'FetchMassRequest';
}

class RefreshMassRequest extends MassRequestEvent {
  @override
  String toString() => 'RefreshMassRequest';
}

//TODO: Add events
