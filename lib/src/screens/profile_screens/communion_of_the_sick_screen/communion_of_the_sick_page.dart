/*
*   Filename    :   communion_of_the_sick_page.dart
*   Purpose     :
*   Created     :   22/11/2019 9:59 AM by Detective Conan
*   Updated     :   22/11/2019 9:59 AM by Detective Conan
*   Changes     :   
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/communion_of_the_sick_bloc/communion_of_the_sick_bloc.dart';
import 'package:mt_carmel_app/src/blocs/communion_of_the_sick_bloc/communion_of_the_sick_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/communion_of_the_sick_screen/communion_of_the_sick_screen.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class CommunionOfTheSickPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunionOfTheSickBloc, CommunionOfTheSickState>(
      builder: (context, state) {
        if(state is CommunionOfTheSickLoading || state is CommunionOfTheSickUninitialized)
          return Scaffold(body: LoadingIndicator());
        if(state is CommunionOfTheSickLoaded){
          return CommunionOfTheSickScreen();
        }
        if(state is CommunionOfTheSickError)
          {
            return Scaffold(body: Text("Something went wrong"));
          }
        if(state is NoCommunionOfTheSickLoaded)
          {
            return Scaffold(body: Text("No CommunionOfTheSick Loaded"));
          }
        return Container();
      },
    );
  }
}