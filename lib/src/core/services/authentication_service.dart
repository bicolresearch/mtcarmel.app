/*
*  Filename    :   authentication_service.dart
*  Purpose     :	 Service for authenticating user
*  Created     :   2019-07-08 14:23 by Detective Conan
*  Updated     :   2019-07-10 16:59 by Detective conan
*  Changes     :   Added setter for login state.
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
  bool _isLoggedIn;

  Future<bool> validateEmailPassword(String email, String password) {
    _isLoggedIn = false;
    var isValid = _getUser(email, password).then((value) {
      if (_userAuthentication != null) {
        _isLoggedIn =
            ((_userAuthentication.username + _userAuthentication.password) ==
                (email + password));
        return _isLoggedIn;
      } else {
        _isLoggedIn = false;
        return false;
      }
    }).catchError((e) {
      _isLoggedIn = false;
      return false;
    });
    return isValid;
  }

  Future<bool> _getUser(String email, String password) async {
    _isLoggedIn = false;
    var hasUser;
    await http
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
        hasUser = true;
      } else {
        print(value.statusCode);
      }
    }).timeout(Duration(seconds: 5));
    return hasUser != null;
  }

  get isLoggedIn => _isLoggedIn ?? false;

  void setLogin(bool login){
    _isLoggedIn = login;
  }
}
