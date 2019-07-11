/*
*	 Filename	   :	 profile_screen.dart
*	 Purpose		 :   Display the list of the users access and other details of the church
*  Created		 :   2019-06-11 15:44:56 by Detective Conan
*  Updated     :   2019-07-11 14:44 by Detective conan
*  Changes     :   Get the login status from shared preferences.
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/core/models/login_model.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/core/services/user_authentication_api.dart';
import 'package:mt_carmel_app/src/helpers/password_crypto.dart';
import 'package:mt_carmel_app/src/helpers/visibility_helper.dart';
import 'package:mt_carmel_app/src/models/profile.dart';
import 'package:mt_carmel_app/src/models/user_authentication.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/about_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/bible_screens/bible_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/church_schedule_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/contact_detail_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/location_screen.dart';

import 'package:mt_carmel_app/src/screens/profile_screens/pastors_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/priests_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import '../../constants/app_constants.dart';

enum ProfileFilter {
  User,
  Guest,
  Login,
}

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
  bool _isLoginFailed = false;
  bool _isTextEditing = false;
  ProfileFilter _currentProfileFilter = ProfileFilter.Login;

  Widget _header = Container();

  final _profile = Profile(1, "Ransom", "Rapirap", "October 12, 1990", "");

  ScrollController _scrollController;

  final _textControllerEmail = TextEditingController();
  final _textControllerPassword = TextEditingController();

  static Icon _arrowUp = Icon(
    Icons.keyboard_arrow_up,
  );
  static Icon _arrowDown = Icon(
    Icons.keyboard_arrow_down,
  );

  VisibilityHelper _arrowMoreUp = VisibilityHelper(
    child: _arrowUp,
    visibility: VisibilityFlag.gone,
  );
  VisibilityHelper _arrowMoreDown = VisibilityHelper(
    child: _arrowDown,
    visibility: VisibilityFlag.gone,
  );

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
    ProfileScreen.ADD_PROJECT,
    ProfileScreen.ADD_SERVICE_TRANSACTION,
    ProfileScreen.PRIESTS_SCHEDULES,
    ProfileScreen.SERVICES_SCHEDULES,
    ProfileScreen.DONATION_REPORT,
  ];

  List<String> _totalList = [];

  @override
  void initState() {
    print("initializing profile screen...");
    _checkLoginStatus();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
    _updateProfileScreen();
    _updateList();
    _initializeArrows();
//    });
  }

  void _updateList() {
    switch (_currentProfileFilter) {
      case ProfileFilter.User:
        _totalList = _userList + _aboutList;
        break;
      case ProfileFilter.Guest:
        _totalList = _aboutList;
        break;
      default:
        _totalList = [];
    }
  }

  Future _initializeArrows() async {
    await Future.delayed(Duration(milliseconds: 500));
    _scrollListener();
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
            (_currentProfileFilter == ProfileFilter.Login)
                ? Spacer()
                : Container(),
            Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 0.0),
                child: _header),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: (_currentProfileFilter == ProfileFilter.Login)
                    ? Container()
                    : lineWidget()),
            GestureDetector(onTap: _moveUp, child: _arrowMoreUp),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: NotificationListener<ScrollNotification>(
                  onNotification: (scrollNotification) {
                    if (scrollNotification is ScrollStartNotification) {
                      _onStartScroll(scrollNotification.metrics);
                    } else if (scrollNotification is ScrollUpdateNotification) {
                      _onUpdateScroll(scrollNotification.metrics);
                    } else if (scrollNotification is ScrollEndNotification) {
                      _onEndScroll(scrollNotification.metrics);
                    }
                  },
                  child: ListView.builder(
                    controller: _scrollController,
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
            ),
            GestureDetector(onTap: _moveDown, child: _arrowMoreDown),
            (_currentProfileFilter == ProfileFilter.Login)
                ? Spacer()
                : Container(),
          ],
        )),
      ),
    );
  }

  Widget loginWidget() {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50.0,
        ),
        child: Column(
          children: <Widget>[
            _isTextEditing
                ? Container()
                : Container(
                    child: Image.asset(
                      AppConstants.MT_CARMEL_LOGO_PATH,
                      height: 160,
                    ),
                  ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 40.0,
              child: TextField(
                onSubmitted: (_) async {
                  await Future.delayed(Duration(milliseconds: 500)).then((_) {
                    _isTextEditing = false;
                  });
                  _updateProfileScreen();
                },
                onTap: () {
                  _isTextEditing = true;
                  _updateProfileScreen();
                },
                controller: _textControllerEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 40.0,
              child: TextField(
                onTap: () {
                  _isTextEditing = true;
                  _updateProfileScreen();
                },
                onSubmitted: (_) async {
                  await Future.delayed(Duration(milliseconds: 500)).then((_) {
                    _isTextEditing = false;
                  });
                  _updateProfileScreen();
                },
                controller: _textControllerPassword,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
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
                      validate(_textControllerEmail.value.text,
                          _textControllerPassword.value.text);
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(children: <Widget>[
                  Text(
                    "Sign-up",
                    style: TextStyle(
                        color: Colors.brown, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      _currentProfileFilter = ProfileFilter.Guest;
                      _clearLoginForm();
                      _updateProfileScreen();
                    },
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Skip",
                          style: TextStyle(
                              color: Colors.brown, fontStyle: FontStyle.italic),
                        ),
                        Icon(
                          Icons.keyboard_arrow_up,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            (!_isLoggedIn && _isLoginFailed)
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Login failed! Make sure the email and password are correct.",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: "Helvetica",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                              softWrap: true,
                            ),
                          ),
                        ),
                      ],
                    ))
                : Container(),
          ],
        ),
      ),
    );
  }

  void _clearLoginForm() {
    _isTextEditing = false;
    _isLoginFailed = false;
    _textControllerPassword.clear();
    _textControllerEmail.clear();
  }

  Widget _skippedHeader() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentProfileFilter = ProfileFilter.Login;
          _updateProfileScreen();
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.keyboard_arrow_down,
              size: 20,
            ),
            Text(
              "Login",
              style: TextStyle(color: Colors.brown, fontSize: 12),
            )
          ],
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
                        PopupMenuButton<int>(
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: Text(
                                "Logout",
                                style: AppConstants.OPTION_STYLE2,
                              ),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: Text(
                                "Cancel",
                                style: AppConstants.OPTION_STYLE2,
                              ),
                            ),
                          ],
                          initialValue: 2,
                          onCanceled: () {
                            print("You have canceled the menu.");
                          },
                          onSelected: (value) {
                            if (value == 1) {
                              setState(() {
                                _currentProfileFilter = ProfileFilter.Login;
                                locator<AuthenticationService>().logout();
                                _updateProfileScreen();
                              });
                            }
                          },
                          icon: Icon(
                            MountCarmelIcons.settings,
                            color: Colors.brown,
                          ),
                        )
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

  Future _updateProfileScreen() async {
    setState(() {
      switch (_currentProfileFilter) {
        case ProfileFilter.User:
          _header = _userHeader();
          break;
        case ProfileFilter.Guest:
          _header = _skippedHeader();
          break;
        default: //ProfileFilter.Login
          _header = loginWidget();
      }
      _updateList();
      _initializeArrows();
    });
  }

  Widget _aboutItem(context, String itemText) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => _navigateToDetail(itemText),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
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

  _scrollListener() {
    if (!_scrollController.hasClients) return;
    try {
      if (_scrollController.offset ==
              _scrollController.position.maxScrollExtent &&
          _scrollController.offset ==
              _scrollController.position.minScrollExtent) {
        setState(() {
          _arrowMoreDown = VisibilityHelper(
              child: _arrowDown, visibility: VisibilityFlag.gone);
          _arrowMoreUp = VisibilityHelper(
              child: _arrowUp, visibility: VisibilityFlag.gone);
        });
        return;
      }
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(() {
          _arrowMoreDown = VisibilityHelper(
              child: _arrowDown, visibility: VisibilityFlag.gone);
          _arrowMoreUp = VisibilityHelper(
              child: _arrowUp, visibility: VisibilityFlag.visible);
        });
        return;
      }
      if (_scrollController.offset <=
              _scrollController.position.minScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(() {
          _arrowMoreDown = VisibilityHelper(
              child: _arrowDown, visibility: VisibilityFlag.visible);
          _arrowMoreUp = VisibilityHelper(
              child: _arrowUp, visibility: VisibilityFlag.gone);
        });
        return;
      }
      if (_scrollController.offset <
              _scrollController.position.maxScrollExtent &&
          _scrollController.offset >
              _scrollController.position.minScrollExtent) {
        setState(() {
          _arrowMoreDown = VisibilityHelper(
              child: _arrowDown, visibility: VisibilityFlag.visible);
          _arrowMoreUp = VisibilityHelper(
              child: _arrowUp, visibility: VisibilityFlag.visible);
        });
        return;
      }
    } catch (e) {
      print(e.toString());
      print("error in _scrolListener");
    }
  }

  @override
  void dispose() {
    print("disposing profile screen...");
    _textControllerEmail.dispose();
    _textControllerPassword.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  _moveUp() {
    if (_scrollController.offset >= _scrollController.position.minScrollExtent)
      _scrollController.animateTo(_scrollController.offset - 200,
          curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  _moveDown() {
    if (_scrollController.offset <= _scrollController.position.maxScrollExtent)
      _scrollController.animateTo(_scrollController.offset + 200,
          curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  void _onStartScroll(ScrollMetrics metrics) {}

  void _onUpdateScroll(ScrollMetrics metrics) {}

  void _onEndScroll(ScrollMetrics metrics) {
    _scrollListener();
  }

  Future _checkLoginStatus() async {
    _isLoggedIn =
        await locator<AuthenticationService>().isLoggedIn().catchError((error) {
      print(error);
      _isLoggedIn = false;
    });
    if (_isLoggedIn)
      _currentProfileFilter = ProfileFilter.User;
    else
      _currentProfileFilter = ProfileFilter.Login;
    _updateProfileScreen();
  }

  String _encrypted(String text) {
    final crypto = PasswordCrypto();
    return crypto.sha512(text);
  }

  void validate(String email, String password) {
    if (email.isEmpty ||
        password.isEmpty ||
        !email.contains("@") ||
        email.contains(" ")) {
      setState(() {
        _isLoginFailed = true;
        _updateProfileScreen();
      });
      return;
    }
    locator<LoginModel>().login(email, _encrypted(password)).then((value) {
      _isLoggedIn = value;
      print(value);
      if (_isLoggedIn)
        setState(() {
          _clearLoginForm();
          _isLoginFailed = false;
          _currentProfileFilter = ProfileFilter.User;
          _updateProfileScreen();
        });
      else
        setState(() {
          _isLoginFailed = true;
          _updateProfileScreen();
        });
    });
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
