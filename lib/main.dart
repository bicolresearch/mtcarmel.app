import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mt_carmel_app/src/screens/bottom_tab_navigation.dart';
import 'src/screens/splash.dart';
import 'src/screens/tab_navigator.dart';
import 'src/screens/introduction_screen.dart';
import 'package:mt_carmel_app/src/helpers/shared_preference_helper.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => initializeDateFormatting().then((__) => runApp(
            MtCarmelApp(),
          )));
}

class MtCarmelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mount Carmel',
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Colors.brown,
        ),
        dividerColor: Colors.brown,
        primarySwatch: Colors.brown,
        appBarTheme: AppBarTheme(
            brightness: Brightness.light,
            color: Colors.white,
            textTheme: TextTheme(
              title: TextStyle(
                  color: Colors.brown,
                  fontFamily: "Helvetica",
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            iconTheme: IconThemeData(
              color: Colors.brown,
            )),
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
      Duration(seconds: 5),
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
//    return TabNavigator();
  return BottomTabNavigator();
  }
}
