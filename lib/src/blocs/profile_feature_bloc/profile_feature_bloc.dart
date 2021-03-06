/*
*   Filename    :   profile_feature_bloc.dart
*   Purpose     :
*   Created     :   13/09/2019 9:49 AM by Detective Conan
*   Updated     :   13/09/2019 9:49 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:mt_carmel_app/src/blocs/profile_feature_bloc/profile_feature_event.dart';
import 'package:mt_carmel_app/src/blocs/profile_feature_bloc/profile_feature_state.dart';
import 'package:mt_carmel_app/src/constants/profile_constants.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/carmelites_service.dart';
import 'package:mt_carmel_app/src/core/services/profile_feature_service.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/user_profile_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/shared_preference_helper.dart';
import 'package:mt_carmel_app/src/models/carmelite.dart';
import 'package:mt_carmel_app/src/models/profile_feature.dart';
import 'package:mt_carmel_app/src/models/user_profile.dart';

class ProfileFeatureBloc
    extends Bloc<ProfileFeatureEvent, ProfileFeatureState> {
  List<String> _features = [];
  static const String _CARMELITE = "Carmelite";
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;
  UserProfile _userProfile;

  UserProfile get userProfile => _userProfile;

  @override
  ProfileFeatureState get initialState => ProfileFeatureUninitialized();

  List<String> get features => _features;

  @override
  Stream<ProfileFeatureState> mapEventToState(
      ProfileFeatureEvent event) async* {
    if (event is FetchProfileFeature) {
      _features = [];
      yield ProfileFeatureLoading();
      // check if loggin status
      try {
        await _checkLoginStatus();
      } catch (e) {
        print(e);
        ProfileFeatureError(e);
      }
      // Check if logged in
      if (!_isLoggedIn) {
        _userProfile = null;
        // check if skipped login screen
        final isSkippedProfileLoggedIn =
            await SharedPreferencesHelper.getProfileSkippedLogin();
        if (!isSkippedProfileLoggedIn) {
          yield ProfileLoginScreenLoaded();
          return;
        }
      } else {
        bool userProfileFetchingError = false;
        await locator<AuthenticationService>().getUserId().then((id) async {
          await locator<UserProfileService>().getUserProfile(id).then((user) {
            _userProfile = user;
          });
        }).catchError((e) {
          userProfileFetchingError = true;
        });
        if (userProfileFetchingError) {
          locator<AuthenticationService>().logout();
          yield ProfileLoginScreenLoaded();
        }
      }

      try {
        final List<ProfileFeature> profileFeatures =
            await locator<ProfileFeatureService>().getData();

        if (profileFeatures == null) {
          _features = [];
          yield ProfileFeatureLoaded();
          return;
        }
        await _sortFeatures(profileFeatures);
        yield ProfileFeatureLoaded();
      } catch (e) {
        print(e);
        yield ProfileFeatureError(Exception("Error fetching profile feature"));
        return;
      }
    }

    if (event is LogoutProfileFeature) {
      yield ProfileLoginScreenLoaded();
    }
  }

  Future _sortFeatures(List<ProfileFeature> profileFeatures) async {
    List<String> carmeliteTypes = [];
    // Check if the branch has carmelite. Extract the type if true
    if (profileFeatures.any((value) {
      return value.name == _CARMELITE;
    })) {
      List<Carmelite> _carmelites = [];

      try {
        _carmelites = await locator<CarmelitesService>().getAllCarmelites();
      } catch (e) {
        print(e);
        _carmelites = [];
      }

      if (_carmelites.any((value) {
        return value.typeId == ProfileFeatureConstants.CARMELITE_PRIEST_TYPE;
      })) carmeliteTypes.add(ProfileFeatureConstants.PRIESTS);
      if (_carmelites.any((value) =>
          value.typeId == ProfileFeatureConstants.CARMELITE_PASTOR_TYPE))
        carmeliteTypes.add(ProfileFeatureConstants.PASTORS);
      if (_carmelites.any((value) =>
          value.typeId == ProfileFeatureConstants.CARMELITE_NUN_TYPE))
        carmeliteTypes.add(ProfileFeatureConstants.NUNS);
    }
    if (_isLoggedIn) {
      //Iterates the branch and user feature
      for (var feature in ProfileFeatureConstants.ProfileFeatureList) {
        // Check if the feature is available to the branch
        if (profileFeatures.any(
          (value) {
            return value.name.trim() == feature;
          },
        )) _features.add(feature);
      }
    }
    // Iterates the features in order
    for (var feature in ProfileFeatureConstants.ProfileFeatureCommonList) {
      // Add the carmelites to the list
      if (feature == ProfileFeatureConstants.PRIESTS ||
          feature == ProfileFeatureConstants.PASTORS ||
          feature == ProfileFeatureConstants.NUNS) {
        if (carmeliteTypes.contains(feature)) _features.add(feature);

        continue;
      }
      // Check if the feature is available to the branch
      if (profileFeatures.any(
        (value) {
          return value.name == feature;
        },
      )) _features.add(feature);
    }
  }

  Future _checkLoginStatus() async {
    await locator<AuthenticationService>()
        .isLoggedIn()
        .then((isLoggedIn) async {
      _isLoggedIn = isLoggedIn;
      if (isLoggedIn) {
        await locator<AuthenticationService>().getUserId().then((id) async {
          await locator<UserProfileService>().getUserProfile(id).then((user) {
            _userProfile = user;
          });
        });
      }
    }).catchError((error) {
      print(error);
      throw Exception("ProfileFeatureBloc._checjLoginStatus: $error");
    });
  }
}
