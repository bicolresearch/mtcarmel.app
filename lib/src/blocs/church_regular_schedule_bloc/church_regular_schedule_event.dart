/*
*   Filename    :   church_regular_schedule_event.dart
*   Purpose     :
*   Created     :   13/09/2019 1:49 PM by Detective Conan
*   Updated     :   13/09/2019 1:49 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ChurchRegularScheduleEvent extends Equatable {
  ChurchRegularScheduleEvent([List props = const []]) : super(props);
}

class FetchChurchRegularSchedule extends ChurchRegularScheduleEvent {

  @override
  String toString() => 'FetchChurchRegularSchedule';
}

class RefreshChurchRegularSchedule extends ChurchRegularScheduleEvent {

  @override
  String toString() => 'RefreshChurchRegularSchedule';
}

//TODO: Add events
