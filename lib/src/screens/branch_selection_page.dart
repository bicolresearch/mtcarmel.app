/*
*   Filename    :   branch_selection_page.dart
*   Purpose     :
*   Created     :   16/09/2019 5:00 PM by Detective Conan
*   Updated     :   16/09/2019 5:00 PM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_event.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_state.dart';
import 'package:mt_carmel_app/src/screens/branch_selection_screen.dart';
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
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(child: Text("Something went wrong")),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        color: Colors.brown,
                        child: Text(
                          "Retry",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          BlocProvider.of<BranchSelectionBloc>(context)
                              .dispatch(BranchSelectionFetchByLocation(
                              state.branchLocation));
                        },
                      ),
                    ],
                  ),
                );
              }
              if (state is BranchSelectionNoBranchFetched) {
                return Scaffold(
                  body: Text("No branches for ${state.branchLocation.name}."),
                );
              }
              if (state is BranchSelectionNoConnection) {
                return Scaffold(
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(child: Text("No connection.")),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        color: Colors.brown,
                        child: Text(
                          "Retry",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          BlocProvider.of<BranchSelectionBloc>(context)
                              .dispatch(BranchSelectionFetchByLocation(
                                  state.branchLocation));
                        },
                      ),
                    ],
                  ),
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
