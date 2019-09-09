/*
*   Filename    :   branch_selection_event.dart
*   Purpose     :
*   Created     :   08/09/2019 12:57 AM by Detective Conan
*   Updated     :   08/09/2019 12:57 AM by Detective Conan
*   Changes     :   
*/
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class BranchSelectionEvent extends Equatable {
  BranchSelectionEvent([List props = const []]) : super(props);
}

class BranchSelectionFetch extends BranchSelectionEvent {

  @override
  String toString() => 'BranchSelectionFetch';
}

class BranchSelectionReset extends BranchSelectionEvent {

  @override
  String toString() => 'BranchSelectionReset';
}


class SaveSelectedBranch extends BranchSelectionEvent {

  final branchId;

  SaveSelectedBranch(this.branchId):super([branchId]);

  @override
  String toString() => 'SaveSelectedBranch';
}
