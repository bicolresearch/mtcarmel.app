/*
*	 Filename	   :	 profile_screen.dart
*	 Purpose		 :   Display the list of the users access and other details of the church
*  Created		 :   2019-06-11 15:44:56 by Detective Conan
*	 Updated			:   17/09/2019 1:49 PM PM by Detective Conan
*	 Changes			:   Sets the ResetFlag after selection of change church.
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/branch_bloc/branch_bloc.dart';
import 'package:mt_carmel_app/src/blocs/church_regular_schedule_bloc/church_regular_schedule_bloc.dart';
import 'package:mt_carmel_app/src/blocs/church_regular_schedule_bloc/church_regular_schedule_event.dart';
import 'package:mt_carmel_app/src/blocs/pastors_bloc/pastors_bloc.dart';
import 'package:mt_carmel_app/src/blocs/pastors_bloc/pastors_event.dart';
import 'package:mt_carmel_app/src/blocs/priests_bloc/priests_bloc.dart';
import 'package:mt_carmel_app/src/blocs/priests_bloc/priests_event.dart';
import 'package:mt_carmel_app/src/blocs/tab_bloc/tab_bloc.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/shared_preference_helper.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/about_screens/about_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/bible_screens/bible_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/church_regular_schedule_screens/church_regular_schedule_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/contact_detail_screens/contact_detail_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/location_screens/location_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/pastors_screens/pastors_page.dart';

import 'package:mt_carmel_app/src/screens/profile_screens/pastors_screens/pastors_screen.dart';
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
  static const String _CHANGE_BRANCH = "Change Church Branch";

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
          await SharedPreferencesHelper.setBranchNameFlag(null);
          await SharedPreferencesHelper.setBranchIdFlag(null);
          await SharedPreferencesHelper.setResetBranch(true);
          locator<BranchService>().clearBranch();
          BlocProvider.of<TabBloc>(context).dispose();
          BlocProvider.of<BranchBloc>(context).dispose();
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider<BranchBloc>(builder: (context) => BranchBloc()),
                  BlocProvider<TabBloc>(builder: (context) => TabBloc())
                ],
                child: StartPage(),
              );
            },
          ));
          return;
        }
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
        return BlocProvider<PriestsBloc>(
            builder: (context) => PriestsBloc()..dispatch(FetchPriests()),
            child: PriestsPage());
      case _PASTORS:
        return BlocProvider<PastorsBloc>(
            builder: (context) => PastorsBloc()..dispatch(FetchPastors()),
            child: PastorsPage());
      case _CONTACT_DETAILS:
        return ContactDetailScreen();
      case _REGULAR_MASS_SCHEDULE:
        return BlocProvider<ChurchRegularScheduleBloc>(
            builder: (context) => ChurchRegularScheduleBloc()
              ..dispatch(FetchChurchRegularSchedule()),
            child: ChurchRegularSchedulePage());
      case _BIBLE:
        return BibleScreen(context);
      case _LOCATION_MAP:
        return LocationScreen();
      default: //  _ABOUT_THE_PARISH:
        return AboutScreen();
    }
  }
}
