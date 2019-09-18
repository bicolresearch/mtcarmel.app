/*
*   Filename    :   location_map_page.dart
*   Purpose     :
*   Created     :   18/09/2019 9:14 AM by Detective Conan
*   Updated     :   18/09/2019 9:14 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/location_map_bloc/location_map_bloc.dart';
import 'package:mt_carmel_app/src/blocs/location_map_bloc/location_map_state.dart';
import 'package:mt_carmel_app/src/models/location_map.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/location_screens/location_map_screen.dart';
import 'package:mt_carmel_app/src/widgets/error_message.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class LocationMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationMapBloc, LocationMapState>(
      builder: (context, state) {
        if (state is LocationMapLoading || state is LocationMapUninitialized)
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
              body: ErrorMessage.errMsg(errorMessage: "Something went wrong"));
        }
        if (state is NoLocationMapLoaded) {
          return Scaffold(
              body: ErrorMessage.errMsg(errorMessage: "No LocationMap Loaded"));
        }
        return Container();
      },
    );
  }
}
