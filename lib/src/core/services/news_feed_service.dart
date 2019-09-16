/*
*  Filename    :   news_feed_service.dart
*  Purpose     :	 Service for news feeds
*  Created     :   2019-07-12 11:12 by Detective Conan
*  Updated     :   2019-07-12 11:12 by Detective Conan 
*  Changes     :
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'dart:convert';

import 'package:mt_carmel_app/src/models/feed.dart';

class NewsFeedService {
  Future<Feed> getFeed() async {
    Feed _feed;
    final branchId = locator<BranchService>().branch.id;
    await http
        .get("${AppConstants.FEEDS_JSON_URL}/?branch_id=$branchId")
        .then(
          (value) {
            print(value);
            if (value.statusCode == 200) {
              final body = json.decode(value.body);
              _feed = Feed.fromJson(body);
            } else {
              print(value.statusCode);
              throw "Data error";
            }
          },
        )
        .timeout(
          Duration(seconds: 5),
        )
        .catchError(
          (e) {
            throw e;
          },
        );
    return _feed;
  }
}
