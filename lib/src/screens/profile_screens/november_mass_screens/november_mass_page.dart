/*
*   Filename    :   november_mass_page.dart
*   Purpose     :
*   Created     :   28/11/2019 10:32 AM by Detective Conan
*   Updated     :   28/11/2019 10:32 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/november_mass_bloc/november_mass_bloc.dart';
import 'package:mt_carmel_app/src/blocs/november_mass_bloc/november_mass_event.dart';
import 'package:mt_carmel_app/src/blocs/november_mass_bloc/november_mass_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/november_mass_screens/november_mass_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class NovemberMassPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<NovemberMassBloc, NovemberMassState>(
          builder: (context, state) {
            if(state is NovemberMassLoading || state is NovemberMassUninitialized)
              return Scaffold(body: LoadingIndicator());
            if(state is NovemberMassLoaded){
              return NovemberMassScreen();
            }
            if(state is NovemberMassError)
              {
                return _errorDisplay(context);
              }
            if(state is NoNovemberMassLoaded)
              {
                return _errorDisplay(context, errorMsg: "No NovemberMass Loaded",
                    buttonLabel: "Reload");
              }
            if(state is NovemberMassNoConnection)
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
                    BlocProvider.of<NovemberMassBloc>(context)
                        .dispatch(FetchNovemberMass());
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
