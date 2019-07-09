/*
*  Filename    :   authentication_service.dart
*  Purpose     :	 Service for authenticating user
*  Created     :   2019-07-08 14:23 by Detective Conan
*  Updated     :   2019-07-09 15:25 by Detective conan
*  Changes     :   Added validation for email and password
*/

import 'dart:async';

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/user_authentication.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthenticationService {
  // Inject our Api
  Api _api = locator<Api>();

  Future<bool> login(String email, String password) async {
    var success = await _api.validateEmailPassword(email, password);

    return success;
  }
}

class Api {
  UserAuthentication _userAuthentication;

  Future<bool> validateEmailPassword(String email, String password) {
    var isValid = _getUser(email, password).then((value) {
      if (_userAuthentication != null) {
        return (_userAuthentication.username + _userAuthentication.password) ==
            (email + password);
      } else {
        print("null _userAuthentication");
        return false;
      }
    }).catchError((value) {
      return false;
    });
    return isValid;
  }

  Future<bool> _getUser(String email, String password) async {
    var hasUser = await http
        .get(AppConstants.API_BASE_URL +
            "/auth/auth/" +
            "username/" +
            email +
            "/password/" +
            password)
        .then((value) {
      if (value.statusCode == 200) {
        final body = json.decode(value.body);
        _userAuthentication = UserAuthentication.fromJson(body);
      } else {
        print(value.statusCode);
      }
      return;
    }).timeout(Duration(seconds: 5));
    return hasUser;
  }
}
