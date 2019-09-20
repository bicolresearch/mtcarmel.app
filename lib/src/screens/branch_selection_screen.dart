/*
*   Filename    :   branch_selection_screen.dart
*   Purpose     :
*   Created     :   09/09/2019 11:08 AM by Detective Conan
*	 Updated			:   20/09/2019 9:03 AM PM by Detective Conan
*	 Changes			:   Centered the branch name. Added Church order name.
* */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_event.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_event.dart';
import 'package:mt_carmel_app/src/blocs/tab_bloc/tab_bloc.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';

import 'package:provider/provider.dart';

import 'home_screen.dart';

class BranchSelectionScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final branchSelectionBloc = BlocProvider.of<BranchSelectionBloc>(context);
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
            Image.asset(AppConstants.MT_CARMEL_LOGO_PATH, height: 60),
            Text(
              "Carmel branches",
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Divider(),
            Expanded(
              child: Container(
                child: ListView.builder(
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
                        child: Card(
                          child: Container(
                            alignment: Alignment.center,
                            height: 100.0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(
                                  "${branchSelection[index].name}",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .subhead
                                      .copyWith(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                subtitle: Text(
                                  "(${branchSelection[index].churchOrderName})",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .subhead,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
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
          return MultiBlocProvider(providers: [
            BlocProvider<BranchBloc>(
              builder: (context) => BranchBloc()..dispatch(GetBranch(branchId)),
            ),
            BlocProvider<TabBloc>(
              builder: (context) => TabBloc(),
            )
          ], child: HomeScreen());
        },
      ),
    );
  }
}
