/*
*	Filename		:	splash_screen.dart
*	Purpose			:	Displays log and ads before the main screen.
* Created			: 2019-05-27 11:47:55 by Detective Conan
*	 Updated			:   17/09/2019 1:12 PM PM by Detective Conan
*	 Changes			:   Added condition what screen to be display after the splashScreen.
*/

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/helpers/shared_preference_helper.dart';
import 'package:mt_carmel_app/src/screens/introduction_screen.dart';
import 'package:mt_carmel_app/src/screens/start_page.dart';
import '../constants/app_constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Container(
            child: Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
                    Image.asset(AppConstants.MT_CARMEL_LOGO_PATH, height: 160),
                    Text(AppConstants.COMPANY_NAME,
                        style: TextStyle(
                            color: Colors.brown,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                    Text(AppConstants.LOCATION_NAME,
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 15.0,
                        )),
                    SizedBox(
                      height: 50.0,
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future navigationPage() async {
    final bool isFirstUsage = await SharedPreferencesHelper.getFirstUsageFlag();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return isFirstUsage ? IntroScreen() : StartPage();
      }),
    );
  }
}
