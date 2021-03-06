/*
*   Filename    :   branch_selection_state.dart
*   Purpose     :
*   Created     :   08/09/2019 12:58 AM by Detective Conan
*   Updated     :   08/09/2019 12:58 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/branch_location.dart';

@immutable
abstract class BranchSelectionState extends Equatable {
  BranchSelectionState([List props = const []]) : super(props);
}

class BranchSelectionUninitialized extends BranchSelectionState {
  @override
  String toString() => 'BranchSelectionUninitialized';
}

class BranchSelectionLoading extends BranchSelectionState {
  @override
  String toString() => 'BranchSelectionLoading';
}

class BranchSelectionLoaded extends BranchSelectionState {
  @override
  String toString() => 'BranchSelectionLoaded';
}

class BranchSelectionError extends BranchSelectionState {
  final Exception exception;
  final BranchLocation branchLocation;

  BranchSelectionError(this.exception, this.branchLocation)
      : super([exception, branchLocation]);

  @override
  String toString() => 'BranchSelectionError';
}

class BranchSelectionNoBranchFetched extends BranchSelectionState {
  final BranchLocation branchLocation;

  BranchSelectionNoBranchFetched(this.branchLocation) : super([branchLocation]);

  @override
  String toString() => 'BranchSelectionNoBranchFetched';
}

class BranchSelectionSelected extends BranchSelectionState {
  @override
  String toString() => 'BranchSelectionSelected';
}

class DoneSaveSelectedBranch extends BranchSelectionState {
  @override
  String toString() => 'DoneSaveSelectedBranch';
}

class FirstUsageState extends BranchSelectionState {
  @override
  String toString() => 'FirstUsageState';
}

class SelectedBranchNotLoaded extends BranchSelectionState {
  final Exception exception;

  SelectedBranchNotLoaded(this.exception) : super([exception]);

  @override
  String toString() => 'SelectedBranchNotLoaded';
}

class BranchSelectionNoConnection extends BranchSelectionState {
  final BranchLocation branchLocation;

  BranchSelectionNoConnection(this.branchLocation) : super([branchLocation]);

  @override
  String toString() => 'BranchSelectionNoConnection';
}
