/*
*   Filename    :   branch_selection_screen.dart
*   Purpose     :
*   Created     :   09/09/2019 11:08 AM by Detective Conan
*	 Updated			:   20/09/2019 4:52 PM PM by Detective Conan
*	 Changes			:   Changed the font and alignment of title.

 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_bloc.dart';

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/shared_preference_helper.dart';

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
              "${AppConstants.CARMELITE_MONASTERY} branches",
              style: Theme.of(context)
                  .primaryTextTheme
                  .title
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
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

                            await SharedPreferencesHelper.setBranchIdFlag(
                                branch.id);
                            await SharedPreferencesHelper.setBranchNameFlag(
                                branch.name);

                            Navigator.pop(context, branchSelection[index].id);
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
                            height: 120.0,
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
}
