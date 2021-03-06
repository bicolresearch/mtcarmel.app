/*
*   Filename    :   first_communion_page.dart
*   Purpose     :
*   Created     :   22/11/2019 9:54 AM by Detective Conan
*   Updated     :   22/11/2019 9:54 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/first_communion_bloc/first_communion_bloc.dart';
import 'package:mt_carmel_app/src/blocs/first_communion_bloc/first_communion_event.dart';
import 'package:mt_carmel_app/src/blocs/first_communion_bloc/first_communion_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/first_communion_screens/first_communion_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class FirstCommunionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: BlocBuilder<FirstCommunionBloc, FirstCommunionState>(
            builder: (context, state) {
              if (state is FirstCommunionLoading ||
                  state is FirstCommunionUninitialized)
                return Scaffold(body: LoadingIndicator());
              if (state is FirstCommunionLoaded) {
                return FirstCommunionScreen();
              }
              if (state is FirstCommunionError) {
                return _errorDisplay(context);
              }
              if (state is NoFirstCommunionLoaded) {
                return _errorDisplay(context,
                    errorMsg: "No FirstCommunion Loaded");
              }
              if (state is FirstCommunionNoConnection) {
                return _errorDisplay(context,
                    errorMsg: "No Connection", buttonLabel: "Reload");
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
                    BlocProvider.of<FirstCommunionBloc>(context)
                        .dispatch(FetchFirstCommunion());
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
