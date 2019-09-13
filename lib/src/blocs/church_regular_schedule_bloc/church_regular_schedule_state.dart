/*
*   Filename    :   church_regular_schedule_state.dart
*   Purpose     :
*   Created     :   13/09/2019 1:50 PM by Detective Conan
*   Updated     :   13/09/2019 1:50 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/schedule.dart';

@immutable
abstract class ChurchRegularScheduleState extends Equatable {
  ChurchRegularScheduleState([List props = const []]) : super(props);
}

class ChurchRegularScheduleUninitialized extends ChurchRegularScheduleState {
  @override
  String toString() => 'ChurchRegularScheduleUninitialized';
}

class ChurchRegularScheduleLoading extends ChurchRegularScheduleState {
  @override
  String toString() => 'ChurchRegularScheduleLoading';
}

class ChurchRegularScheduleLoaded extends ChurchRegularScheduleState {

  @override
  String toString() => 'ChurchRegularScheduleLoaded';
}

class ChurchRegularScheduleError extends ChurchRegularScheduleState {
  final exception;

  ChurchRegularScheduleError(this.exception) : super([exception]);

  @override
  String toString() => 'ChurchRegularScheduleError';
}

//TODO: Add states
