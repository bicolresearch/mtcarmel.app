/*
*  Filename    :   shared_preference_helper.dart
*  Purpose     :   Sets and gets the stored app's preferences
*  Created     :   2019-07-11 11:42 by Detective Conan
*  Updated     :   2019-07-11 11:42 by Detective Conan
*  Changes     :   Added shared preferences for email and
*                  password authentication.
*/

import 'package:shared_preferences/shared_preferences.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';

class SharedPreferencesHelper {
  //Shared preferences constants
  static const String FIRST_USAGE_FLAG_NAME = "first_usage_flag";
  static const String USERNAME_SHARED_PREFS_KEY = "usernamePrefsKey";
  static const String PASSWORD_SHARED_PREFS_KEY = "passwordPrefsKey";
  static const String AUTHENTICATION_TIME_KEY = "authenticationTimeKey";

  // first usage
  static Future<bool> getFirstUsageFlag() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(FIRST_USAGE_FLAG_NAME) ?? true;
  }

  static Future<void> setFirstUsageFlag(bool isFirstUsage) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(FIRST_USAGE_FLAG_NAME, isFirstUsage);
  }

  // username
  static Future<String> getUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(USERNAME_SHARED_PREFS_KEY) ?? "";
  }

  static Future<void> setUsername(String username) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(USERNAME_SHARED_PREFS_KEY, username);
  }

  // password
  static Future<String> getPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(PASSWORD_SHARED_PREFS_KEY) ?? "";
  }

  static Future<void> setPassword(String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(PASSWORD_SHARED_PREFS_KEY, password);
  }

  // authentication time
  static Future<String> getAuthenticationTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(AUTHENTICATION_TIME_KEY) ?? "";
  }

  static Future<void> setAuthenticationTime(String time) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(AUTHENTICATION_TIME_KEY, time);
  }
}
