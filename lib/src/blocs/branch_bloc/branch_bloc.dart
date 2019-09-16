/*
*   Filename    :   branch_bloc.dart
*   Purpose     :
*   Created     :   02/09/2019 12:52 PM by Detective Conan
*   Updated     :   02/09/2019 12:52 PM by Detective Conan
*   Changes     :   
*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_event.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_state.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/shared_preference_helper.dart';
import 'package:mt_carmel_app/src/models/branch.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  Branch _branch;

  @override
  BranchState get initialState => BranchUninitialized();

  @override
  Stream<BranchState> mapEventToState(BranchEvent event) async* {
    if (event is GetBranch) {
      yield BranchLoading();
      final bool isResetBranch = await SharedPreferencesHelper.getResetBranch();
      if (isResetBranch || _branch == null && event.branchId != _branch?.id) {
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
          yield BranchError(Exception("Selected branch not loaded."));
        }
      } else {
        yield BranchLoaded(_branch);
      }
    }
  }

  Future<Branch> _fetchBranch(String branchId) async {
//    final List<Branch> branches = await locator<BranchListService>().getData();
//
//    for (var branch in branches) {
//      if (branch.id == branchId) {
//        return branch;
//      }
//    }

    try {
      _branch = await locator<BranchService>().getBranch(branchId);
      return _branch;
    } catch (e) {
      print(e);
      throw e;
    }

    print("no branch");
    return null;
  }
}
