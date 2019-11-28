/*
*   Filename    :   adult_baptism_page.dart
*   Purpose     :
*   Created     :   22/11/2019 9:42 AM by Detective Conan
*	 Updated			:   28/11/2019 9:51 AM PM by Detective Conan
*	 Changes			:   Added errorDisplay method
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/adult_baptism_bloc/adult_baptism_bloc.dart';
import 'package:mt_carmel_app/src/blocs/adult_baptism_bloc/adult_baptism_event.dart';
import 'package:mt_carmel_app/src/blocs/adult_baptism_bloc/adult_baptism_state.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

import 'adult_baptism_screen.dart';

class AdultBaptismPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: BlocBuilder<AdultBaptismBloc, AdultBaptismState>(
            builder: (context, state) {
              if (state is AdultBaptismLoading ||
                  state is AdultBaptismUninitialized)
                return Scaffold(body: LoadingIndicator());
              if (state is AdultBaptismLoaded) {
                return AdultBaptismScreen();
              }
              if (state is AdultBaptismError) {
                return _errorDisplay(context);
              }
              if (state is NoAdultBaptismLoaded) {
                return _errorDisplay(context,
                    errorMsg: "No AdultBaptism Loaded");
              }
              if (state is AdultBaptismNoConnection) {
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
                    BlocProvider.of<AdultBaptismBloc>(context)
                        .dispatch(FetchAdultBaptism());
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
