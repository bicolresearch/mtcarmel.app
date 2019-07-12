/*
*  Filename    :   user_profile_service.dart
*  Purpose     :
*  Created     :   2019-07-11 16:37 by Detective Conan
*  Updated     :   2019-07-11 16:37 by Detective Conan 
*  Changes     :
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mt_carmel_app/src/models/user_profile.dart';

class UserProfileService {
  Future<UserProfile> getUserProfile(String id) async {
    UserProfile _userProfile;
    await http.get(AppConstants.USER_PROFILE_JSON).then((result) {
      if (result.statusCode == 200) {
        List<UserProfile> userProfileList = (json.decode(result.body) as List)
            .map((data) => new UserProfile.fromJson(data))
            .toList();
        try {
          _userProfile =
              userProfileList.where((user) => user.id == id ?? "").elementAt(0);
        } catch (e) {
          print(e);
        }
      } else {
        print(result.statusCode);
      }
    }).timeout(Duration(seconds: 5));
    return _userProfile;
  }
}
