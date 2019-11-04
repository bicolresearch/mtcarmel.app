/*
*  Filename    :   shared_preference_helper.dart
*  Purpose     :   Sets and gets the stored app's preferences
*  Created     :   2019-07-11 11:42 by Detective Conan
*	 Updated			:   04/11/2019 1:03 PM PM by Detective Conan
*	 Changes			:   Added flag for profile login screen
*/

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  //Shared preferences constants
  static const String _FIRST_USAGE_FLAG_NAME = "first_usage_flag";
  static const String _USER_ID_SHARED_PREFS_KEY = "userIdPrefsKey";
  static const String _USERNAME_SHARED_PREFS_KEY = "usernamePrefsKey";
  static const String _PASSWORD_SHARED_PREFS_KEY = "passwordPrefsKey";
  static const String _AUTHENTICATION_TIME_KEY = "authenticationTimeKey";
  static const String _AUTHENTICATION_ROLE_ID_KEY = "authenticationRoleIdKey";
  static const String _BRANCH_ID_KEY = "branch_id_key";
  static const String _BRANCH_NAME_KEY = "branch_name_key";
  static const String _ID_BRANCH_KEY = "id_branch";
  static const String _RESET_BRANCH_KEY = "reset_banrch_key";
  static const String _PROFILE_SKIPPED_LOGIN_KEY = "profileSkippedLoginKey";

  // first usage
  static Future<bool> getFirstUsageFlag() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_FIRST_USAGE_FLAG_NAME) ?? true;
  }

  static Future<void> setFirstUsageFlag(bool isFirstUsage) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(_FIRST_USAGE_FLAG_NAME, isFirstUsage);
  }

  static Future<String> getBranchIdFlag() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_BRANCH_ID_KEY);
  }

  static Future<void> setBranchIdFlag(String branchId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_BRANCH_ID_KEY, branchId);
  }

  static Future<String> getBranchNameFlag() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_BRANCH_NAME_KEY);
  }

  static Future<void> setBranchNameFlag(String branchName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_BRANCH_NAME_KEY, branchName);
  }

//  static Future<String> getIdBranchFlag() async {
//    final SharedPreferences prefs = await SharedPreferences.getInstance();
//
//    return prefs.getString(_ID_BRANCH_KEY);
//  }
//
//  static Future<void> setIdBranchFlag(String idBranch) async {
//    final SharedPreferences prefs = await SharedPreferences.getInstance();
//
//    return prefs.setString(_ID_BRANCH_KEY, idBranch);
//  }

  // user id
  static Future<String> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_USER_ID_SHARED_PREFS_KEY) ?? "0";
  }

  static Future<void> setUserId(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_USER_ID_SHARED_PREFS_KEY, id);
  }

  // username
  static Future<String> getUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_USERNAME_SHARED_PREFS_KEY) ?? "";
  }

  static Future<void> setUsername(String username) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_USERNAME_SHARED_PREFS_KEY, username);
  }

  // password
  static Future<String> getPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_PASSWORD_SHARED_PREFS_KEY) ?? "";
  }

  static Future<void> setPassword(String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_PASSWORD_SHARED_PREFS_KEY, password);
  }

  // authentication time
  static Future<String> getAuthenticationTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_AUTHENTICATION_TIME_KEY) ?? "";
  }

  static Future<void> setAuthenticationTime(String time) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_AUTHENTICATION_TIME_KEY, time);
  }


  // Authentication roleId
  static Future<String> getAuthenticationRoleId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_AUTHENTICATION_ROLE_ID_KEY) ?? "";
  }

  static Future<void> setRoleId(String roleId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_AUTHENTICATION_ROLE_ID_KEY, roleId);
  }

  static Future<void> setResetBranch(bool isReset) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(_RESET_BRANCH_KEY, isReset);
  }

  static Future<bool> getResetBranch() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_RESET_BRANCH_KEY)??true;
  }

  // profile skipped login
  static Future<bool> getProfileSkippedLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_PROFILE_SKIPPED_LOGIN_KEY) ?? false;
  }

  static Future<void> setProfileSkippedLogin(bool isProfileLoginSkipped) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(_PROFILE_SKIPPED_LOGIN_KEY, isProfileLoginSkipped);
  }

}
