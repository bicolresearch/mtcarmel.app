/*
*   Filename    :   about_page.dart
*   Purpose     :
*   Created     :   18/09/2019 10:22 AM by Detective Conan
*	 Updated			:   19/09/2019 10:26 AM PM by Detective Conan
*	 Changes			:   Added retry and reload buttons
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/about_bloc/about_bloc.dart';
import 'package:mt_carmel_app/src/blocs/about_bloc/about_event.dart';
import 'package:mt_carmel_app/src/blocs/about_bloc/about_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/about_screens/about_screen.dart';

import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<AboutBloc, AboutState>(
              builder: (context, state) {
                if (state is AboutLoading || state is AboutUninitialized)
                  return Scaffold(body: LoadingIndicator());
                if (state is AboutLoaded) {
                  return AboutScreen();
                }
                if (state is AboutError) {
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
                            "Retry",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            BlocProvider.of<AboutBloc>(context)
                                .dispatch(FetchAbout());
                          },
                        ),
                      ],
                    ),
                  );
                }
                if (state is NoAboutLoaded) {
                  return Scaffold(
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(
                            child:
                                Text("No church description and histories.")),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: Colors.brown,
                          child: Text(
                            "Reload",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            BlocProvider.of<AboutBloc>(context)
                                .dispatch(FetchAbout());
                          },
                        ),
                      ],
                    ),
                  );
                }
                if (state is AboutNoConnection) {
                  return Scaffold(
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(
                            child:
                            Text("No connection.")),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: Colors.brown,
                          child: Text(
                            "Retry",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            BlocProvider.of<AboutBloc>(context)
                                .dispatch(FetchAbout());
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
          )
        ],
      ),
    );
  }
}
