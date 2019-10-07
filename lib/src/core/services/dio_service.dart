/*
*   Filename    :   dio_service.dart
*   Purpose     :   Use to cache the url responses
*   Created     :   30/09/2019 10:37 AM by Detective Conan
*   Updated     :   30/09/2019 10:37 AM by Detective Conan
*   Changes     :   
*/

import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:dio/dio.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';

class DioService {
  Dio _dio;

  DioCacheManager manager =
      DioCacheManager(CacheConfig(baseUrl: "${AppConstants.API_BASE_URL}"));

  DioService() {
    manager.clearExpired();
  }

  Dio getDio({header: "application/x-www-form-urlencoded", charset: "utf-8"}) {
    if (_dio == null) {
      _dio = Dio(BaseOptions(
          baseUrl: "${AppConstants.API_BASE_URL}",
          contentType: "$header; charset=$charset"))
        ..interceptors.add(manager.interceptor)
        ..interceptors.add(LogInterceptor(responseBody: true));
    }
    return _dio;
  }
}
