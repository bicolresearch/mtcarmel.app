/*
*	Filename		:	profile_screen.dart
*	Purpose			:	Display the list of the users access and other details of the church
* Created			: 2019-06-11 15:44:56 by Detective Conan
*	Updated			: 2019-06-18 16:10:15 by Detective Conan 
*	Changes			: Added call for Bible Screen
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/model/profile.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/about_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/bible_screens/bible_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/church_schedule_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/contact_detail_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/location_screen.dart';

// import 'package:mt_carmel_app/src/screens/profile_screens/location_map.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/pastors_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/priests_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import '../../constants/app_constants.dart';

class ProfileScreen extends StatefulWidget {
  static const TextStyle optionStyle = TextStyle(
      color: Colors.brown, fontSize: 13.0, fontWeight: FontWeight.bold);

  ProfileScreen(BuildContext context);

  // TODO Get the list from the API
  static const String BIBLE = "Holy Bible";
  static const String REGULAR_MASS_SCHEDULE = "Regular Mass Schedule";
  static const String LOCATION_MAP = "Location Map";
  static const String PRIESTS = "Carmelite Priests";
  static const String PASTORS = "Carmelite Pastors";
  static const String CONTACT_DETAILS = "Contact Details";
  static const String ABOUT_THE_PARISH = "About the Parish";

  // TODO Get the list from the API
  // User's list
  static const String USER_SCHEDULE = "My Schedule";
  static const String PRAYER_REQUESTS = "Prayer Requests";
  static const String MASS_REQUESTS = "Mass Requests";
  static const String POST_NEWS = "Post News";
  static const String ADD_PROJECT = "Add Project";
  static const String ADD_SERVICE_TRANSACTION = "Add Service Transaction";
  static const String PRIESTS_SCHEDULES = "Priests Schedule";
  static const String SERVICES_SCHEDULES = "Services Schedules";
  static const String DONATION_REPORT = "Donation Report";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isLoggedIn = false;

  final _profile = Profile(1, "Ransom", "Rapirap", "October 12, 1990", "");

  final List<String> _aboutList = [
    ProfileScreen.BIBLE,
    ProfileScreen.REGULAR_MASS_SCHEDULE,
    ProfileScreen.LOCATION_MAP,
    ProfileScreen.PRIESTS,
    ProfileScreen.PASTORS,
    ProfileScreen.CONTACT_DETAILS,
    ProfileScreen.ABOUT_THE_PARISH,
  ];

  final List<String> _userList = [
     ProfileScreen.USER_SCHEDULE,
     ProfileScreen.PRAYER_REQUESTS,
     ProfileScreen.MASS_REQUESTS,
     ProfileScreen.POST_NEWS,
     ProfileScreen.ADD_PROJECT ,
     ProfileScreen.ADD_SERVICE_TRANSACTION,
     ProfileScreen.PRIESTS_SCHEDULES,
     ProfileScreen.SERVICES_SCHEDULES,
     ProfileScreen.DONATION_REPORT,
  ];

  List<String> _totalList = [];

  @override
  void initState() {
    super.initState();
    _updateList();
  }

  void _updateList(){
    if (_isLoggedIn)
      _totalList = _userList + _aboutList;
    else
      _totalList = _aboutList;
  }

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 0.0),
                child: _isLoggedIn ? _userHeader() : loginWidget()),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: lineWidget()),
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
            )
          ],
        )),
      ),
    );
  }

  Widget loginWidget() {
    return Container(
      width: double.infinity,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50.0,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 50.0, left: 10.0),
                  child: Icon(
                    MountCarmelIcons.logo,
                    color: Colors.brown,
                    size: 100,
                  )),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 50.0,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter email",
                    labelText: "Email",
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 50.0,
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Input password",
                    labelText: "Password",
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Colors.brown,
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        print("Login pressed");
                        setState(() {
                          _isLoggedIn = true;
                          _updateList();
                        }
                        );
                      },
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: () {
                        print("Forgot password pressed");
                      },
                      child: Text(
                        "Forgot password",
                        style: TextStyle(color: Colors.brown),
                      )),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  print("Sign-up pressed");
                },
                child: Text(
                  "Sign-up",
                  style: TextStyle(
                      color: Colors.brown, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userHeader() {
    return Container(
      height: 150,
      child: Row(
        children: <Widget>[
          Image.asset(
            "assets/images/sample_user.png",
          ),
          Container(
            //padding: EdgeInsets.only(top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Ransom Rapirap', style: AppConstants.OPTION_STYLE2),
                Text('October 12, 1990', style: AppConstants.OPTION_STYLE1),
                Container(
                  child: Expanded(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: RaisedButton(
                            //TODO implement the onPress button
                            onPressed: () => "",
                            color: Colors.brown,
                            child: Text(
                              "My Donations",
                              style: TextStyle(
                                  fontFamily: 'Helvetica', color: Colors.white),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                          ),
                        ),
                        GestureDetector(
                            child: Icon(
                          MountCarmelIcons.settings,
                          color: Colors.brown,
                        ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _aboutItem(context, String itemText) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => _navigateToDetail(itemText),
            ));
        //Navigator.pop(context);
      },
      child: ListTile(
        title: Text(
          itemText,
          style: AppConstants.OPTION_STYLE2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _navigateToDetail(String itemText) {
    switch (itemText) {
      case ProfileScreen.ABOUT_THE_PARISH:
        return AboutScreen();
      case ProfileScreen.PRIESTS:
        return PriestsScreen(context);
      case ProfileScreen.PASTORS:
        return PastorsScreen(context);
      case ProfileScreen.CONTACT_DETAILS:
        return ContactDetailScreen();
      case ProfileScreen.REGULAR_MASS_SCHEDULE:
        return ChurchScheduleScreen();
      case ProfileScreen.BIBLE:
        return BibleScreen(context);
       case ProfileScreen.LOCATION_MAP:
         return LocationScreen();
      default:
        // show the default if not yet implemented
        return DefaultScreen();
    }
  }
}

// TODO use for un-implemented screen
class DefaultScreen extends StatelessWidget {
  const DefaultScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Not yet implemented."),
            SizedBox(
              height: 40.0,
            ),
            leftArrowBackButton(context: context),
          ],
        ),
      ),
    );
  }
}
