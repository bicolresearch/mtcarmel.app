/*
*   Filename    :   start_page.dart
*   Purpose     :
*   Created     :   09/09/2019 10:53 AM by Detective Conan
*   Updated     :   09/09/2019 10:53 AM by Detective Conan
*   Changes     :   
*/


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_state.dart';
import 'package:mt_carmel_app/src/screens/branch_selection_screen.dart';
import 'package:mt_carmel_app/src/screens/splash_screen.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchSelectionBloc, BranchSelectionState>(
    builder: (context, state) {
      if(state is BranchSelectionLoading){
        return SplashScreen();
      }
      if(state is BranchSelectionLoaded){
        return BranchSelectionScreen();
      }
      if(state is BranchSelectionError){

      }
      return Container();
    });
  }
}
