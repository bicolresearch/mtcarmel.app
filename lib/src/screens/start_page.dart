/*
*   Filename    :   start_page.dart
*   Purpose     :
*   Created     :   17/09/2019 9:37 AM by Detective Conan
*   Updated     :   17/09/2019 9:37 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_event.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_event.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_state.dart';
import 'package:mt_carmel_app/src/blocs/tab_bloc/tab_bloc.dart';
import 'package:mt_carmel_app/src/screens/branch_selection_screen.dart';

import 'package:mt_carmel_app/src/screens/home_screen.dart';
import 'package:mt_carmel_app/src/widgets/error_message.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BranchSelectionBloc>(
      builder: (context) =>
          BranchSelectionBloc()..dispatch(BranchSelectionFetch()),
      child: BlocBuilder<BranchSelectionBloc, BranchSelectionState>(
          builder: (context, state) {
        if (state is BranchSelectionLoading) {
          return Scaffold(body: LoadingIndicator());
        }
        if (state is BranchSelectionLoaded) {
          return BranchSelectionScreen();
        }
        if (state is BranchSelectionError) {
          return Scaffold(
              body: ErrorMessage.errMsg(errorMessage: "Something went wrong!"));
        }
        if (state is BranchSelectionSelected) {
          final String branchId =
              BlocProvider.of<BranchSelectionBloc>(context).selectedBranch.id;
          return MultiBlocProvider(providers: [
            BlocProvider<BranchBloc>(
              builder: (context) => BranchBloc()..dispatch(GetBranch(branchId)),
            ),
            BlocProvider<TabBloc>(
              builder: (context) => TabBloc(),
            )
          ], child: HomeScreen());
        }
        return Scaffold();
      }),
    );
  }
}
