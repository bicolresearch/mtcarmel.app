/*
*   Filename    :   start_page.dart
*   Purpose     :
*   Created     :   17/09/2019 9:37 AM by Detective Conan
*	 Updated			:   23/09/2019 10:29 AM PM by Detective Conan
*	 Changes			:   Added messages for no connectivity, error and no locations loaded
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
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(child: Text("Something went wrong")),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.brown,
                  child: Text(
                    "Retry",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    BlocProvider.of<BranchLocationsBloc>(context)
                        .dispatch(FetchBranchLocations());
                  },
                ),
              ],
            ),
          );
        }
        if (state is NoBranchLocationsLoaded) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(child: Text("No branch location locaded")),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.brown,
                  child: Text(
                    "Retry",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    BlocProvider.of<BranchLocationsBloc>(context)
                        .dispatch(FetchBranchLocations());
                  },
                ),
              ],
            ),
          );
        }
        if (state is BranchLocationsNoConnection) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(child: Text("No Connection")),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.brown,
                  child: Text(
                    "Retry",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    BlocProvider.of<BranchLocationsBloc>(context)
                        .dispatch(FetchBranchLocations());
                  },
                ),
              ],
            ),
          );
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
