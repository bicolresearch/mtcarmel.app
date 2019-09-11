/*
*   Filename    :   branch_bloc.dart
*   Purpose     :
*   Created     :   02/09/2019 12:52 PM by Detective Conan
*   Updated     :   02/09/2019 12:52 PM by Detective Conan
*   Changes     :   
*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_event.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_state.dart';
import 'package:mt_carmel_app/src/models/branch.dart';
import 'package:mt_carmel_app/src/repositories/branches_repo.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  Branch _branch;

  @override
  BranchState get initialState => BranchUninitialized();

  @override
  Stream<BranchState> mapEventToState(BranchEvent event) async* {
    if (event is GetBranch) {
      yield BranchLoading();
      if (_branch == null && event.branchId != _branch?.branchId) {
        var branch;
        try {
          branch = await _fetchBranch(event.branchId);
        } catch (e) {
          yield BranchError(Exception("$e"));
          return;
        }

        if (branch != null) {
          _branch = branch;
          yield BranchLoaded(branch);
        } else {
          await Future.delayed(Duration(milliseconds: 300));
          yield BranchLoaded(_branch);
        }
      } else {
        yield BranchLoaded(_branch);
      }
    }
  }

  Future<Branch> _fetchBranch(String branchId) async {
    await Future.delayed(Duration(microseconds: 300));
    final BranchesRepo branchesRepo = BranchesRepo();
    //TODO Temporary. use the api instead
    final branches = branchesRepo.branches;
    for (var item in branches) {
      if (item.containsKey("branch_id")) {
        if (item["branch_id"] == branchId) return Branch.fromJson(item);
      }
    }

    print("no branch");
    return null;
  }
}
