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

class BranchLoading extends BranchState {
  @override
  String toString() => 'BranchLoading';
}

class BranchLoaded extends BranchState {

  @override
  String toString() => 'BranchLoaded';
}

class BranchError extends BranchState {
  final exception;
  final String branchId;

  BranchError(this.exception, this.branchId) : super([exception, branchId]);

  @override
  String toString() => 'BranchNotLoaded';
}

class BranchNoConnection extends BranchState {
  final String branchId;

  BranchNoConnection(this.branchId) : super([branchId]);

  @override
  String toString() => 'BranchNoConnection';
}
