/*
*  Filename    :   connectivity_checker.dart
*  Purpose     :	 Helper class for checking the data connection.
*  Created     :   2019-07-05 14:55 by Detective Conan
*  Updated     :   2019-07-05 14:55 by Detective Conan 
*  Changes     :
*/

import 'package:connectivity/connectivity.dart';

class ConnectivityChecker {
  static Future<bool> hasDataConnection() async {
    bool connected = false;
    await (Connectivity().checkConnectivity())
        .timeout(Duration(seconds: 10))
        .then((onValue) {
      print(onValue.toString());
      if (onValue == ConnectivityResult.mobile ||
          onValue == ConnectivityResult.wifi) {
        connected = true;
      }
    });
    return connected;
  }
}
