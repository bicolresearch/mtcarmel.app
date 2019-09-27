/*
*  Filename    :   connectivity_checker.dart
*  Purpose     :	 Helper class for checking the data connection.
*  Created     :   2019-07-05 14:55 by Detective Conan
*  Updated     :   2019-07-05 14:55 by Detective Conan 
*  Changes     :
*/

//import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class ConnectivityChecker {
  static Future<bool> hasDataConnection() async {
//    bool connected = false;
//    final connectivity = await (Connectivity().checkConnectivity())
//        .timeout(Duration(seconds: 10));
//    if (connectivity == ConnectivityResult.mobile ||
//        connectivity == ConnectivityResult.wifi) {
//      connected = true;
//    }
    bool connected = await DataConnectionChecker().hasConnection;
    return connected;
  }
}
