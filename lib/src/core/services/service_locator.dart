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
import 'package:mt_carmel_app/src/core/services/crud_service.dart';
import 'package:mt_carmel_app/src/core/services/module_list_service.dart';
import 'package:mt_carmel_app/src/core/services/news_feed_service.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/mass_request_service.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/prayer_request_service.dart';
import 'package:mt_carmel_app/src/core/services/regular_church_schedule_service.dart';
import 'package:mt_carmel_app/src/core/services/repositories/address_repository.dart';
import 'package:mt_carmel_app/src/core/services/selection_service.dart';
import 'package:mt_carmel_app/src/core/services/user_authentication_api.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/user_profile_service.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.allowReassignment = true;
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => UserAuthenticationApi());
  locator.registerLazySingleton(() => LoginModel());
  locator.registerLazySingleton(() => UserProfileService());
  locator.registerLazySingleton(() => AddressRepository());
  locator.registerLazySingleton(() => ModuleListService());
  locator.registerLazySingleton(() => MassRequestService());
  locator.registerLazySingleton(() => PrayerRequestService());
  locator.registerLazySingleton(() => SelectionService());
  locator.registerLazySingleton(() => CrudService());
  locator.registerLazySingleton(() => RegularChurchScheduleService());
  locator.registerLazySingleton(() => NewsFeedService());

}
