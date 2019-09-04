/*
*   Filename    :   branch_state.dart
*   Purpose     :
*   Created     :   02/09/2019 1:46 PM by Detective Conan
*   Updated     :   02/09/2019 1:46 PM by Detective Conan
*   Changes     :   
*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mt_carmel_app/src/models/branch.dart';

@immutable
abstract class BranchState extends Equatable {
  BranchState([List props = const []]) : super(props);
}

class BranchUninitialized extends BranchState {
  @override
  String toString() => 'BranchUninitialized';
}

class BranchLoading extends BranchState{
  @override
  String toString() => 'BranchLoading';
}

class BranchLoaded extends BranchState {
  final Branch branch;

  BranchLoaded(this.branch) : super([branch]);

  @override
  String toString() => 'BranchLoaded { tabs: ${this.branch} }';
}

class BranchNotLoaded extends BranchState {
  @override
  String toString() => 'BranchNotLoaded';
}