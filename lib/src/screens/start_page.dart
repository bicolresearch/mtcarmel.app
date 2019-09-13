/*
*   Filename    :   start_page.dart
*   Purpose     :
*   Created     :   09/09/2019 10:53 AM by Detective Conan
*	 Updated			:   09/09/2019 4:24 PM PM by Detective Conan
*	 Changes			:   Directly call the home page instead of branch_page_route.
*	                    Used provider.of instead of introduce provider inside of this class
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_event.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_state.dart';
import 'package:mt_carmel_app/src/screens/branch_selection_screen.dart';
import 'package:mt_carmel_app/src/screens/home_screen.dart';
import 'package:mt_carmel_app/src/screens/introduction_screen.dart';
import 'package:mt_carmel_app/src/screens/splash_screen.dart';
import 'package:mt_carmel_app/src/widgets/error_message.dart';
import 'package:provider/provider.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchSelectionBloc, BranchSelectionState>(
        builder: (context, state) {
      if (state is BranchSelectionLoading) {
        return SplashScreen();
      }
      if (state is BranchSelectionLoaded) {
        return BranchSelectionScreen();
      }
      if (state is BranchSelectionError) {
        ErrorMessage.errMsg(errorMessage: "Something went wrong!");
      }
      if (state is BranchSelectionSelected) {
        final sectionBloc = Provider.of<BranchSelectionBloc>(context);
        if (sectionBloc.isFirstUsage) {
          return IntroScreen();
        }
        final branchId = sectionBloc.selectedBranch.branchId;
        Provider.of<BranchBloc>(context).dispatch(GetBranch(branchId));
        return HomeScreen();
      }
      return Scaffold();
    });
  }
}
