/*
*   Filename    :   branch_event.dart
*   Purpose     :
*   Created     :   02/09/2019 1:45 PM by Detective Conan
*   Updated     :   02/09/2019 1:45 PM by Detective Conan
*   Changes     :   
*/

import 'package:equatable/equatable.dart';
import 'package:mt_carmel_app/src/models/branch.dart';

abstract class BranchEvent extends Equatable{
  BranchEvent([List props = const []]): super(props);
}

class GetBranch extends BranchEvent{
  final String branchId;

  GetBranch(this.branchId):super([branchId]);

  @override
  String toString() => 'GetBranch';
}

class LoadBranch extends BranchEvent{
  final Branch branch;

  LoadBranch(this.branch):super([branch]);

  @override
  String toString() => 'GetBranch';
}