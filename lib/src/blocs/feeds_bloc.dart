import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import 'package:http/http.dart' as http;

// class FeedBloc{
//   Stream<List<Feed>> get feeds => _feedSubject.stream;

//   final _feedSubject = BehaviorSubject<List<Feed>>();

//   FeedBloc(){

//   }

//   List<int> _ids = [
//     1,
//     2,
//     3,
//     4,
//   ];

//   // Future<Feed> _getFeed(int id) async{
//   //   final feedUrl = '${AppConstants.FEEDS_JSON_URL}';
//   //   final feedRes = await http.get(feedUrl);
//   //   if (feedRes.body == 200){
//   //     return (feedRes.body);
//   //   }
//   // }

// }
