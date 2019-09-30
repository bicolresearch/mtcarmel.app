/*
*   Filename    :   dio_service.dart
*   Purpose     :   Use to cache the url responses
*   Created     :   30/09/2019 10:37 AM by Detective Conan
*   Updated     :   30/09/2019 10:37 AM by Detective Conan
*   Changes     :   
*/

import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';

class DioService {
  DioCacheManager manager =
      DioCacheManager(CacheConfig(baseUrl: "${AppConstants.API_BASE_URL}"));

  DioService() {
    manager.clearExpired();
  }
}
