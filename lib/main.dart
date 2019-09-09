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
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_event.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_selection_bloc/branch_selection_event.dart';
import 'package:mt_carmel_app/src/blocs/concrete_bloc_delegate.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/repositories/branches_repo.dart';
import 'package:mt_carmel_app/src/screens/branch_selection_screen.dart';
import 'package:mt_carmel_app/src/screens/home_screen.dart';
import 'package:mt_carmel_app/src/screens/start_page.dart';
import 'package:mt_carmel_app/src/screens/tab_selector.dart';
import 'package:mt_carmel_app/src/screens/edit_profile_screen.dart';
import 'package:mt_carmel_app/src/utils/development_production_enum.dart';
import 'package:mt_carmel_app/src/widgets/app_theme_data.dart';
import 'src/screens/splash_screen.dart';
import 'src/screens/introduction_screen.dart';
import 'package:mt_carmel_app/src/helpers/shared_preference_helper.dart';
import 'package:intl/date_symbol_data_local.dart';

final DevelopmentProductionEnum developmentProductionEnum =
//    DevelopmentProductionEnum.PartialTest;
    DevelopmentProductionEnum.Development;

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

class Page extends StatefulWidget {
  Page({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  bool isFirstUsage = true;

  @override
  Widget build(BuildContext context) {
    switch (developmentProductionEnum) {
      case DevelopmentProductionEnum.Development:
      // Fallthrough
      case DevelopmentProductionEnum.Production:
        return SplashScreen();
        break;
      case DevelopmentProductionEnum.Testing:
        // TODO: Handle this case.
        break;
      case DevelopmentProductionEnum.PartialTest:
        print("started partial test");
        // add widget to be test partially
        return EditProfileScreen();
        break;
    }
    return SplashScreen();
  }

  @override
  initState() {
    super.initState();
    getFirstUsageFlag();

    if (developmentProductionEnum != DevelopmentProductionEnum.PartialTest)
      Future.delayed(
        Duration(seconds: 2),
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => showScreen(),
            ),
          );
        },
      );
  }

  getFirstUsageFlag() {
    SharedPreferencesHelper.getFirstUsageFlag().then(
      (onValue) {
        setState(
          () {
            isFirstUsage = onValue;
          },
        );
      },
    );
  }

  Widget showScreen() {
    if (isFirstUsage) {
      return IntroScreen();
    }
    return BlocProvider(
      builder: (builder) => BranchBloc()..dispatch(GetBranch("1")),
      child: HomeScreen(),
    );
  }
}
