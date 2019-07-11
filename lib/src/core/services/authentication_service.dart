/*
*  Filename    :   authentication_service.dart
*  Purpose     :	 Service for authenticating user
*  Created     :   2019-07-08 14:23 by Detective Conan
*  Updated     :   2019-07-11 13:27 by Detective conan
*  Changes     :   Added check for login timeout and login status
*/

import 'dart:async';

import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/core/services/user_authentication_api.dart';
import 'package:mt_carmel_app/src/helpers/shared_preference_helper.dart';

enum TimeDurationEnum {
  OneDay,
  OneHour,
  OneWeek,
  OneMinute,
  FiveMinutes,
  TenMinutes,
  ThirtyMinutes,
  TwoWeeks,
  ThreeWeeks,
  OneMonth,
  SixMonth,
  OneYear,
  None,
}

class AuthenticationService {
  int _authenticationTimeout;

  AuthenticationService({TimeDurationEnum timeout = TimeDurationEnum.OneDay}) {
    _authenticationTimeout = _timeoutValue(timeout);
  }

  UserAuthenticationApi _api = locator<UserAuthenticationApi>();

  Future<bool> login(String email, String password) async {
    var success = await _api.validateEmailPassword(email, password);

    if (success) {
      print("authenticationService success");
      print(
          "DateTime.now().toIso8601String() ${DateTime.now().toIso8601String()}");
      SharedPreferencesHelper.setAuthenticationTime(
          DateTime.now().toIso8601String());
      SharedPreferencesHelper.setUsername(email);
      SharedPreferencesHelper.setPassword(password);
    }
    return success;
  }

  void logout() async {
    SharedPreferencesHelper.setAuthenticationTime("");
    SharedPreferencesHelper.setUsername("");
    SharedPreferencesHelper.setPassword("");
  }

  Future<bool> isLoggedIn() async {
    String authenticationTime =
        await SharedPreferencesHelper.getAuthenticationTime();
    if (authenticationTime == null || authenticationTime.isEmpty) return false;
    return !_isAuthenticationTimeOut(authenticationTime);
  }

  bool _isAuthenticationTimeOut(String authenticationTime) {
    bool isTimeout = true;
    try {
      var dateTime = DateTime.parse(authenticationTime);
      if (_authenticationTimeout == 0) return false;
      bool timeout = (_authenticationTimeout <
          DateTime.now().difference(dateTime).inMinutes);
      if (timeout) logout();
      return timeout;
    } catch (e) {
      print(e);
      isTimeout = true;
    }
    return isTimeout;
  }

  int _timeoutValue(TimeDurationEnum timeout) {
    int min = 1;
    int hour = min * 60;
    int day = hour * 24;
    int week = day * 7;
    int month = day * 30;
    int year = month * 12;
    switch (timeout) {
      case TimeDurationEnum.OneDay:
        return day;
      case TimeDurationEnum.OneHour:
        return hour;
      case TimeDurationEnum.OneWeek:
        return week;
      case TimeDurationEnum.OneMinute:
        return min;
      case TimeDurationEnum.TwoWeeks:
        return week * 2;
      case TimeDurationEnum.ThreeWeeks:
        return week * 3;
      case TimeDurationEnum.OneMonth:
        return month;
      case TimeDurationEnum.SixMonth:
        return month * 6;
      case TimeDurationEnum.OneYear:
        return year;
      case TimeDurationEnum.FiveMinutes:
        return min * 5;
      case TimeDurationEnum.TenMinutes:
        return min * 10;
      case TimeDurationEnum.ThirtyMinutes:
        return min * 30;
      default:
        return 0;
    }
  }
}
