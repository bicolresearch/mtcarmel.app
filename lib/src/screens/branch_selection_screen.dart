/*
*   Filename    :   branch_selection_screen.dart
*   Purpose     :
*   Created     :   09/09/2019 11:08 AM by Detective Conan
*	 Updated			:   09/09/2019 5:01 PM PM by Detective Conan
*	 Changes			:   Added check if first usage. Navigate to IntroScreen if first usage.
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_event.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_event.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';

import 'package:provider/provider.dart';

import 'home_screen.dart';
import 'introduction_screen.dart';

class BranchSelectionScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final branchSelectionBloc = Provider.of<BranchSelectionBloc>(context);
    final branchSelection = branchSelectionBloc.branchSelection;
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Select church",
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Divider(),
            Expanded(
              child: Container(
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  shrinkWrap: true,
                  itemCount: branchSelection?.length,
                  itemBuilder: (context, index) {
                    try {
                      return InkWell(
                        onTap: () async {
                          try {
                            final branch = await locator<BranchService>()
                                .getBranch("${branchSelection[index].id}");

                            branchSelectionBloc
                                .dispatch(SaveSelectedBranch(branch));

                            _navigateToHome(context, branch.id);
                          } catch (e) {
                            print(e);
                            _scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Something went wrong!',
                                  textAlign: TextAlign.center,
                                ),
                                duration: Duration(seconds: 3),
                              ),
                            );
                          }
                        },
                        child: Text(
                          "${branchSelection[index].name}",
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
              ),
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
          final selectionBloc = Provider.of<BranchSelectionBloc>(context);
          if (selectionBloc.isFirstUsage) {
            return IntroScreen();
          }
          Provider.of<BranchBloc>(context).dispatch(GetBranch(branchId));
          return HomeScreen();
        },
      ),
    );
  }
}
