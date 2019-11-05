/*
*	 Filename	   :	 profile_screen.dart
*	 Purpose		 :   Display the list of the users access and other details of the church
*  Created		 :   2019-06-11 15:44:56 by Detective Conan
*	 Updated			:   05/11/2019 1:07 PM PM by Detective Conan
*	 Changes			:   Added user header.
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/about_bloc/about_bloc.dart';
import 'package:mt_carmel_app/src/blocs/about_bloc/about_event.dart';
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
import 'package:mt_carmel_app/src/blocs/profile_feature_bloc/profile_feature_bloc.dart';
import 'package:mt_carmel_app/src/blocs/profile_feature_bloc/profile_feature_event.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/constants/profile_constants.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/shared_preference_helper.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/about_screens/about_page.dart';

//import 'package:mt_carmel_app/src/screens/profile_screens/bible_screens/bible_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/church_regular_schedule_screens/church_regular_schedule_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/contact_detail_screens/contact_detail_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/edit_profile_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/location_screens/location_map_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/pastors_screens/pastors_page.dart';

import 'package:mt_carmel_app/src/screens/profile_screens/priests_screens/priests_page.dart';

import 'package:mt_carmel_app/src/screens/start_page.dart';
import 'package:share/share.dart';

import '../../blocs/tab_bloc/tab_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final isLoggedIn = BlocProvider.of<ProfileFeatureBloc>(context).isLoggedIn;

    List<String> _features =
        BlocProvider.of<ProfileFeatureBloc>(context).features;
    _features.add(ProfileFeatureConstants.SHARE_APP);
    _features.add(ProfileFeatureConstants.CHANGE_BRANCH);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              isLoggedIn
                  ? _userHeader(context)
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.keyboard_arrow_down,
                          color: Theme.of(context).primaryColor,
                        ),
                        onTap: () async {
                          final bloc =
                              BlocProvider.of<ProfileFeatureBloc>(context);
                          await SharedPreferencesHelper.setProfileSkippedLogin(
                              false);
                          bloc.dispatch(FetchProfileFeature());
                        },
                        title: Text(
                          "Login",
                          style: Theme.of(context).primaryTextTheme.subtitle,
                        ),
                      ),
                    ),
              Image.asset(AppConstants.MT_CARMEL_LOGO_PATH, height: 100),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: ListView.builder(
                    itemCount: _features.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 40.0),
                        child: _aboutItem(context, _features[index]),
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
        if (itemText == ProfileFeatureConstants.CHANGE_BRANCH) {
          final bool confirmed = await _confirmationDialog(context);
          if (!confirmed) return;
          locator<AuthenticationService>().logout();
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
        if (itemText == ProfileFeatureConstants.SHARE_APP) {
          Share.share(
              "https://play.google.com/store/apps/details?id=ph.mountcarmel.mountcarmelsystem",
              subject: "Share this app");
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
          style: Theme.of(context).primaryTextTheme.title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _navigateToDetail(BuildContext context, String itemText) {
    switch (itemText) {
      case ProfileFeatureConstants.PRIESTS:
        return BlocProvider<PriestsBloc>(
            builder: (context) => PriestsBloc()..dispatch(FetchPriests()),
            child: PriestsPage());
      case ProfileFeatureConstants.PASTORS:
        return BlocProvider<PastorsBloc>(
            builder: (context) => PastorsBloc()..dispatch(FetchPastors()),
            child: PastorsPage());
      case ProfileFeatureConstants.CONTACT_DETAILS:
        return BlocProvider<ContactDetailBloc>(
            builder: (context) =>
                ContactDetailBloc()..dispatch(FetchContactDetail()),
            child: ContactDetailPage());
      case ProfileFeatureConstants.REGULAR_MASS_SCHEDULE:
        return BlocProvider<ChurchRegularScheduleBloc>(
            builder: (context) => ChurchRegularScheduleBloc()
              ..dispatch(FetchChurchRegularSchedule()),
            child: ChurchRegularSchedulePage());
//      case _BIBLE:
//        return BibleScreen(context);
      case ProfileFeatureConstants.LOCATION_MAP:
        return BlocProvider<LocationMapBloc>(
            builder: (context) =>
                LocationMapBloc()..dispatch(FetchLocationMap()),
            child: LocationMapPage());
      case ProfileFeatureConstants.ABOUT_THE_PARISH:
      default: //  _ABOUT_THE_PARISH:
        return BlocProvider<AboutBloc>(
            builder: (context) => AboutBloc()..dispatch(FetchAbout()),
            child: AboutPage());
    }
  }

  _confirmationDialog(context) {
    final branchName = BlocProvider.of<TabBloc>(context).branch.name;
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Wrap(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("You are currently in "),
                Text(
                  "$branchName",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .title
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text("\nDo you want to change branch?"),
              ],
            ),
          ],
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

  Widget _userHeader(BuildContext context) {
    final profileFeatureBloc = BlocProvider.of<ProfileFeatureBloc>(context);
    final userProfile = profileFeatureBloc.userProfile;

    final userPhotoSuffix = userProfile?.mediaPath ?? "";

    var imageUrl;
    if (userPhotoSuffix == null || userPhotoSuffix == "")
      imageUrl = "";
    else
      imageUrl = AppConstants.API_BASE_URL + userProfile.mediaPath;

    return Container(
      height: 100,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5.0),
            width: 80.0,
            height: 80.0,
            child: (imageUrl == "")
                ? Icon(
                    MountCarmelIcons.profile,
                    size: 80,
                  )
                : CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(imageUrl),
                    backgroundColor: Colors.brown,
                  ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${userProfile.firstName} ${userProfile.lastName}',
                  style: Theme.of(context).primaryTextTheme.subhead,
                  textAlign: TextAlign.left,
                ),
                Row(
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
                    InkWell(
                      onTap: () async {
                        await showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (builder) {
                            return Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  color: Colors.white),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditProfileScreen()),
                                        );
//                                        Navigator.pop(context);
                                      },
                                      child: ListTile(
                                        title: Text(
                                          "Edit profile",
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .subhead,
                                        ),
                                        leading: Icon(
                                          Icons.build,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        locator<AuthenticationService>()
                                            .logout();
                                        Navigator.pop(context);
                                      },
                                      child: ListTile(
                                        title: Text(
                                          "Logout",
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .subhead,
                                        ),
                                        leading: Icon(
                                          Icons.exit_to_app,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: ListTile(
                                        title: Text(
                                          "Cancel",
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .subhead,
                                        ),
                                        leading: Icon(
                                          Icons.cancel,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Icon(
                        MountCarmelIcons.settings,
                        color: Colors.brown,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
