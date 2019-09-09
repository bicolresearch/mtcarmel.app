/*
*   Filename    :   branch_selection_screen.dart
*   Purpose     :
*   Created     :   09/09/2019 11:08 AM by Detective Conan
*   Updated     :   09/09/2019 11:08 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_event.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_event.dart';
import 'package:mt_carmel_app/src/models/branch_selection.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class BranchSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final branchSelectionBloc = Provider.of<BranchSelectionBloc>(context);
    final branchSelection = branchSelectionBloc.branchSelection;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Choose church",
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Divider(),
            ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              shrinkWrap: true,
              itemCount: branchSelection?.length,
              itemBuilder: (context, index) {
                try {
                  return InkWell(
                    onTap: () {
                       branchSelectionBloc.dispatch(SaveSelectedBranch(branchSelection[index]));
                      _navigateToHome(context, branchSelection[index].branchId);
                    },
                    child: Text(
                      "${branchSelection[index].branchName}",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .title
                          .copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  );
                } catch (e) {
                  debugPrint(e.toString());
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToHome(context, branchId) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return BlocProvider(
            builder: (builder) => BranchBloc()
              ..dispatch(
                  GetBranch(branchId)),
            child: HomeScreen(),
          );
        },
      ),
    );
  }
}
