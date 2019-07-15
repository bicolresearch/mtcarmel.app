/*
*  Filename    :   main.dart
*  Purpose     :   Entry point of app.
*  Created     :   2019-07-12 16:44 by Detective Conan
*  Updated     :   2019-07-15 09:36 by Detective conan
*  Changes     :   Defined the TextStyles for different size categories
*/

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/screens/bottom_tab_navigator.dart';
import 'src/screens/splash.dart';
import 'src/screens/introduction_screen.dart';
import 'package:mt_carmel_app/src/helpers/shared_preference_helper.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
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
    setupLocator();
    return MaterialApp(
      title: AppConstants.APP_TITLE,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Colors.brown,
        ),
        dividerColor: Colors.brown,
        primarySwatch: Colors.brown,
        primaryColor: Colors.brown,
        disabledColor: Colors.brown[200],
        fontFamily: AppConstants.FONT_FAMILY,
        primaryTextTheme: TextTheme(
          display4: Theme.of(context)
              .textTheme
              .display4
              .copyWith(color: Colors.brown, fontFamily: "Helvetica"),
          display3: Theme.of(context)
              .textTheme
              .display3
              .copyWith(color: Colors.brown, fontFamily: "Helvetica"),
          display2: Theme.of(context)
              .textTheme
              .display2
              .copyWith(color: Colors.brown, fontFamily: "Helvetica"),
          display1: Theme.of(context)
              .textTheme
              .display1
              .copyWith(color: Colors.brown, fontFamily: "Helvetica"),
          headline: Theme.of(context)
              .textTheme
              .headline
              .copyWith(color: Colors.brown, fontFamily: "Helvetica"),
          title: Theme.of(context)
              .textTheme
              .title
              .copyWith(color: Colors.brown, fontFamily: "Helvetica"),
          subhead: Theme.of(context)
              .textTheme
              .subhead
              .copyWith(color: Colors.brown, fontFamily: "Helvetica"),
          body2: Theme.of(context)
              .textTheme
              .body2
              .copyWith(color: Colors.brown, fontFamily: "Helvetica"),
          body1: Theme.of(context)
              .textTheme
              .body1
              .copyWith(color: Colors.brown, fontFamily: "Helvetica"),
          caption: Theme.of(context)
              .textTheme
              .caption
              .copyWith(color: Colors.brown, fontFamily: "Helvetica"),
          subtitle: Theme.of(context)
              .textTheme
              .subtitle
              .copyWith(color: Colors.brown),
        ),
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: Colors.white,
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.brown,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: Page(
        title: 'Mount Carmel App',
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
    return SplashScreen();
  }

  @override
  initState() {
    super.initState();
    getFirstUsageFlag();

    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => showScreen(),
            ));
      },
    );
  }

  getFirstUsageFlag() {
    SharedPreferencesHelper.getFirstUsageFlag().then((onValue) {
      setState(() {
        isFirstUsage = onValue;
        print('$onValue');
      });
    });
  }

  Widget showScreen() {
    if (isFirstUsage) {
      return IntroScreen();
    }
    return BottomTabNavigator();
  }
}
