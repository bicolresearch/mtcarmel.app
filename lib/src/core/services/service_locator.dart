/*
*  Filename    :   service_locator.dart
*  Purpose     :	 Initialization of services
*  Created     :   2019-07-08 13:46 by Detective Conan
*  Updated     :   2019-07-12 11:41 by Detective conan
*  Changes     :   Removed initialization for PostService
*/

import 'package:get_it/get_it.dart';
import 'package:mt_carmel_app/src/core/models/login_model.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/user_authentication_api.dart';
import 'package:mt_carmel_app/src/core/services/user_profile_service.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.allowReassignment = true;
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => UserAuthenticationApi());
  locator.registerLazySingleton(() => LoginModel());
  locator.registerLazySingleton(() => UserProfileService());
}
