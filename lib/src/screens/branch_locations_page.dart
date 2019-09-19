/*
*   Filename    :   branch_locations_page.dart
*   Purpose     :
*   Created     :   19/09/2019 5:36 PM by Detective Conan
*   Updated     :   19/09/2019 5:36 PM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_locations_bloc/branch_locations_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_locations_bloc/branch_locations_state.dart';
import 'package:mt_carmel_app/src/screens/branch_locations_screen.dart';
import 'package:mt_carmel_app/src/widgets/error_message.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class BranchLocationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchLocationsBloc, BranchLocationsState>(
      builder: (context, state) {
        if(state is BranchLocationsLoading || state is BranchLocationsUninitialized)
          return Scaffold(body: LoadingIndicator());
        if(state is BranchLocationsLoaded){
          return BranchLocationsScreen();
        }
        if(state is BranchLocationsError)
          {
            return Scaffold(body: ErrorMessage.errMsg(errorMessage: "Something went wrong"));
          }
        if(state is NoBranchLocationsLoaded)
          {
            return Scaffold(body: ErrorMessage.errMsg(errorMessage: "No BranchLocations Loaded"));
          }
        return Container();
      },
    );
  }
}