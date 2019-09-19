/*
*   Filename    :   start_page.dart
*   Purpose     :
*   Created     :   17/09/2019 9:37 AM by Detective Conan
*	 Updated			:   19/09/2019 6:04 PM PM by Detective Conan
*	 Changes			:   Navigate to BranchLocationsScreen instead of BranchSelectionScreen
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_event.dart';
import 'package:mt_carmel_app/src/blocs/branch_locations_bloc/branch_locations_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_locations_bloc/branch_locations_event.dart';
import 'package:mt_carmel_app/src/blocs/branch_locations_bloc/branch_locations_state.dart';
import 'package:mt_carmel_app/src/blocs/tab_bloc/tab_bloc.dart';
import 'package:mt_carmel_app/src/screens/branch_locations_screen.dart';

import 'package:mt_carmel_app/src/screens/home_screen.dart';
import 'package:mt_carmel_app/src/widgets/error_message.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BranchLocationsBloc>(
      builder: (context) =>
          BranchLocationsBloc()..dispatch(FetchBranchLocations()),
      child: BlocBuilder<BranchLocationsBloc, BranchLocationsState>(
          builder: (context, state) {
        if (state is BranchLocationsLoading) {
          return Scaffold(body: LoadingIndicator());
        }
        if (state is BranchLocationsLoaded) {
          return BranchLocationsScreen();
        }
        if (state is BranchLocationsError) {
          return Scaffold(
              body: ErrorMessage.errMsg(errorMessage: "Something went wrong!"));
        }
        if (state is BranchSelected) {
          final branchId = state.branch.id;
          return MultiBlocProvider(providers: [
            BlocProvider<BranchBloc>(
              builder: (context) => BranchBloc()..dispatch(GetBranch(branchId)),
            ),
            BlocProvider<TabBloc>(
              builder: (context) => TabBloc(),
            )
          ], child: HomeScreen());
        }
        return Scaffold();
      }),
    );
  }
}
