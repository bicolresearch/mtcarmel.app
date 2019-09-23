/*
*   Filename    :   branch_locations_screen.dart
*   Purpose     :
*   Created     :   19/09/2019 5:34 PM by Detective Conan
*	 Updated			:   20/09/2019 4:51 PM PM by Detective Conan
*	 Changes			:   Changed the font and alignment of title.
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_event.dart';
import 'package:mt_carmel_app/src/blocs/branch_locations_bloc/branch_locations_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_event.dart';
import 'package:mt_carmel_app/src/blocs/tab_bloc/tab.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/screens/branch_selection_page.dart';
import 'package:mt_carmel_app/src/screens/home_screen.dart';

class BranchLocationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final branchLocationsBloc = BlocProvider.of<BranchLocationsBloc>(context);
    final branchLocations = branchLocationsBloc.branchLocations;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Image.asset(AppConstants.MT_CARMEL_LOGO_PATH, height: 60),
            Text(
              "${AppConstants.CARMELITE_MONASTERY} Locations",
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
                  itemCount: branchLocations?.length,
                  itemBuilder: (context, index) {
                    try {
                      return InkWell(
                        onTap: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return BlocProvider<BranchSelectionBloc>(
                                    builder: (context) => BranchSelectionBloc()
                                      ..dispatch(
                                          BranchSelectionFetchByLocation(
                                              branchLocations[index])),
                                    child: BranchSelectionPage());
                              },
                            ),
                          );

                          if (result.runtimeType == String) {
                            _navigateToHome(context, result);
                          }
                        },
                        child: Card(
                          child: Container(
                            alignment: Alignment.center,
                            height: 80.0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${branchLocations[index].name}",
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .title
                                    .copyWith(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
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
