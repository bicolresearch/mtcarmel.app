/*
*  Filename    :   service_locator.dart
*  Purpose     :	
*  Created     :   2019-07-08 13:46 by Detective Conan
*  Updated     :   2019-07-08 13:46 by Detective Conan 
*  Changes     :
*/

import 'package:get_it/get_it.dart';
import 'package:mt_carmel_app/src/core/models/login_model.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => LoginModel());
}