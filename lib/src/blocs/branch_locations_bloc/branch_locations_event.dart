/*
*   Filename    :   branch_locations_event.dart
*   Purpose     :
*   Created     :   19/09/2019 5:20 PM by Detective Conan
*   Updated     :   19/09/2019 5:20 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class BranchLocationsEvent extends Equatable {
  BranchLocationsEvent([List props = const []]) : super(props);
}

class FetchBranchLocations extends BranchLocationsEvent {

  @override
  String toString() => 'FetchBranchLocations';
}

class RefreshBranchLocations extends BranchLocationsEvent {

  @override
  String toString() => 'RefreshBranchLocations';
}

//TODO: Add events
