/*
*   Filename    :   priests_page.dart
*   Purpose     :
*	 Updated			:   28/11/2019 9:29 AM PM by Detective Conan
*	 Changes			:   Added errorDisplay method.
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/pastors_bloc/pastors_bloc.dart';
import 'package:mt_carmel_app/src/blocs/pastors_bloc/pastors_event.dart';
import 'package:mt_carmel_app/src/blocs/pastors_bloc/pastors_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/pastors_screens/pastors_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class PastorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: BlocBuilder<PastorsBloc, PastorsState>(
            builder: (context, state) {
              if (state is PastorsLoading || state is PastorsUninitialized)
                return Scaffold(body: LoadingIndicator());
              if (state is PastorsLoaded) {
                return PastorsScreen();
              }
              if (state is PastorsError) {
                return _errorDisplay(context);
              }
              if (state is NoPastorsLoaded) {
                return _errorDisplay(context,
                    errorMsg: "No Pastors Loaded", buttonLabel: "Reload");
              }
              if (state is PastorsNoConnection) {
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
                    BlocProvider.of<PastorsBloc>(context)
                        .dispatch(FetchPastors());
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
