/*
*   Filename    :   adult_baptism_page.dart
*   Purpose     :
*   Created     :   22/11/2019 9:42 AM by Detective Conan
*   Updated     :   22/11/2019 9:42 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/adult_baptism_bloc/adult_baptism_bloc.dart';
import 'package:mt_carmel_app/src/blocs/adult_baptism_bloc/adult_baptism_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/adult_baptism_screens/adult_baptism_screen.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class AdultBaptismPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdultBaptismBloc, AdultBaptismState>(
      builder: (context, state) {
        if(state is AdultBaptismLoading || state is AdultBaptismUninitialized)
          return Scaffold(body: LoadingIndicator());
        if(state is AdultBaptismLoaded){
          return AdultBaptismScreen();
        }
        if(state is AdultBaptismError)
          {
            return Scaffold(body: Text("Something went wrong"));
          }
        if(state is NoAdultBaptismLoaded)
          {
            return Scaffold(body: Text("No AdultBaptism Loaded"));
          }
        return Container();
      },
    );
  }
}