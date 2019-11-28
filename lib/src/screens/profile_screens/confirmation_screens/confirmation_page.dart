/*
*   Filename    :   confirmation_page.dart
*   Purpose     :
*   Created     :   22/11/2019 10:06 AM by Detective Conan
*   Updated     :   22/11/2019 10:06 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/confiramtion_bloc/confirmation_bloc.dart';
import 'package:mt_carmel_app/src/blocs/confiramtion_bloc/confirmation_event.dart';
import 'package:mt_carmel_app/src/blocs/confiramtion_bloc/confirmation_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/confirmation_screens/confirmation_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class ConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: BlocBuilder<ConfirmationBloc, ConfirmationState>(
            builder: (context, state) {
              if (state is ConfirmationLoading ||
                  state is ConfirmationUninitialized)
                return Scaffold(body: LoadingIndicator());
              if (state is ConfirmationLoaded) {
                return ConfirmationScreen();
              }
              if (state is ConfirmationError) {
                return _errorDisplay(context);
              }
              if (state is NoConfirmationLoaded) {
                return _errorDisplay(context,
                    errorMsg: "No Confirmation Loaded");
              }
              if (state is ConfirmationNoConnection) {
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
                    BlocProvider.of<ConfirmationBloc>(context)
                        .dispatch(FetchConfirmation());
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
