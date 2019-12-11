/*
*	 Filename	   :	 profile_screen.dart
*	 Purpose		 :   Display the list of the users access and other details of the church
*  Created		 :   2019-06-11 15:44:56 by Detective Conan
*	 Updated			:   05/12/2019 11:07 AM PM by Detective Conan
*	 Changes			:   Used the ModuleModelBloc for all the services.
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/about_bloc/about_bloc.dart';
import 'package:mt_carmel_app/src/blocs/about_bloc/about_event.dart';
import 'package:mt_carmel_app/src/blocs/adult_baptism_bloc/adult_baptism_bloc.dart';
import 'package:mt_carmel_app/src/blocs/adult_baptism_bloc/adult_baptism_event.dart';
import 'package:mt_carmel_app/src/blocs/application_bloc/application_bloc.dart';
import 'package:mt_carmel_app/src/blocs/application_bloc/application_event.dart';
import 'package:mt_carmel_app/src/blocs/certificate_bloc/certificate_bloc.dart';
import 'package:mt_carmel_app/src/blocs/certificate_bloc/certificate_event.dart';

import 'package:mt_carmel_app/src/blocs/church_regular_schedule_bloc/church_regular_schedule_bloc.dart';
import 'package:mt_carmel_app/src/blocs/church_regular_schedule_bloc/church_regular_schedule_event.dart';
import 'package:mt_carmel_app/src/blocs/communion_of_the_sick_bloc/communion_of_the_sick_bloc.dart';
import 'package:mt_carmel_app/src/blocs/communion_of_the_sick_bloc/communion_of_the_sick_event.dart';
import 'package:mt_carmel_app/src/blocs/community_baptism_bloc/community_baptism_bloc.dart';
import 'package:mt_carmel_app/src/blocs/community_baptism_bloc/community_baptism_event.dart';
import 'package:mt_carmel_app/src/blocs/confiramtion_bloc/confirmation_bloc.dart';
import 'package:mt_carmel_app/src/blocs/confiramtion_bloc/confirmation_event.dart';
import 'package:mt_carmel_app/src/blocs/contact_detail_bloc/contact_detail_bloc.dart';
import 'package:mt_carmel_app/src/blocs/contact_detail_bloc/contact_detail_event.dart';
import 'package:mt_carmel_app/src/blocs/crypt_lobby_bloc/crypt_lobby_bloc.dart';
import 'package:mt_carmel_app/src/blocs/crypt_lobby_bloc/crypt_lobby_event.dart';
import 'package:mt_carmel_app/src/blocs/first_communion_bloc/first_communion_bloc.dart';
import 'package:mt_carmel_app/src/blocs/first_communion_bloc/first_communion_event.dart';
import 'package:mt_carmel_app/src/blocs/fmh_hall_bloc/fmh_hall_bloc.dart';
import 'package:mt_carmel_app/src/blocs/fmh_hall_bloc/fmh_hall_event.dart';
import 'package:mt_carmel_app/src/blocs/funeral_chapel_bloc/funeral_chapel_bloc.dart';
import 'package:mt_carmel_app/src/blocs/funeral_chapel_bloc/funeral_chapel_event.dart';
import 'package:mt_carmel_app/src/blocs/funeral_service_bloc/funeral_service_bloc.dart';
import 'package:mt_carmel_app/src/blocs/funeral_service_bloc/funeral_service_event.dart';
import 'package:mt_carmel_app/src/blocs/individual_baptism_bloc/individual_baptism_bloc.dart';
import 'package:mt_carmel_app/src/blocs/individual_baptism_bloc/individual_baptism_event.dart';
import 'package:mt_carmel_app/src/blocs/liturgical_bloc/liturgical_bloc.dart';
import 'package:mt_carmel_app/src/blocs/liturgical_bloc/liturgical_event.dart';
import 'package:mt_carmel_app/src/blocs/location_map_bloc/location_map_bloc.dart';
import 'package:mt_carmel_app/src/blocs/location_map_bloc/location_map_event.dart';
import 'package:mt_carmel_app/src/blocs/marriage_bloc/marriage_bloc.dart';
import 'package:mt_carmel_app/src/blocs/marriage_bloc/marriage_event.dart';
import 'package:mt_carmel_app/src/blocs/mass_request_bloc/mass_request_bloc.dart';
import 'package:mt_carmel_app/src/blocs/mass_request_bloc/mass_request_event.dart';
import 'package:mt_carmel_app/src/blocs/module_model_bloc/module_model_bloc.dart';
import 'package:mt_carmel_app/src/blocs/module_model_bloc/module_model_event.dart';
import 'package:mt_carmel_app/src/blocs/november_mass_bloc/november_mass_bloc.dart';
import 'package:mt_carmel_app/src/blocs/november_mass_bloc/november_mass_event.dart';
import 'package:mt_carmel_app/src/blocs/pastors_bloc/pastors_bloc.dart';
import 'package:mt_carmel_app/src/blocs/pastors_bloc/pastors_event.dart';
import 'package:mt_carmel_app/src/blocs/prayer_request_bloc/prayer_request_bloc.dart';
import 'package:mt_carmel_app/src/blocs/prayer_request_bloc/prayer_request_event.dart';
import 'package:mt_carmel_app/src/blocs/priests_bloc/priests_bloc.dart';
import 'package:mt_carmel_app/src/blocs/priests_bloc/priests_event.dart';
import 'package:mt_carmel_app/src/blocs/profile_feature_bloc/profile_feature_bloc.dart';
import 'package:mt_carmel_app/src/blocs/profile_feature_bloc/profile_feature_event.dart';

import 'package:mt_carmel_app/src/blocs/tab_bloc/tab.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/constants/profile_constants.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/shared_preference_helper.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/about_screens/about_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/adult_baptism_screens/adult_baptism_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/application_screens/application_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/certificate_screens/certificate_page.dart';

import 'package:mt_carmel_app/src/screens/profile_screens/church_regular_schedule_screens/church_regular_schedule_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/communion_of_the_sick_screen/communion_of_the_sick_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/community_baptism_screens/community_baptism_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/confirmation_screens/confirmation_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/contact_detail_screens/contact_detail_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/crypt_lobby_srceens/crypt_lobby_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/edit_profile_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/first_communion_screens/first_communion_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/fmh_hall_screens/fmh_hall_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/funeral_chapel_screens/funeral_chapel_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/funeral_service_screens/funeral_service_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/individual_baptism_screens/individual_baptism_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/liturgical_screens/liturgical_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/location_screens/location_map_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/marriage_screens/marriage_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/mass_request_screens/mass_request_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/november_mass_screens/november_mass_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/pastors_screens/pastors_page.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/prayer_request_screens/prayer_request_page.dart';

import 'package:mt_carmel_app/src/screens/profile_screens/priests_screens/priests_page.dart';

import 'package:mt_carmel_app/src/screens/start_page.dart';
import 'package:provider/provider.dart';
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
    if (!_features.contains(ProfileFeatureConstants.SHARE_APP))
      _features.add(ProfileFeatureConstants.SHARE_APP);

    if (!_features.contains(ProfileFeatureConstants.CHANGE_BRANCH))
      _features.add(ProfileFeatureConstants.CHANGE_BRANCH);

    if (!_features.contains(ProfileFeatureConstants.LOGOUT)) {
      if (isLoggedIn) _features.add(ProfileFeatureConstants.LOGOUT);
    }

    // TODO remove these
//    if (!_features.contains(ProfileFeatureConstants.CONFIRMATION_APPROVAL)) {
//      if (isLoggedIn)
//        _features.add(ProfileFeatureConstants.CONFIRMATION_APPROVAL);
//    }

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
          Share.share(AppConstants.ANDROID_PLAY_STORE_LINK,
              subject: "Share this app");
          return;
        }
        if (itemText == ProfileFeatureConstants.LOGOUT) {
          final result = await _logoutConfirmationDialog(context);
          if (result == null || result == false) return;
          locator<AuthenticationService>().logout();
          BlocProvider.of<ProfileFeatureBloc>(context)
              .dispatch(LogoutProfileFeature());
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
      case ProfileFeatureConstants.APPLICATION_FORM:
        return MultiProvider(
          providers: [
            BlocProvider<ApplicationBloc>(
              builder: (context) =>
                  ApplicationBloc()..dispatch(FetchApplication()),
            ),
            Provider<String>.value(value: itemText)
          ],
          child: ApplicationPage(),
        );
      case ProfileFeatureConstants.PRAYER_REQUEST_APPROVAL:
      case ProfileFeatureConstants.PRAYER_REQUEST:
        return MultiProvider(
          providers: [
            BlocProvider<PrayerRequestBloc>(
              builder: (context) =>
                  PrayerRequestBloc()..dispatch(FetchPrayerRequest()),
            ),
            Provider<String>.value(value: itemText)
          ],
          child: PrayerRequestPage(),
        );
      case ProfileFeatureConstants.MASS_REQUESTS_APPROVAL:
      case ProfileFeatureConstants.MASS_REQUEST:
        return MultiProvider(
          providers: [
            BlocProvider<MassRequestBloc>(
              builder: (context) =>
                  MassRequestBloc()..dispatch(FetchMassRequest()),
            ),
            Provider<String>.value(value: itemText)
          ],
          child: MassRequestPage(),
        );
      case ProfileFeatureConstants.LITURGICAL_SERVICE:
      case ProfileFeatureConstants.LITURGICAL_SERVICE_APPROVAL:
        return MultiProvider(
          providers: [
            BlocProvider<LiturgicalBloc>(
              builder: (context) =>
                  LiturgicalBloc()..dispatch(FetchLiturgical()),
            ),
            Provider<String>.value(value: itemText)
          ],
          child: LiturgicalPage(),
        );
      case ProfileFeatureConstants.CERTIFICATE_REQUESTS:
      case ProfileFeatureConstants.CERTIFICATE_APPROVAL:
        return MultiProvider(
          providers: [
            BlocProvider<CertificateBloc>(
              builder: (context) =>
                  CertificateBloc()..dispatch(FetchCertificate()),
            ),
            Provider<String>.value(value: itemText)
          ],
          child: CertificatePage(),
        );

//        INDIVIDUAL_BAPTISM,
      case ProfileFeatureConstants.INDIVIDUAL_BAPTISM_REQUEST:
      case ProfileFeatureConstants.INDIVIDUAL_BAPTISM_APPROVAL:
        return MultiProvider(
          providers: [
            BlocProvider<IndividualBaptismBloc>(
              builder: (context) =>
                  IndividualBaptismBloc()..dispatch(FetchIndividualBaptism()),
            ),
            Provider<String>.value(value: itemText)
          ],
          child: IndividualBaptismPage(),
        );

//    COMMUNITY_BAPTISM,
      case ProfileFeatureConstants.COMMUNITY_BAPTISM_REQUEST:
      case ProfileFeatureConstants.COMMUNITY_BAPTISM_APPROVAL:
        return MultiProvider(
          providers: [
            BlocProvider<CommunityBaptismBloc>(
              builder: (context) =>
                  CommunityBaptismBloc()..dispatch(FetchCommunityBaptism()),
            ),
            Provider<String>.value(value: itemText)
          ],
          child: CommunityBaptismPage(),
        );
//    ADULT_BAPTISM,
      case ProfileFeatureConstants.ADULT_BAPTISM_REQUEST:
      case ProfileFeatureConstants.ADULT_BAPTISM_APPROVAL:
        return MultiProvider(
          providers: [
            BlocProvider<AdultBaptismBloc>(
              builder: (context) =>
                  AdultBaptismBloc()..dispatch(FetchAdultBaptism()),
            ),
            Provider<String>.value(value: itemText)
          ],
          child: AdultBaptismPage(),
        );

      // Confirmation
      case ProfileFeatureConstants.CONFIRMATION_APPROVAL:
      case ProfileFeatureConstants.CONFIRMATION_REQUEST:
        return MultiProvider(
          providers: [
            BlocProvider<ConfirmationBloc>(
              builder: (context) =>
                  ConfirmationBloc()..dispatch(FetchConfirmation()),
            ),
            Provider<String>.value(value: itemText)
          ],
          child: ConfirmationPage(),
        );
      // TODO
//    MARRIAGE,
      case ProfileFeatureConstants.MARRIAGE_APPROVAL:
      case ProfileFeatureConstants.MARRIAGE_REQUEST:
        return MultiProvider(
          providers: [
            BlocProvider<MarriageBloc>(
              builder: (context) => MarriageBloc()..dispatch(FetchMarriage()),
            ),
            Provider<String>.value(value: itemText)
          ],
          child: MarriagePage(),
        );
//    FUNERAL_SERVICE,
      case ProfileFeatureConstants.FUNERAL_SERVICE_REQUEST:
      case ProfileFeatureConstants.FUNERAL_SERVICE_APPROVAL:
        return MultiProvider(
          providers: [
            BlocProvider<FuneralServiceBloc>(
              builder: (context) =>
                  FuneralServiceBloc()..dispatch(FetchFuneralService()),
            ),
            Provider<String>.value(value: itemText)
          ],
          child: FuneralServicePage(),
        );

//    FUNERAL_CHAPEL,
      case ProfileFeatureConstants.FUNERAL_CHAPEL_REQUEST:
      case ProfileFeatureConstants.FUNERAL_CHAPEL_APPROVAL:
        return MultiProvider(
          providers: [
            BlocProvider<FuneralChapelBloc>(
              builder: (context) =>
                  FuneralChapelBloc()..dispatch(FetchFuneralChapel()),
            ),
            Provider<String>.value(value: itemText)
          ],
          child: FuneralChapelPage(),
        );

//    CRYPT_LOBBY,
      case ProfileFeatureConstants.CRYPT_LOBBY_REQUEST:
      case ProfileFeatureConstants.CRYPT_LOBBY_APPROVAL:
        return MultiProvider(
          providers: [
            BlocProvider<CryptLobbyBloc>(
              builder: (context) =>
                  CryptLobbyBloc()..dispatch(FetchCryptLobby()),
            ),
            Provider<String>.value(value: itemText)
          ],
          child: CryptLobbyPage(),
        );
//    NOVEMBER_MASS_FOR_THE_DEAD,
      case ProfileFeatureConstants.NOVEMBER_MASS_FOR_THE_DEAD_REQUEST:
      case ProfileFeatureConstants.NOVEMBER_MASS_FOR_THE_DEAD_APPROVAL:
        return MultiProvider(
          providers: [
            BlocProvider<NovemberMassBloc>(
              builder: (context) =>
                  NovemberMassBloc()..dispatch(FetchNovemberMass()),
            ),
            Provider<String>.value(value: itemText)
          ],
          child: NovemberMassPage(),
        );

      case ProfileFeatureConstants.FIRST_COMMUNION_REQUEST:
      case ProfileFeatureConstants.FIRST_COMMUNION_APPROVAL:
        return MultiProvider(
          providers: [
            BlocProvider<FirstCommunionBloc>(
              builder: (context) =>
                  FirstCommunionBloc()..dispatch(FetchFirstCommunion()),
            ),
            Provider<String>.value(value: itemText)
          ],
          child: FirstCommunionPage(),
        );
      case ProfileFeatureConstants.COMMUNION_OF_THE_SICK_REQUEST:
      case ProfileFeatureConstants.COMMUNION_OF_THE_SICK_APPROVAL:
        return MultiProvider(
          providers: [
            BlocProvider<CommunionOfTheSickBloc>(
              builder: (context) =>
                  CommunionOfTheSickBloc()..dispatch(FetchCommunionOfTheSick()),
            ),
            Provider<String>.value(value: itemText)
          ],
          child: CommunionOfTheSickPage(),
        );

      case ProfileFeatureConstants.FATHER_MARK_HORAN_HALL_APPROVAL:
      case ProfileFeatureConstants.FATHER_MARK_HORAN_HALL_REQUEST:
        return MultiProvider(
          providers: [
            BlocProvider<FmhHallBloc>(
              builder: (context) => FmhHallBloc()..dispatch(FetchFmhHall()),
            ),
            Provider<String>.value(value: itemText)
          ],
          child: FmhHallPage(),
        );

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
    final isLoggedIn = BlocProvider.of<ProfileFeatureBloc>(context).isLoggedIn;
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
                isLoggedIn
                    ? Text(
                        """\nYou are logged in to this branch.\nThis will automatically logout when changing branches.""",
                        style: TextStyle(color: Colors.red),
                      )
                    : Container(),
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

  _logoutConfirmationDialog(context) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Wrap(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You are about to logout",
                  style: TextStyle(color: Colors.red),
                ),
                Text("\nDo you want to continue?"),
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
                  '${userProfile.firstName??""} ${userProfile.lastName??""}',
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
                        _showSetting(context);
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

  _showSetting(BuildContext context) async {
    return await showModalBottomSheet(
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
                          builder: (context) => EditProfileScreen()),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      "Edit profile",
                      style: Theme.of(context).primaryTextTheme.subhead,
                    ),
                    leading: Icon(
                      Icons.build,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context, false);
                  },
                  child: ListTile(
                    title: Text(
                      "Cancel",
                      style: Theme.of(context).primaryTextTheme.subhead,
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
  }
}
