import 'dart:async';

import 'package:flutter/material.dart';
import 'src/screens/splash.dart';
import 'src/screens/tab_navigator.dart';
import 'src/screens/introduction_screen.dart';
import 'package:mt_carmel_app/src/helpers/shared_preference_helper.dart';
import 'package:date_utils/date_utils.dart';
import 'package:intl/date_symbol_data_local.dart';


void main(){
  initializeDateFormatting().then((_) => runApp(MtCarmelApp(),));
}

class MtCarmelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mount Carmel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Page(title: 'Mount Carmel App',),
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
	initState()  {
			super.initState();   

      getFirstUsageFlag(); 

			Future.delayed(
				Duration(seconds: 5),
				(){
					Navigator.pushReplacement(
						context,
						MaterialPageRoute(
							builder: (context) => showScreen(),
						)
					);
				},
			);
	}

  getFirstUsageFlag(){
    SharedPreferencesHelper.getFirstUsageFlag().then((onValue){
      setState((){
        isFirstUsage = onValue;
        print('$onValue');
      });
    });
  }

	MaterialApp showScreen() {

		if (isFirstUsage){
    	 return MaterialApp(home: IntroScreen(),theme: ThemeData(fontFamily: "Helvetica",));
    }
		return MaterialApp(home: TabNavigator(), theme: ThemeData(fontFamily: "Helvetica",));
	}
      
}