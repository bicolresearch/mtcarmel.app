/*
*  Filename    :   post_service.dart
*  Purpose     :	 Service for news feeds
*  Created     :   2019-07-12 11:12 by Detective Conan
*  Updated     :   2019-07-12 11:12 by Detective Conan 
*  Changes     :
*/

import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mt_carmel_app/src/models/feed.dart';

class PostService {
  Future<Feed> getFeed() async {
    Feed _feed;
    await http
        .get(AppConstants.FEEDS_JSON_URL)
        .then(
          (value) {
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
