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
import 'package:mt_carmel_app/src/blocs/prayer_request_bloc/prayer_request_event.dart';
import 'package:mt_carmel_app/src/blocs/prayer_request_bloc/prayer_request_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/prayer_request_screens/prayer_request_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class PrayerRequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final id = Provider.of<String>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: BlocBuilder<PrayerRequestBloc, PrayerRequestState>(
            builder: (context, state) {
              if (state is PrayerRequestLoading ||
                  state is PrayerRequestUninitialized)
                return Scaffold(body: LoadingIndicator());
              if (state is PrayerRequestLoaded) {
                return PrayerRequestScreen();
              }
              if (state is PrayerRequestError) {
                return _errorDisplay(context);
              }
              if (state is NoPrayerRequestLoaded) {
                return _errorDisplay(context,
                    errorMsg: "No PrayerRequest Loaded", buttonLabel: "Reload");
              }
              if (state is PrayerRequestNoConnection) {
                return _errorDisplay(context, errorMsg: "No Connection");
              }
              return Container();
            },
          )),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: leftArrowBackButton(context: context),
          ),
        ],
      ),
    );
  }

  Widget _errorDisplay(BuildContext context,
      {String errorMsg = "Something went wrong!",
      String buttonLabel = "Retry"}) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(child: Text("$errorMsg")),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.brown,
                  child: Text(
                    "$buttonLabel",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    BlocProvider.of<PrayerRequestBloc>(context)
                        .dispatch(FetchPrayerRequest());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
