/*
*   Filename    :   communion_of_the_sick_page.dart
*   Purpose     :
*   Created     :   22/11/2019 9:59 AM by Detective Conan
*   Updated     :   22/11/2019 9:59 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/communion_of_the_sick_bloc/communion_of_the_sick_bloc.dart';
import 'package:mt_carmel_app/src/blocs/communion_of_the_sick_bloc/communion_of_the_sick_event.dart';
import 'package:mt_carmel_app/src/blocs/communion_of_the_sick_bloc/communion_of_the_sick_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/communion_of_the_sick_screen/communion_of_the_sick_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class CommunionOfTheSickPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child:
              BlocBuilder<CommunionOfTheSickBloc, CommunionOfTheSickState>(
            builder: (context, state) {
              if (state is CommunionOfTheSickLoading ||
                  state is CommunionOfTheSickUninitialized)
                return Scaffold(body: LoadingIndicator());
              if (state is CommunionOfTheSickLoaded) {
                return CommunionOfTheSickScreen();
              }
              if (state is CommunionOfTheSickError) {
                return _errorDisplay(context);
              }
              if (state is NoCommunionOfTheSickLoaded) {
                return _errorDisplay(context,
                    errorMsg: "No CommunionOfTheSick Loaded");
              }
              if (state is CommunionOfTheSickNoConnection) {
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
                    BlocProvider.of<CommunionOfTheSickBloc>(context)
                        .dispatch(FetchCommunionOfTheSick());
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
