/*
*   Filename    :   branch_locations_bloc.dart
*   Purpose     :
*   Created     :   19/09/2019 5:19 PM by Detective Conan
*	 Updated			:   23/09/2019 12:50 PM PM by Detective Conan
*	 Changes			:   Added message when selected branch and no connection
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_locations_bloc/branch_locations_event.dart';
import 'package:mt_carmel_app/src/blocs/branch_locations_bloc/branch_locations_state.dart';
import 'package:mt_carmel_app/src/core/services/branch_locations_service.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/shared_preference_helper.dart';
import 'package:mt_carmel_app/src/models/branch_location.dart';

class BranchLocationsBloc
    extends Bloc<BranchLocationsEvent, BranchLocationsState> {
  List<BranchLocation> _branchLocations = [];

  List<BranchLocation> get branchLocations => _branchLocations;

  @override
  BranchLocationsState get initialState => BranchLocationsUninitialized();

  @override
  Stream<BranchLocationsState> mapEventToState(
      BranchLocationsEvent event) async* {
    if (event is FetchBranchLocations) {
      yield BranchLocationsLoading();
      String branchId;
      await SharedPreferencesHelper.getBranchIdFlag().then((value) {
        branchId = value;
      }).catchError((e) => print("BranchSelectionBloc.mapEventToState: $e"));

      if (branchId == null || branchId.isEmpty) {
        try {
          _branchLocations = await locator<BranchLocationsService>().getData();
        } catch (e) {
          print(e);
          if (e.toString().contains("No connection")) {
            yield BranchLocationsNoConnection();
            return;
          }
          yield BranchLocationsError(Exception(e));
          return;
        }

        if (_branchLocations != null) {
          if (_branchLocations.isNotEmpty)
            yield BranchLocationsLoaded();
          else
            yield NoBranchLocationsLoaded();
        }
      } else {
        try {
          final branch = await locator<BranchService>().getBranch(branchId);
          yield BranchSelected(branch);
        } catch (e) {
          print(e);
          if (e.toString().contains("No connection")) {
            yield BranchLocationsNoConnection();
            return;
          }
          yield BranchLocationsError(
              Exception("Error in fetching branch by id."));
        }
      }
    }
  }
}
