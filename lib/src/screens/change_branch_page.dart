/*
*   Filename    :   change_branch_page.dart
*   Purpose     :
*   Created     :   16/09/2019 5:00 PM by Detective Conan
*   Updated     :   16/09/2019 5:00 PM by Detective Conan
*   Changes     :   
*/


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_event.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_event.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_state.dart';
import 'package:mt_carmel_app/src/screens/branch_selection_screen.dart';
import 'package:mt_carmel_app/src/screens/home_screen.dart';
import 'package:mt_carmel_app/src/screens/introduction_screen.dart';
import 'package:mt_carmel_app/src/screens/splash_screen.dart';
import 'package:mt_carmel_app/src/widgets/error_message.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class ChangeBranchPage extends StatelessWidget {
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
            return ErrorMessage.errMsg(errorMessage: "Something went wrong!");
          }
          if (state is BranchSelectionSelected) {
            final selectionBloc = Provider.of<BranchSelectionBloc>(context);
            if (selectionBloc.isFirstUsage) {
              return IntroScreen();
            }
            var branch;
            branch = selectionBloc.selectedBranch;
            if (branch == null) {
              selectionBloc.dispatch(BranchSelectionFetch());
              return Scaffold(body: LoadingIndicator());
            }
            Provider.of<BranchBloc>(context).dispatch(GetBranch(branch.id));
            return HomeScreen();
          }
          return Scaffold();
        });
  }
}
