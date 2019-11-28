/*
*   Filename    :   marriage_page.dart
*   Purpose     :
*   Created     :   28/11/2019 8:35 AM by Detective Conan
*   Updated     :   28/11/2019 8:35 AM by Detective Conan
*   Changes     :   
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/marriage_bloc/marriage_bloc.dart';
import 'package:mt_carmel_app/src/blocs/marriage_bloc/marriage_event.dart';
import 'package:mt_carmel_app/src/blocs/marriage_bloc/marriage_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/marriage_screens/marriage_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class MarriagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: BlocBuilder<MarriageBloc, MarriageState>(
            builder: (context, state) {
              if (state is MarriageLoading || state is MarriageUninitialized)
                return Scaffold(body: LoadingIndicator());
              if (state is MarriageLoaded) {
                return MarriageScreen();
              }
              if (state is MarriageError) {
                return _errorDisplay(context);
              }
              if (state is NoMarriageLoaded) {
                return _errorDisplay(context, errorMsg: "No Marriage Loaded");
              }
              if (state is MarriageNoConnection) {
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
                    BlocProvider.of<MarriageBloc>(context)
                        .dispatch(FetchMarriage());
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
