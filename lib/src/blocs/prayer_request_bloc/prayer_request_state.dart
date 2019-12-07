/*
*   Filename    :   prayer_request_state.dart
*   Purpose     :
*   Created     :   19/11/2019 1:52 PM by Detective Conan
*	 Updated			:   28/11/2019 9:43 AM PM by Detective Conan
*	 Changes			:   Added no connection state
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PrayerRequestState extends Equatable {
  PrayerRequestState([List props = const []]) : super(props);
}

class PrayerRequestUninitialized extends PrayerRequestState {
  @override
  String toString() => 'PrayerRequestUninitialized';
}

class PrayerRequestLoading extends PrayerRequestState {
  @override
  String toString() => 'PrayerRequestLoading';
}

class PrayerRequestLoaded extends PrayerRequestState {
  @override
  String toString() => 'PrayerRequestLoaded';
}

class PrayerRequestError extends PrayerRequestState {
  final exception;

  PrayerRequestError(this.exception) : super([exception]);

  @override
  String toString() => 'PrayerRequestError';
}

class NoPrayerRequestLoaded extends PrayerRequestState {
  @override
  String toString() => 'No PrayerRequest Loaded';
}

class PrayerRequestNoConnection extends PrayerRequestState {
  @override
  String toString() => 'No Connection';
}

//TODO: Add states
