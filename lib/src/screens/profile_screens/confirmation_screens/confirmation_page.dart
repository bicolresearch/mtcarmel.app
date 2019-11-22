/*
*   Filename    :   confirmation_page.dart
*   Purpose     :
*   Created     :   22/11/2019 10:06 AM by Detective Conan
*   Updated     :   22/11/2019 10:06 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/confiramtion_bloc/confirmation_bloc.dart';
import 'package:mt_carmel_app/src/blocs/confiramtion_bloc/confirmation_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/confirmation_screens/confirmation_screen.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class ConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfirmationBloc, ConfirmationState>(
      builder: (context, state) {
        if(state is ConfirmationLoading || state is ConfirmationUninitialized)
          return Scaffold(body: LoadingIndicator());
        if(state is ConfirmationLoaded){
          return ConfirmationScreen();
        }
        if(state is ConfirmationError)
          {
            return Scaffold(body: Text("Something went wrong"));
          }
        if(state is NoConfirmationLoaded)
          {
            return Scaffold(body: Text("No Confirmation Loaded"));
          }
        return Container();
      },
    );
  }
}