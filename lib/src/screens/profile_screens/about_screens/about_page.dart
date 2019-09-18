/*
*   Filename    :   about_page.dart
*   Purpose     :
*   Created     :   18/09/2019 10:22 AM by Detective Conan
*   Updated     :   18/09/2019 10:22 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/about_bloc/about_bloc.dart';
import 'package:mt_carmel_app/src/blocs/about_bloc/about_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/about_screens/about_screen.dart';
import 'package:mt_carmel_app/src/widgets/error_message.dart';
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
                      body: ErrorMessage.errMsg(
                          errorMessage: "Something went wrong"));
                }
                if (state is NoAboutLoaded) {
                  return Scaffold(
                      body:
                          ErrorMessage.errMsg(errorMessage: "No About Loaded"));
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
