/*
*   Filename    :   prayer_request_page.dart
*   Purpose     :
*   Created     :   19/11/2019 2:56 PM by Detective Conan
*   Updated     :   19/11/2019 2:56 PM by Detective Conan
*   Changes     :
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/prayer_request_bloc/prayer_request_bloc.dart';
import 'package:mt_carmel_app/src/blocs/prayer_request_bloc/prayer_request_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/prayer_request_screens/prayer_request_screen.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class PrayerRequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerRequestBloc, PrayerRequestState>(
      builder: (context, state) {
        if(state is PrayerRequestLoading || state is PrayerRequestUninitialized)
          return Scaffold(body: LoadingIndicator());
        if(state is PrayerRequestLoaded){
          return PrayerRequestScreen();
        }
        if(state is PrayerRequestError)
          {
            return Scaffold(body: Text("Something went wrong"));
          }
        if(state is NoPrayerRequestLoaded)
          {
            return Scaffold(body: Text("No PrayerRequest Loaded"));
          }
        return Container();
      },
    );
  }
}