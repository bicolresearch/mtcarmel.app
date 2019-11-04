/*
*  Filename    :   user_authentication_api.dart
*  Purpose     :	 validates user authentication
*  Created     :   2019-07-11 12:13 by Detective Conan
*	 Updated			:   04/11/2019 6:02 PM PM by Detective Conan
*	 Changes			:   Uncommented the code. No need for dio. http is enough.
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mt_carmel_app/src/models/user_authentication.dart';

class UserAuthenticationApi {
  UserAuthentication _userAuthentication;

  Future<bool> validateEmailPassword(String email, String password) async {
    var isValid;
    await _isValid(email, password).then((value) {
      isValid = value;
      if (_userAuthentication != null) {
        return ((_userAuthentication.username + _userAuthentication.password) ==
            (email + password));
      } else {
        return false;
      }
    }).catchError((e) {
      throw e;
    });
    return isValid != null;
  }

  Future<bool> _isValid(String email, String password) async {
    var valid;
    await http
    //TODO change to new base url when ready
//        .get(AppConstants.API_BASE_URL +
    .get("https://api.mountcarmel.ph/"+
            "auth/login/" +
            "username/" +
            email +
            "/password/" +
            password)
        .then((value) async {
      if (value.statusCode == 200) {
        final body = json.decode(value.body);
        _userAuthentication = UserAuthentication.fromJson(body);
        valid = true;
      } else {
        print(value.statusCode);
      }
    }).timeout(Duration(seconds: 5)).catchError((error){
      throw Exception("UserAuthenticationApi._isValid: $error");
    });
    return (valid != null && valid);
  }

  get userAuthentication => _userAuthentication;
}
