/*
*   Filename    :   individual_baptism_page.dart
*   Purpose     :
*   Created     :   22/11/2019 9:18 AM by Detective Conan
*   Updated     :   22/11/2019 9:18 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/individual_baptism_bloc/individual_baptism_bloc.dart';
import 'package:mt_carmel_app/src/blocs/individual_baptism_bloc/individual_baptism_event.dart';
import 'package:mt_carmel_app/src/blocs/individual_baptism_bloc/individual_baptism_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/individual_baptism_screens/individual_baptism_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class IndividualBaptismPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final serviceName = Provider.of<String>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              child: BlocBuilder<IndividualBaptismBloc, IndividualBaptismState>(
            builder: (context, state) {
              if (state is IndividualBaptismLoading ||
                  state is IndividualBaptismUninitialized)
                return Scaffold(body: LoadingIndicator());
              if (state is IndividualBaptismLoaded) {
                return IndividualBaptismScreen();
              }
              if (state is IndividualBaptismError) {
                return _errorDisplay(context);
              }
              if (state is NoIndividualBaptismLoaded) {
                return _errorDisplay(context,
                    errorMsg: "No $serviceName",
                    buttonLabel: "Reload");
              }
              if (state is IndividualBaptismNoConnection) {
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
                    BlocProvider.of<IndividualBaptismBloc>(context)
                        .dispatch(FetchIndividualBaptism());
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
