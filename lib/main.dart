/*
*  Filename    :   main.dart
*  Purpose     :   Entry point of app.
*  Created     :   2019-07-12 16:44 by Detective Conan
*	 Updated			:   17/09/2019 1:10 PM PM by Detective Conan
*	 Changes			:   Move the BlocProviders to the widget branches
*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/concrete_bloc_delegate.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/screens/splash_screen.dart';
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
    return MaterialApp(
      title: AppConstants.APP_TITLE,
      debugShowCheckedModeBanner: false,
      theme: appThemeData(context),
      home: SplashScreen(),
    );
  }
}
