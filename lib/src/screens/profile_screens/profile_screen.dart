/*
*	 Filename	   :	 profile_screen.dart
*	 Purpose		 :   Display the list of the users access and other details of the church
*  Created		 :   2019-06-11 15:44:56 by Detective Conan
*	 Updated			:   13/09/2019 11:33 AM PM by Detective Conan
*	 Changes			:   Removed unused imports and enums.
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/about_screens/about_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/bible_screens/bible_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/church_regular_schedule_screens/church_regular_schedule_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/church_regular_schedule_screens/church_regular_schedule_screen_old.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/contact_detail_screens/contact_detail_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/location_screens/location_screen.dart';

import 'package:mt_carmel_app/src/screens/profile_screens/pastors_screens/pastors_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/priests_screens/priests_screen.dart';

class ProfileScreen extends StatelessWidget {
  // TODO Get the list from the API
  static const String _BIBLE = "Holy Bible";
  static const String _REGULAR_MASS_SCHEDULE = "Regular Mass Schedule";
  static const String _LOCATION_MAP = "Location Map";
  static const String _PRIESTS = "Carmelite Priests";
  static const String _PASTORS = "Carmelite Pastors";
  static const String _CONTACT_DETAILS = "Contact Details";
  static const String _ABOUT_THE_PARISH = "About the Parish";

  final List<String> _totalList = [
    ProfileScreen._BIBLE,
    ProfileScreen._REGULAR_MASS_SCHEDULE,
    ProfileScreen._LOCATION_MAP,
    ProfileScreen._PRIESTS,
    ProfileScreen._PASTORS,
    ProfileScreen._CONTACT_DETAILS,
    ProfileScreen._ABOUT_THE_PARISH,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: ListView.builder(
                    itemCount: _totalList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 40.0),
                        child: _aboutItem(context, _totalList[index]),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _aboutItem(context, String itemText) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => _navigateToDetail(context, itemText),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          itemText,
          style: Theme.of(context).primaryTextTheme.subhead,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _navigateToDetail(BuildContext context, String itemText) {
    switch (itemText) {
      case _PRIESTS:
        return PriestsScreen(context);
      case _PASTORS:
        return PastorsScreen(context);
      case _CONTACT_DETAILS:
        return ContactDetailScreen();
      case _REGULAR_MASS_SCHEDULE:
        return ChurchRegularScheduleScreenOld();
      case _BIBLE:
        return BibleScreen(context);
      case _LOCATION_MAP:
        return LocationScreen();
      default: //  _ABOUT_THE_PARISH:
        return AboutScreen();
    }
  }
}
