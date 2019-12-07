/*
*  Filename    :   service_locator.dart
*  Purpose     :	 Initialization of services
*  Created     :   2019-07-08 13:46 by Detective Conan
*  Updated     :   2019-07-12 11:41 by Detective conan
*  Changes     :   Removed initialization for PostService
*/

import 'package:get_it/get_it.dart';
import 'package:mt_carmel_app/src/core/models/login_model.dart';
import 'package:mt_carmel_app/src/core/services/about_service.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/branch_list_service.dart';
import 'package:mt_carmel_app/src/core/services/branch_locations_service.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/contact_detail_service.dart';
import 'package:mt_carmel_app/src/core/services/crud_service.dart';
import 'package:mt_carmel_app/src/core/services/dio_service.dart';
import 'package:mt_carmel_app/src/core/services/location_map_service.dart';
import 'package:mt_carmel_app/src/core/services/module_list_service.dart';
import 'package:mt_carmel_app/src/core/services/news_feed_service.dart';
import 'package:mt_carmel_app/src/core/services/carmelites_service.dart';

//import 'package:mt_carmel_app/src/core/services/profiles_api/mass_request_service.dart';
//import 'package:mt_carmel_app/src/core/services/profiles_api/prayer_request_service.dart';
import 'package:mt_carmel_app/src/core/services/church_regular_schedule_service.dart';
import 'package:mt_carmel_app/src/core/services/profile_feature_service.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/individual_baptism_service.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/liturgical_service.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/mass_request_service.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/module_model_service.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/prayer_request_service.dart';
import 'package:mt_carmel_app/src/core/services/repositories/address_repository.dart';
import 'package:mt_carmel_app/src/core/services/selection_service.dart';
import 'package:mt_carmel_app/src/core/services/church_modules_service.dart';
import 'package:mt_carmel_app/src/core/services/send_help_service.dart';

//import 'package:mt_carmel_app/src/core/services/transaparency_service.dart';
import 'package:mt_carmel_app/src/core/services/user_authentication_api.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/user_profile_service.dart';
import 'package:mt_carmel_app/src/models/profile_feature.dart';
//import 'package:mt_carmel_app/src/models/location_map.dart';

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
  locator.registerLazySingleton(() => ChurchRegularScheduleService());
  locator.registerLazySingleton(() => NewsFeedService());
  locator.registerLazySingleton(() => BranchService());
  locator.registerLazySingleton(() => ChurchModuleService());
  locator.registerLazySingleton(() => SendHelpService());
//  locator.registerLazySingleton(() => TransparencyService());
  locator.registerLazySingleton(() => BranchListService());
  locator.registerLazySingleton(() => CarmelitesService());
  locator.registerLazySingleton(() => LocationMapService());
  locator.registerLazySingleton(() => AboutService());
  locator.registerLazySingleton(() => ContactDetailService());
  locator.registerLazySingleton(() => BranchLocationsService());
  locator.registerLazySingleton(() => DioService());
  locator.registerLazySingleton(() => ProfileFeatureService());
  locator.registerLazySingleton(() => LiturgicalService());
//  locator.registerLazySingleton(() => IndividualBaptismService());
  locator.registerLazySingleton(() => ModuleModelService());
}
