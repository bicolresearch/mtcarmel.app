/*
*   Filename    :   location_map_event.dart
*   Purpose     :
*   Created     :   17/09/2019 6:04 PM by Detective Conan
*   Updated     :   17/09/2019 6:04 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LocationMapEvent extends Equatable {
  LocationMapEvent([List props = const []]) : super(props);
}

class FetchLocationMap extends LocationMapEvent {

  @override
  String toString() => 'FetchLocationMap';
}

class RefreshLocationMap extends LocationMapEvent {

  @override
  String toString() => 'RefreshLocationMap';
}

//TODO: Add events
