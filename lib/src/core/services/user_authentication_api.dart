/*
*  Filename    :   user_authentication_api.dart
*  Purpose     :	 validates user authentication
*  Created     :   2019-07-11 12:13 by Detective Conan
*  Updated     :   2019-07-11 12:23 by Detective conan
*  Changes     :   Removed responsibility for checking the login status
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mt_carmel_app/src/models/user_authentication.dart';

class UserAuthenticationApi {
  UserAuthentication _userAuthentication;

  Future<bool> validateEmailPassword(String email, String password) {
    var isValid = _isValid(email, password).then((value) {
      if (_userAuthentication != null) {
        return ((_userAuthentication.username + _userAuthentication.password) ==
            (email + password));
      } else {
        return false;
      }
    }).catchError((e) {
      return false;
    });
    return isValid;
  }

  Future<bool> _isValid(String email, String password) async {
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

  get userId => _userAuthentication.id;
}