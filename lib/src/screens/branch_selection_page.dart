/*
*   Filename    :   branch_selection_page.dart
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
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class BranchSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
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
                    body: ErrorMessage.errMsg(
                        errorMessage: "Something went wrong!"));
              }
              if (state is BranchSelectionNoBranchFetched) {
                return Scaffold(
                  body: Text("No branches for ${state.branchLocation.name}."),
                );
              }
              return Scaffold();
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: leftArrowBackButton(context: context),
          )
        ],
      ),
    );
  }
}
