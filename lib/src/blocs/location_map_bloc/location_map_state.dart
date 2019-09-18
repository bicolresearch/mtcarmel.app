/*
*   Filename    :   location_map_state.dart
*   Purpose     :
*   Created     :   17/09/2019 6:04 PM by Detective Conan
*   Updated     :   17/09/2019 6:04 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LocationMapState extends Equatable {
  LocationMapState([List props = const []]) : super(props);
}

class LocationMapUninitialized extends LocationMapState {

  @override
  String toString() => 'LocationMapUninitialized';
}

class LocationMapLoading extends LocationMapState {

  @override
  String toString() => 'LocationMapLoading';
}

class LocationMapLoaded extends LocationMapState {

  @override
  String toString() => 'LocationMapLoaded';
}

class LocationMapError extends LocationMapState {

  final exception;

  LocationMapError(this.exception) : super([exception]);

  @override
  String toString() => 'LocationMapError';
}

class NoLocationMapLoaded extends LocationMapState {

  @override
  String toString() => 'No LocationMap Loaded';
}

//TODO: Add states
