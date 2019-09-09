/*
*   Filename    :   branch_selection_bloc.dart
*   Purpose     :
*   Created     :   08/09/2019 12:56 AM by Detective Conan
*   Updated     :   08/09/2019 12:56 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_event.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_state.dart';
import 'package:mt_carmel_app/src/core/services/branch_selection_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/branch.dart';
import 'package:mt_carmel_app/src/models/branch_selection.dart';

class BranchSelectionBloc
    extends Bloc<BranchSelectionEvent, BranchSelectionState> {
  List<BranchId> _branchSelection;

  List<BranchId> get branchSelection => _branchSelection;

  @override
  BranchSelectionState get initialState => BranchSelectionUninitialized();

  @override
  Stream<BranchSelectionState> mapEventToState(
      BranchSelectionEvent event) async* {
    if(event is BranchSelectionFetch){
      yield BranchSelectionLoading();
      try {
        _branchSelection = await locator<BranchSelectionService>().getJsonData();
        await Future.delayed(Duration(seconds: 3));
        if(_branchSelection.isNotEmpty)
          yield BranchSelectionLoaded();
        else
          yield BranchSelectionNoBranchFetched();
      } catch (e) {
        print(e);
        yield BranchSelectionError();
      }
    }
  }
}

