/*
*   Filename    :   branch_selection_bloc.dart
*   Purpose     :
*   Created     :   08/09/2019 12:56 AM by Detective Conan
*	 Updated			:   09/09/2019 3:41 PM PM by Detective Conan
*	 Changes			:   Added saving of selected branch and checking the saved selected.
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_event.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_state.dart';
import 'package:mt_carmel_app/src/core/services/branch_selection_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/shared_preference_helper.dart';

import 'package:mt_carmel_app/src/models/branch_selection.dart';

class BranchSelectionBloc
    extends Bloc<BranchSelectionEvent, BranchSelectionState> {
  bool _isFirstUsage = true;

  List<BranchId> _branchSelection;

  List<BranchId> get branchSelection => _branchSelection;

  BranchId _selectedBranch;

  BranchId get selectedBranch => _selectedBranch;

  clearBranch() {
    _selectedBranch = null;
  }

  @override
  BranchSelectionState get initialState => BranchSelectionUninitialized();

  @override
  Stream<BranchSelectionState> mapEventToState(
      BranchSelectionEvent event) async* {
    if (event is BranchSelectionFetch) {
      yield BranchSelectionLoading();
      String branchId;
      await SharedPreferencesHelper.getBranchIdFlag().then((value) {
        branchId = value;
      }).catchError((e) => print(e));
      String branchName;
      await SharedPreferencesHelper.getBranchNameFlag().then((value) {
        branchName = value;
      }).catchError((e) => print(e));
      String idBranch;
      await SharedPreferencesHelper.getIdBranchFlag().then((value) {
        idBranch = value;
      }).catchError((e) => print(e));

      await SharedPreferencesHelper.getFirstUsageFlag().then((value) {
        _isFirstUsage = value;
      }).catchError((e) => print(e));

      if (branchId == null  || branchId.isEmpty)
        try {
          _branchSelection =
          await locator<BranchSelectionService>().getJsonData();
          await Future.delayed(Duration(seconds: 3));
          if (_branchSelection.isNotEmpty)
            yield BranchSelectionLoaded();
          else
            yield BranchSelectionNoBranchFetched();
        } catch (e) {
          print(e);
          yield BranchSelectionError();
        }
      else {
        _selectedBranch = BranchId(idBranch, branchId, branchName);
        await Future.delayed(Duration(seconds: 2));
        yield BranchSelectionSelected();
      }
    }

    if(event is SaveSelectedBranch){
      _selectedBranch = event.branchId;
      await SharedPreferencesHelper.setIdBranchFlag(event.branchId.id);
      await SharedPreferencesHelper.setBranchIdFlag(event.branchId.branchId);
      await SharedPreferencesHelper.setBranchNameFlag(event.branchId.branchName);
      yield DoneSaveSelectedBranch();
    }
  }
}
