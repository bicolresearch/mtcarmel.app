/*
*   Filename    :   branch_locations_state.dart
*   Purpose     :
*   Created     :   19/09/2019 5:19 PM by Detective Conan
*   Updated     :   19/09/2019 5:19 PM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/branch.dart';

@immutable
abstract class BranchLocationsState extends Equatable {
  BranchLocationsState([List props = const []]) : super(props);
}

class BranchLocationsUninitialized extends BranchLocationsState {
  @override
  String toString() => 'BranchLocationsUninitialized';
}

class BranchLocationsLoading extends BranchLocationsState {
  @override
  String toString() => 'BranchLocationsLoading';
}

class BranchLocationsLoaded extends BranchLocationsState {
  @override
  String toString() => 'BranchLocationsLoaded';
}

class BranchLocationsError extends BranchLocationsState {
  final exception;

  BranchLocationsError(this.exception) : super([exception]);

  @override
  String toString() => 'BranchLocationsError';
}

class NoBranchLocationsLoaded extends BranchLocationsState {
  @override
  String toString() => 'No BranchLocations Loaded';
}

class BranchSelected extends BranchLocationsState {
  final Branch branch;

  BranchSelected(this.branch) : super([branch]);

  @override
  String toString() => 'BranchSelected';
}
