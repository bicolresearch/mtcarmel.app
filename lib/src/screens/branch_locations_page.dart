/*
*   Filename    :   branch_locations_page.dart
*   Purpose     :
*   Created     :   19/09/2019 5:36 PM by Detective Conan
*	 Updated			:   23/09/2019 10:01 AM PM by Detective Conan
*	 Changes			:   Added checking of connection. Improved error messages.
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_locations_bloc/branch_locations_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_locations_bloc/branch_locations_event.dart';
import 'package:mt_carmel_app/src/blocs/branch_locations_bloc/branch_locations_state.dart';
import 'package:mt_carmel_app/src/screens/branch_locations_screen.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class BranchLocationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchLocationsBloc, BranchLocationsState>(
      builder: (context, state) {
        if (state is BranchLocationsLoading ||
            state is BranchLocationsUninitialized)
          return Scaffold(body: LoadingIndicator());
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
        return Container();
      },
    );
  }
}
