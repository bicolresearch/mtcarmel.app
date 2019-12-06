/*
*   Filename    :   prayer_request_event.dart
*   Purpose     :
*   Created     :   19/11/2019 1:52 PM by Detective Conan
*   Updated     :   19/11/2019 1:52 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PrayerRequestEvent extends Equatable {
  PrayerRequestEvent([List props = const []]) : super(props);
}

class FetchPrayerRequest extends PrayerRequestEvent {
  final id;

  FetchPrayerRequest(this.id) : super([id]);

  @override
  String toString() => 'FetchPrayerRequest';
}

class RefreshPrayerRequest extends PrayerRequestEvent {
  @override
  String toString() => 'RefreshPrayerRequest';
}

//TODO: Add events
