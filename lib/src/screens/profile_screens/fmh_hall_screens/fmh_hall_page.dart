/*
*   Filename    :   fmh_hall_page.dart
*   Purpose     :
*   Created     :   28/11/2019 10:38 AM by Detective Conan
*   Updated     :   28/11/2019 10:38 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/fmh_hall_bloc/fmh_hall_bloc.dart';
import 'package:mt_carmel_app/src/blocs/fmh_hall_bloc/fmh_hall_event.dart';
import 'package:mt_carmel_app/src/blocs/fmh_hall_bloc/fmh_hall_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/fmh_hall_screens/fmh_hall_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class FmhHallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: BlocBuilder<FmhHallBloc, FmhHallState>(
            builder: (context, state) {
              if (state is FmhHallLoading || state is FmhHallUninitialized)
                return Scaffold(body: LoadingIndicator());
              if (state is FmhHallLoaded) {
                return FmhHallScreen();
              }
              if (state is FmhHallError) {
                return _errorDisplay(context);
              }
              if (state is NoFmhHallLoaded) {
                return _errorDisplay(context,
                    errorMsg: "No FmhHall Loaded", buttonLabel: "Reload");
              }
              if (state is FmhHallNoConnection) {
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
                    BlocProvider.of<FmhHallBloc>(context)
                        .dispatch(FetchFmhHall());
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
