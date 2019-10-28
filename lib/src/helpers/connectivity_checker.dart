/*
*  Filename    :   connectivity_checker.dart
*  Purpose     :	 Helper class for checking the data connection.
*  Created     :   2019-07-05 14:55 by Detective Conan
*  Updated     :   2019-07-05 14:55 by Detective Conan 
*  Changes     :
*/

//import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:mt_carmel_app/src/core/services/prod_dev_manager_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';

class ConnectivityChecker {
  static Future<bool> hasDataConnection() async {

//    if(locator<ProdDevManagerService>().prodDevEnum == ProdDevEnum.Development)
//      return true;

    bool connected = await DataConnectionChecker().hasConnection;
    return connected;
  }
}
