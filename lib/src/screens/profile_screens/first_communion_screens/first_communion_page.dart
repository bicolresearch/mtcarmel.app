/*
*   Filename    :   first_communion_page.dart
*   Purpose     :
*   Created     :   22/11/2019 9:54 AM by Detective Conan
*   Updated     :   22/11/2019 9:54 AM by Detective Conan
*   Changes     :   
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/first_communion_bloc/first_communion_bloc.dart';
import 'package:mt_carmel_app/src/blocs/first_communion_bloc/first_communion_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/first_communion_screens/first_communion_screen.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class FirstCommunionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirstCommunionBloc, FirstCommunionState>(
      builder: (context, state) {
        if(state is FirstCommunionLoading || state is FirstCommunionUninitialized)
          return Scaffold(body: LoadingIndicator());
        if(state is FirstCommunionLoaded){
          return FirstCommunionScreen();
        }
        if(state is FirstCommunionError)
          {
            return Scaffold(body: Text("Something went wrong"));
          }
        if(state is NoFirstCommunionLoaded)
          {
            return Scaffold(body: Text("No FirstCommunion Loaded"));
          }
        return Container();
      },
    );
  }
}