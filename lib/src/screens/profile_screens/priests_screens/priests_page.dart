/*
*   Filename    :   priests_page.dart
*   Purpose     :
*   Created     :   17/09/2019 3:21 PM by Detective Conan
*	 Updated			:   19/09/2019 10:27 AM PM by Detective Conan
*	 Changes			:   Added retry and reload buttons
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/priests_bloc/priests_bloc.dart';
import 'package:mt_carmel_app/src/blocs/priests_bloc/priests_event.dart';
import 'package:mt_carmel_app/src/blocs/priests_bloc/priests_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/priests_screens/priests_screen.dart';
import 'package:mt_carmel_app/src/widgets/error_message.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class PriestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<PriestsBloc, PriestsState>(
              builder: (context, state) {
                if (state is PriestsLoading || state is PriestsUninitialized)
                  return Scaffold(body: LoadingIndicator());
                if (state is PriestsLoaded) {
                  return PriestsScreen();
                }
                if (state is PriestsError) {
                  return Scaffold(
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(child: Text("Something went wrong!")),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: Colors.brown,
                          child: Text(
                            "Reload",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            BlocProvider.of<PriestsBloc>(context)
                                .dispatch(FetchPriests());
                          },
                        ),
                      ],
                    ),
                  );
                }
                if (state is NoPriestsLoaded) {
                  return Scaffold(
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(child: Text("No priests listed.")),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: Colors.brown,
                          child: Text(
                            "Reload",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            BlocProvider.of<PriestsBloc>(context)
                                .dispatch(FetchPriests());
                          },
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: leftArrowBackButton(context: context),
          ),
        ],
      ),
    );
  }
}
