/*
*   Filename    :   liturgical_page.dart
*   Purpose     :
*   Created     :   22/11/2019 9:01 AM by Detective Conan
*   Updated     :   22/11/2019 9:01 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/liturgical_bloc/liturgical_bloc.dart';
import 'package:mt_carmel_app/src/blocs/liturgical_bloc/liturgical_event.dart';
import 'package:mt_carmel_app/src/blocs/liturgical_bloc/liturgical_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/liturgical_screens/liturgical_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class LiturgicalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: BlocBuilder<LiturgicalBloc, LiturgicalState>(
            builder: (context, state) {
              if (state is LiturgicalLoading ||
                  state is LiturgicalUninitialized)
                return Scaffold(body: LoadingIndicator());
              if (state is LiturgicalLoaded) {
                return LiturgicalScreen();
              }
              if (state is LiturgicalError) {
                return _errorDisplay(context);
              }
              if (state is NoLiturgicalLoaded) {
                return _errorDisplay(context,
                    errorMsg: "No Liturgical Loaded", buttonLabel: "Reload");
              }
              if (state is LiturgicalNoConnection) {
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
                    BlocProvider.of<LiturgicalBloc>(context)
                        .dispatch(FetchLiturgical());
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
