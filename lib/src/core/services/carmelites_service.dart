/*
*   Filename    :   carmelites_service.dart
*   Purpose     :   Used for different carmelite such as priests, pastors and nun
*	 Updated			:   02/10/2019 9:03 AM PM by Detective Conan
*	 Changes			:   Added timeout on request.
*/

import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/dio_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'package:mt_carmel_app/src/models/data_carmelite.dart';
import 'package:mt_carmel_app/src/models/carmelite.dart';
import 'dart:convert';

enum CarmeliteType {
  PRIEST,
  PASTOR,
  NUN,
}

class CarmelitesService {
  Future<List<Carmelite>> getCarmelites(CarmeliteType carmeliteType) async {
    final typeId = _getTypeId(carmeliteType);
    final keyword = _getKeyword(carmeliteType);
    final hasConnection = await ConnectivityChecker.hasDataConnection();

    final branchId = await locator<BranchService>().branch.id;
    var response;

    final url =
        "${AppConstants.API_BASE_URL}${AppConstants.CARMELITES_JSON_URL}contact/?branch_id=$branchId&id=$branchId?type_id=$typeId";
    var dio = locator<DioService>().getDio();

    try {
      response = await dio
          .get(
            "$url",
            queryParameters: {'k': keyword},
            options: buildCacheOptions(
                Duration(days: AppConstants.CACHE_DURATION),
                forceRefresh: true,
                subKey: "page=$branchId"),
          )
          .timeout(
            Duration(seconds: 5),
          );
    } catch (e) {
      print(e);
      if (!hasConnection)
        throw Exception('CarmelitesService.getCarmelites: No connection');
      throw Exception(
          'CarmelitesService.getCarmelites:  Error requesting CarmelitesService: $e');
    }

    if (response.statusCode == 200) {
      try {
        final body = json.decode("$response");
        return DataCarmelite.fromJson(body).data.where((carmelite) {
          return carmelite.typeId == typeId;
        }).toList();
      } catch (e) {
        print(e);
        throw Exception("CarmelitesService.getCarmelites: $e");
      }
    } else {
      print(response.statusCode);
      throw Exception(
          "CarmelitesService.getCarmelites: statusCode ${response.statusCode}");
    }
  }

  String _getTypeId(CarmeliteType carmeliteType) {
    switch (carmeliteType) {
      case CarmeliteType.PRIEST:
        return "107";
      case CarmeliteType.PASTOR:
        return "108";
      case CarmeliteType.NUN:
      // TODO fallthrough add implementation when Nun is ready
      default:
        throw Exception("No Carmelite type match");
    }
  }

  _getKeyword(CarmeliteType carmeliteType) {
    switch (carmeliteType) {
      case CarmeliteType.PRIEST:
        return "priest";
      case CarmeliteType.PASTOR:
        return "pastor";
      case CarmeliteType.NUN:
      // TODO fallthrough add implementation when Nun is ready
      default:
        throw Exception("No Carmelite type match");
    }
  }
}
