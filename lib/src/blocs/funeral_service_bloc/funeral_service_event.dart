/*
*   Filename    :   funeral_service_event.dart
*   Purpose     :
*   Created     :   28/11/2019 10:17 AM by Detective Conan
*   Updated     :   28/11/2019 10:17 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class FuneralServiceEvent extends Equatable {
  FuneralServiceEvent([List props = const []]) : super(props);
}

class FetchFuneralService extends FuneralServiceEvent {

  @override
  String toString() => 'FetchFuneralService';
}

class RefreshFuneralService extends FuneralServiceEvent {

  @override
  String toString() => 'RefreshFuneralService';
}

//TODO: Add events
