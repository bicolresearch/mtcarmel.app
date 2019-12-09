/*
*   Filename    :   application_page.dart
*   Purpose     :
*   Created     :   09/12/2019 10:23 AM by Detective Conan
*   Updated     :   09/12/2019 10:23 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/application_bloc/application_bloc.dart';
import 'package:mt_carmel_app/src/blocs/application_bloc/application_event.dart';
import 'package:mt_carmel_app/src/blocs/application_bloc/application_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/application_screens/application_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class ApplicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<ApplicationBloc, ApplicationState>(
          builder: (context, state) {
            if(state is ApplicationLoading || state is ApplicationUninitialized)
              return Scaffold(body: LoadingIndicator());
            if(state is ApplicationLoaded){
              return ApplicationScreen();
            }
            if(state is ApplicationError)
              {
                return _errorDisplay(context);
              }
            if(state is NoApplicationLoaded)
              {
                return _errorDisplay(context, errorMsg: "No Application Loaded",
                    buttonLabel: "Reload");
              }
            if(state is ApplicationNoConnection)
              {
                return _errorDisplay(context, errorMsg: "No Connection");
              }
            return Container();
          },
      )
    ),
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
                    BlocProvider.of<ApplicationBloc>(context)
                        .dispatch(FetchApplication());
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
