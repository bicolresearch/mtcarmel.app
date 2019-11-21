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
import 'package:mt_carmel_app/src/blocs/mass_request_bloc/mass_request_state.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

import 'mass_request_screen.dart';

class MassRequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MassRequestBloc, MassRequestState>(
      builder: (context, state) {
        if(state is MassRequestLoading || state is MassRequestUninitialized)
          return Scaffold(body: LoadingIndicator());
        if(state is MassRequestLoaded){
          return MassRequestScreen();
        }
        if(state is MassRequestError)
          {
            return Scaffold(body: Text("Something went wrong"));
          }
        if(state is NoMassRequestLoaded)
          {
            return Scaffold(body: Text("No MassRequest Loaded"));
          }
        return Container();
      },
    );
  }
}