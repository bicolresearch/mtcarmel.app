/*
*  Filename    :   user_authentication_api.dart
*  Purpose     :	 validates user authentication
*  Created     :   2019-07-11 12:13 by Detective Conan
*	 Updated			:   05/11/2019 10:18 AM PM by Detective Conan
*	 Changes			:   Modified the base url. and added branch_id to the url.
* */

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'dart:convert';

import 'package:mt_carmel_app/src/models/user_authentication.dart';

class UserAuthenticationApi {
  UserAuthentication _userAuthentication;

  Future<bool> validateEmailPassword(String email, String password) async {
    var isValid;
    await _isValid(email, password).then((value) {
      isValid = value;
      if (_userAuthentication != null) {
        return ((_userAuthentication.username + password) ==
            (email + password));
      } else {
        return false;
      }
    }).catchError((e) {
      print(e);
      throw Exception(
          "UserAuthenticationApi.validateEmailPassword: error in validation");
    });
    return isValid != null;
  }

  Future<bool> _isValid(String email, String password) async {
    var valid;
    final branchId = locator<BranchService>().branch.id;
    print("branchId = $branchId");
    final headers = {"Content-type": "application/x-www-form-urlencoded"};
    final url = AppConstants.API_BASE_URL +
        "auth/login/" +
        "username/" +
        email +
        "/password/" +
        password +
        "/branch_id/" +
        branchId;
    await http.get(url, headers: headers)
        .then((value) async {
      if (value.statusCode == 200) {
        final body = json.decode(value.body);
        _userAuthentication = UserAuthentication.fromJson(body);
        valid = true;
      } else {
        print(value.statusCode);
        throw Exception(
            "UserAuthenticationApi._isValid: response ${value.statusCode}.");
      }
    }).timeout(Duration(seconds: 5)).catchError((error) {
      throw Exception("UserAuthenticationApi._isValid: $error");
    });
    return (valid != null && valid);
  }

  get userAuthentication => _userAuthentication;
}
