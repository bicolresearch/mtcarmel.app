
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';


class SharedPreferencesHelper {
  
  static final String _isFirstUsageFlag= AppConstants.FIRST_USAGE_FLAG_NAME;

  static Future<bool> getFirstUsageFlag() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_isFirstUsageFlag)??true;
  }

  static Future<void> setFirstUsageFlag(bool isFirstUsage) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(_isFirstUsageFlag, isFirstUsage);
  }
}

