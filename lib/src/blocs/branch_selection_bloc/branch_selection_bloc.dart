/*
*   Filename    :   branch_selection_bloc.dart
*   Purpose     :
*   Created     :   08/09/2019 12:56 AM by Detective Conan
*	 Updated			:   23/09/2019 9:32 AM PM by Detective Conan
*	 Changes			:   Added connection checker
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
    if (event is BranchSelectionFetchByLocation) {
      yield BranchSelectionLoading();
      try {
        _branchSelection = await locator<BranchListService>()
            .getLocations(event.branchLocation.id)
            .timeout(Duration(seconds: 10));
        if (_branchSelection.isNotEmpty)
          yield BranchSelectionLoaded();
        else
          yield BranchSelectionNoBranchFetched(event.branchLocation);
      } catch (e) {
        print(e);
        if (e.toString().contains("No connection")) {
          yield BranchSelectionNoConnection(event.branchLocation);
          return;
        }
        yield BranchSelectionError(
            Exception("Error in fetching the list of branches."), event.branchLocation);
        return;
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
