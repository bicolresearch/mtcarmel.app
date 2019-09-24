/*
*   Filename    :   branch_bloc.dart
*   Purpose     :
*   Created     :   02/09/2019 12:52 PM by Detective Conan
*	 Updated			:   24/09/2019 10:22 AM PM by Detective Conan
*	 Changes			:   Fixed the state when empty posts
*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_event.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_state.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/shared_preference_helper.dart';
import 'package:mt_carmel_app/src/models/branch.dart';
import 'package:mt_carmel_app/src/models/feed.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  Branch _branch;
  Branch get branch => _branch;

  @override
  BranchState get initialState => BranchUninitialized();

  @override
  Stream<BranchState> mapEventToState(BranchEvent event) async* {
    if (event is GetBranch) {
//      final bool isResetBranch = await SharedPreferencesHelper.getResetBranch();
//      if(isResetBranch)
      yield BranchLoading();
      if (_branch == null) {
        try {
          _branch = await _fetchBranch(event.branchId);
        } catch (e) {
//          if(!isResetBranch)
          if (e.toString().contains("No connection")) {
            yield BranchNoConnection(event.branchId);
            return;
          }
          yield BranchError(Exception("$e"), event.branchId);
          return;
        }

        if (_branch != null) {
//          await SharedPreferencesHelper.setResetBranch(false);
          yield BranchLoaded();
        } else {
          yield BranchError(
              Exception("Selected branch not loaded."), event.branchId);
          return;
        }
      } else {
        yield BranchLoaded();
      }
    }
  }

  Future<Branch> _fetchBranch(String branchId) async {
    try {
      _branch = await locator<BranchService>()
          .getBranch(branchId)
          .timeout(Duration(seconds: 10));
      return _branch;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
