/*
*   Filename    :   branch_bloc.dart
*   Purpose     :
*   Created     :   02/09/2019 12:52 PM by Detective Conan
*	 Updated			:   17/09/2019 1:47 PM PM by Detective Conan
*	 Changes			:   Added check if the bloc was reset.
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
          await SharedPreferencesHelper.setResetBranch(false);
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
    try {
      _branch = await locator<BranchService>()
          .getBranch(branchId)
          .timeout(Duration(seconds: 3));
      return _branch;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
