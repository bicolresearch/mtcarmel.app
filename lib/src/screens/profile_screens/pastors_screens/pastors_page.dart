/*
*   Filename    :   priests_page.dart
*   Purpose     :
*   Created     :   17/09/2019 3:21 PM by Detective Conan
*   Updated     :   17/09/2019 3:21 PM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/pastors_bloc/pastors_bloc.dart';
import 'package:mt_carmel_app/src/blocs/pastors_bloc/pastors_state.dart';
import 'package:mt_carmel_app/src/blocs/priests_bloc/priests_bloc.dart';
import 'package:mt_carmel_app/src/blocs/priests_bloc/priests_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/pastors_screens/pastors_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/priests_screens/priests_screen.dart';
import 'package:mt_carmel_app/src/widgets/error_message.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class PastorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<PastorsBloc, PastorsState>(
              builder: (context, state) {
                if (state is PastorsLoading || state is PastorsUninitialized)
                  return Scaffold(body: LoadingIndicator());
                if (state is PastorsLoaded) {
                  return PastorsScreen();
                }
                if (state is PastorsError) {
                  return Scaffold(
                      body: ErrorMessage.errMsg(errorMessage: "Something went wrong"));
                }
                if (state is NoPastorsLoaded) {
                  return Scaffold(
                      body: ErrorMessage.errMsg(errorMessage: "No pastors loaded"));
                }
                return Scaffold();
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
