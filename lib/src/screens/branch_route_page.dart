/*
*   Filename    :   branch_route_page.dart
*   Purpose     :
*   Created     :   09/09/2019 3:29 PM by Detective Conan
*   Updated     :   09/09/2019 3:29 PM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_event.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_bloc.dart';
import 'package:mt_carmel_app/src/screens/home_screen.dart';
import 'package:provider/provider.dart';

class BranchRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selectedBranch =
        Provider.of<BranchSelectionBloc>(context).selectedBranch;
    return BlocProvider(
      builder: (builder) =>
          BranchBloc()..dispatch(GetBranch(selectedBranch.branchId)),
      child: HomeScreen(),
    );
  }
}
