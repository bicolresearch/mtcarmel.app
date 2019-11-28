/*
*   Filename    :   funeral_chapel_page.dart
*   Purpose     :
*   Created     :   28/11/2019 10:23 AM by Detective Conan
*   Updated     :   28/11/2019 10:23 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/funeral_chapel_bloc/funeral_chapel_bloc.dart';
import 'package:mt_carmel_app/src/blocs/funeral_chapel_bloc/funeral_chapel_event.dart';
import 'package:mt_carmel_app/src/blocs/funeral_chapel_bloc/funeral_chapel_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/funeral_chapel_screens/funeral_chapel_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class FuneralChapelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<FuneralChapelBloc, FuneralChapelState>(
          builder: (context, state) {
            if(state is FuneralChapelLoading || state is FuneralChapelUninitialized)
              return Scaffold(body: LoadingIndicator());
            if(state is FuneralChapelLoaded){
              return FuneralChapelScreen();
            }
            if(state is FuneralChapelError)
              {
                return _errorDisplay(context);
              }
            if(state is NoFuneralChapelLoaded)
              {
                return _errorDisplay(context, errorMsg: "No FuneralChapel Loaded",
                    buttonLabel: "Reload");
              }
            if(state is FuneralChapelNoConnection)
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
                    BlocProvider.of<FuneralChapelBloc>(context)
                        .dispatch(FetchFuneralChapel());
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
