/*
*  Filename    :   user_profile_service.dart
*  Purpose     :
*  Created     :   2019-07-11 16:37 by Detective Conan
*  Updated     :   2019-07-12 15:20 by Detective conan
*  Changes     :   Simplified query of user profile id.
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mt_carmel_app/src/models/user_profile.dart';

class UserProfileService {
  Future<UserProfile> getUserProfile(String id) async {
    UserProfile _userProfile;
    await http.get(AppConstants.USER_PROFILE_JSON + id).then((result) {
      if (result.statusCode == 200) {
        final body = json.decode(result.body);
        _userProfile =
            UserProfile.fromJson(body);
      } else {
        print(result.statusCode);
      }
    }).timeout(Duration(seconds: 5));
    return _userProfile;
  }
}
