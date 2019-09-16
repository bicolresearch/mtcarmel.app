/*
*  Filename    :   main.dart
*  Purpose     :   Entry point of app.
*  Created     :   2019-07-12 16:44 by Detective Conan
*	 Updated			:   09/09/2019 12:46 PM PM by Detective Conan
*	 Changes			:   Route to StartPage instead to Page.
*/

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_event.dart';
import 'package:mt_carmel_app/src/blocs/concrete_bloc_delegate.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/screens/start_page.dart';
import 'package:mt_carmel_app/src/widgets/app_theme_data.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  setupLocator();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => initializeDateFormatting().then(
      (__) => runApp(
        MtCarmelApp(),
      ),
    ),
  );
}

class MtCarmelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocSupervisor.delegate = ConcreteBlocDelegate();
    return MultiBlocProvider(
      providers: [
        BlocProvider<BranchSelectionBloc>(
          builder: (context) =>
              BranchSelectionBloc()..dispatch(BranchSelectionFetch()),
        ),
        BlocProvider<BranchBloc>(
          builder: (context) => BranchBloc(),
        )
      ],
      child: MaterialApp(
        title: AppConstants.APP_TITLE,
        debugShowCheckedModeBanner: false,
        theme: appThemeData(context),
        home: StartPage(),
      ),
    );
  }
}

