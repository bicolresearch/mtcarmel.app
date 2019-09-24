/*
*	 Filename	   :	 profile_screen.dart
*	 Purpose		 :   Display the list of the users access and other details of the church
*  Created		 :   2019-06-11 15:44:56 by Detective Conan
*	 Updated			:   24/09/2019 3:55 PM PM by Detective Conan
*	 Changes			:   Changed the label for changing branch
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/about_bloc/about_bloc.dart';
import 'package:mt_carmel_app/src/blocs/about_bloc/about_event.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_bloc.dart';
import 'package:mt_carmel_app/src/blocs/church_regular_schedule_bloc/church_regular_schedule_bloc.dart';
import 'package:mt_carmel_app/src/blocs/church_regular_schedule_bloc/church_regular_schedule_event.dart';
import 'package:mt_carmel_app/src/blocs/contact_detail_bloc/contact_detail_bloc.dart';
import 'package:mt_carmel_app/src/blocs/contact_detail_bloc/contact_detail_event.dart';
import 'package:mt_carmel_app/src/blocs/location_map_bloc/location_map_bloc.dart';
import 'package:mt_carmel_app/src/blocs/location_map_bloc/location_map_event.dart';
import 'package:mt_carmel_app/src/blocs/pastors_bloc/pastors_bloc.dart';
import 'package:mt_carmel_app/src/blocs/pastors_bloc/pastors_event.dart';
import 'package:mt_carmel_app/src/blocs/priests_bloc/priests_bloc.dart';
import 'package:mt_carmel_app/src/blocs/priests_bloc/priests_event.dart';
import 'package:mt_carmel_app/src/blocs/tab_bloc/tab_bloc.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/shared_preference_helper.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/about_screens/about_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/bible_screens/bible_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/church_regular_schedule_screens/church_regular_schedule_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/contact_detail_screens/contact_detail_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/location_screens/location_map_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/pastors_screens/pastors_page.dart';

import 'package:mt_carmel_app/src/screens/profile_screens/priests_screens/priests_page.dart';

import 'package:mt_carmel_app/src/screens/start_page.dart';

class ProfileScreen extends StatelessWidget {
  // TODO Get the list from the API
  static const String _BIBLE = "Holy Bible";
  static const String _REGULAR_MASS_SCHEDULE = "Regular Mass Schedule";
  static const String _LOCATION_MAP = "Location Map";
  static const String _PRIESTS = "Carmelite Priests";
  static const String _PASTORS = "Carmelite Pastors";
  static const String _CONTACT_DETAILS = "Contact Details";
  static const String _ABOUT_THE_PARISH = "About the Parish";
  static const String _CHANGE_BRANCH = "Change branch";

  final List<String> _totalList = [
    _BIBLE,
    _REGULAR_MASS_SCHEDULE,
    _LOCATION_MAP,
    _PRIESTS,
    _PASTORS,
    _CONTACT_DETAILS,
    _ABOUT_THE_PARISH,
    _CHANGE_BRANCH,
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
              Image.asset(AppConstants.MT_CARMEL_LOGO_PATH, height: 100),
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
      onTap: () async {
        if (itemText == _CHANGE_BRANCH) {
          final bool confirmed = await _confirmationDialog(context);
          if (!confirmed) return;

          await SharedPreferencesHelper.setBranchNameFlag(null);
          await SharedPreferencesHelper.setBranchIdFlag(null);
          await SharedPreferencesHelper.setResetBranch(true);
          locator<BranchService>().clearBranch();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return StartPage();
              },
            ),
          );
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => _navigateToDetail(context, itemText),
          ),
        );
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
        return BlocProvider<PriestsBloc>(
            builder: (context) => PriestsBloc()..dispatch(FetchPriests()),
            child: PriestsPage());
      case _PASTORS:
        return BlocProvider<PastorsBloc>(
            builder: (context) => PastorsBloc()..dispatch(FetchPastors()),
            child: PastorsPage());
      case _CONTACT_DETAILS:
        return BlocProvider<ContactDetailBloc>(
            builder: (context) =>
                ContactDetailBloc()..dispatch(FetchContactDetail()),
            child: ContactDetailPage());
      case _REGULAR_MASS_SCHEDULE:
        return BlocProvider<ChurchRegularScheduleBloc>(
            builder: (context) => ChurchRegularScheduleBloc()
              ..dispatch(FetchChurchRegularSchedule()),
            child: ChurchRegularSchedulePage());
      case _BIBLE:
        return BibleScreen(context);
      case _LOCATION_MAP:
        return BlocProvider<LocationMapBloc>(
            builder: (context) =>
                LocationMapBloc()..dispatch(FetchLocationMap()),
            child: LocationMapPage());
      case _ABOUT_THE_PARISH:
      default: //  _ABOUT_THE_PARISH:
        return BlocProvider<AboutBloc>(
            builder: (context) => AboutBloc()..dispatch(FetchAbout()),
            child: AboutPage());
    }
  }

  _confirmationDialog(context) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: ListTile(
          title: Text("Do you want to change branch?"),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Yes'),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          FlatButton(
            child: Text('No'),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
        ],
      ),
    );
  }
}
