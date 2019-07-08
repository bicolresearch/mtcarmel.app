/*
*  Filename    :   authentication_service.dart
*  Purpose     :	
*  Created     :   2019-07-08 14:23 by Detective Conan
*  Updated     :   2019-07-08 14:23 by Detective Conan 
*  Changes     :
*/

import 'dart:async';

import 'package:mt_carmel_app/src/core/services/service_locator.dart';

class AuthenticationService {
  // Inject our Api
  Api _api = locator<Api>();

  Future<bool> login(int userId) async {
    // Get the user profile for id
    var fetchedUser = await _api.getUserProfile(userId);

    // Check if success
    var hasUser = fetchedUser != null;

    return hasUser;
  }
}

class Api {

  getUserProfile(int userId) {
    //TODO implement code
    return true;
  }

}