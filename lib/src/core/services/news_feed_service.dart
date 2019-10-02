/*
*  Filename    :   news_feed_service.dart
*  Purpose     :	 Service for news feeds
*  Created     :   2019-07-12 11:12 by Detective Conan
*	 Updated			:   02/10/2019 9:03 AM PM by Detective Conan
*	 Changes			:   Added timeout on request.
*/

import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/dio_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'dart:convert';

import 'package:mt_carmel_app/src/models/feed.dart';

class NewsFeedService {
  Future<Feed> getFeed() async {
    final _keyword = "news_feed";
    final hasConnection = await ConnectivityChecker.hasDataConnection();

    Feed _feed;
    final branchId = await locator<BranchService>().branch.id;

    final url =
        "${AppConstants.API_BASE_URL}${AppConstants.FEEDS_JSON_URL}?branch_id=$branchId";

    var dio = locator<DioService>().getDio();

    var response;

    try {
      response = await dio
          .get(
            "$url",
            queryParameters: {'k': _keyword},
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
        throw Exception('NewsFeedService.getData: No connection');
      throw Exception(
          'NewsFeedService.getData:  Error requesting NewsFeed: $e');
    }

    if (response.statusCode == 200) {
      try {
        final body = json.decode("$response");
        _feed = Feed.fromJson(body);
      } catch (e) {
        print(e);
        throw Exception("NewsFeedService.getData: $e");
      }
    } else {
      print(response.statusCode);
      throw Exception(
          "NewsFeedService.getData: statusCode ${response.statusCode}");
    }

    return _feed;
  }
}
