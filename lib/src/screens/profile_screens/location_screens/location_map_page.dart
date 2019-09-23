/*
*   Filename    :   location_map_page.dart
*   Purpose     :
*   Created     :   18/09/2019 9:14 AM by Detective Conan
*	 Updated			:   23/09/2019 1:47 PM PM by Detective Conan
*	 Changes			:   Added floating action button to all states.
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/location_map_bloc/location_map_bloc.dart';
import 'package:mt_carmel_app/src/blocs/location_map_bloc/location_map_event.dart';
import 'package:mt_carmel_app/src/blocs/location_map_bloc/location_map_state.dart';

import 'package:mt_carmel_app/src/screens/profile_screens/location_screens/location_map_screen.dart';

import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class LocationMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<LocationMapBloc, LocationMapState>(
              builder: (context, state) {
                if (state is LocationMapLoading ||
                    state is LocationMapUninitialized)
                  return Scaffold(
                      body: Column(
                    children: <Widget>[
                      Expanded(child: LoadingIndicator()),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: leftArrowBackButton(context: context),
                      )
                    ],
                  ));
                if (state is LocationMapLoaded) {
                  return LocationMapScreen();
                }
                if (state is LocationMapError) {
                  return Scaffold(
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(child: Text("Something went wrong!")),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: Colors.brown,
                          child: Text(
                            "Retry",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            BlocProvider.of<LocationMapBloc>(context)
                                .dispatch(FetchLocationMap());
                          },
                        ),
                      ],
                    ),
                  );
                }
                if (state is NoLocationMapLoaded) {
                  return Scaffold(
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(child: Text("No Location listed.")),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: Colors.brown,
                          child: Text(
                            "Reload",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            BlocProvider.of<LocationMapBloc>(context)
                                .dispatch(FetchLocationMap());
                          },
                        ),
                      ],
                    ),
                  );
                }
                if (state is LocationMapNoConnection) {
                  return Scaffold(
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(child: Text("No connection!")),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: Colors.brown,
                          child: Text(
                            "Retry",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            BlocProvider.of<LocationMapBloc>(context)
                                .dispatch(FetchLocationMap());
                          },
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
//          Padding(
//            padding: const EdgeInsets.only(bottom: 20.0),
//            child: leftArrowBackButton(context: context),
//          ),
        ],

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_arrow_left,
            size: 40.0,
            color: Colors.brown,
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
