/*
*   Filename    :   branch_selection_bloc.dart
*   Purpose     :
*   Created     :   08/09/2019 12:56 AM by Detective Conan
*	 Updated			:   17/09/2019 1:06 PM PM by Detective Conan
*	 Changes			:   Cleaned up.
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_event.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_state.dart';
import 'package:mt_carmel_app/src/core/services/branch_list_service.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/shared_preference_helper.dart';
import 'package:mt_carmel_app/src/models/branch.dart';

class BranchSelectionBloc
    extends Bloc<BranchSelectionEvent, BranchSelectionState> {
  bool _isFirstUsage = true;

  List<Branch> _branchSelection;

  List<Branch> get branchSelection => _branchSelection;

  Branch _selectedBranch;

  Branch get selectedBranch => _selectedBranch;

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
      var branchId;
      await SharedPreferencesHelper.getBranchIdFlag().then((value) {
        branchId = value;
      }).catchError((e) => print(e));
      if (branchId == null || branchId.isEmpty)
        try {
          _branchSelection = await locator<BranchListService>()
              .getData()
              .timeout(Duration(seconds: 5));
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
        final Branch branch =
            await locator<BranchService>().getBranch(branchId);
        _selectedBranch = branch;
        yield BranchSelectionSelected();
      }
    }

    if (event is SelectedBranch) {
      try {
        _selectedBranch =
            await locator<BranchService>().getBranch(event.branch.id);
        await SharedPreferencesHelper.setBranchIdFlag(_selectedBranch.id);
        await SharedPreferencesHelper.setBranchNameFlag(_selectedBranch.name);
        yield DoneSaveSelectedBranch();
      } catch (e) {
        print(e);
        yield SelectedBranchNotLoaded(
            Exception("${event.branch.name} branch is not available."));
      }
    }

    if (event is SaveSelectedBranch) {
      try {
        _selectedBranch =
            await locator<BranchService>().getBranch(event.branch.id);
        await SharedPreferencesHelper.setBranchIdFlag(_selectedBranch.id);
        await SharedPreferencesHelper.setBranchNameFlag(_selectedBranch.name);
        yield DoneSaveSelectedBranch();
      } catch (e) {
        print(e);
        yield SelectedBranchNotLoaded(
            Exception("${event.branch.name} branch is not available."));
      }
    }
  }

  bool get isFirstUsage => _isFirstUsage;
}
