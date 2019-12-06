/*
*   Filename    :   mass_request_page.dart
*   Purpose     :
*   Created     :   21/11/2019 10:10 AM by Detective Conan
*   Updated     :   21/11/2019 10:10 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/mass_request_bloc/mass_request_bloc.dart';
import 'package:mt_carmel_app/src/blocs/mass_request_bloc/mass_request_event.dart';
import 'package:mt_carmel_app/src/blocs/mass_request_bloc/mass_request_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/mass_request_screens/mass_request_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class MassRequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: BlocBuilder<MassRequestBloc, MassRequestState>(
            builder: (context, state) {
              if (state is MassRequestLoading ||
                  state is MassRequestUninitialized)
                return Scaffold(body: LoadingIndicator());
              if (state is MassRequestLoaded) {
                return MassRequestScreen();
              }
              if (state is MassRequestError) {
                return _errorDisplay(context);
              }
              if (state is NoMassRequestLoaded) {
                return _errorDisplay(context,
                    errorMsg: "No MassRequest Loaded", buttonLabel: "Reload");
              }
              if (state is MassRequestNoConnection) {
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
//    final String id = Provider.of<String>(context);
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
                    BlocProvider.of<MassRequestBloc>(context)
                        .dispatch(FetchMassRequest());
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
