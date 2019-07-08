/*
*	 Filename		 :	feeds_screen.dart
*	 Purpose		 :	Displays the news feed such as photos, videos
*  Created		 :  2019-06-04 16:28:01 by Detective Conan
*  Updated     :  2019-07-05 11:42 by Detective conan
*  Changes     :  Implemented swipe refreshing.
*/

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'package:mt_carmel_app/src/helpers/data_loading_status.dart';
import 'package:mt_carmel_app/src/models/feed.dart';

import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';
import 'dart:async';
import 'dart:convert';

import 'package:mt_carmel_app/src/screens/calendar.dart';
import 'package:mt_carmel_app/src/screens/feeds_screens/feed_detail_screen.dart';
import 'package:mt_carmel_app/src/screens/feeds_screens/youtube_player_screen.dart';
import 'package:mt_carmel_app/src/widgets/error_message.dart';
import 'package:mt_carmel_app/src/widgets/failed_message.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class FeedScreen extends StatefulWidget {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  FeedScreen(BuildContext context);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<Feed> _feedList = [];

  DataLoadingStatus _dataLoadingStatusStatus =
      DataLoadingStatus.ConnectivityChecking;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    print("initializing feed screen...");
    super.initState();
    ConnectivityChecker.hasDataConnection().then((value) {
      if (value && value != null) {
        _dataLoadingStatusStatus = DataLoadingStatus.LoadingData;
        this.getFeedData();
      } else {
        _dataLoadingStatusStatus = DataLoadingStatus.ConnectionFailed;
        setState(() {

        });
      }
    });
  }

  @override
  void dispose() {
    print("disposing feed screen");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text(
            "The Basilica",
            style: TextStyle(color: Colors.brown),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          actions: <Widget>[
            Center(
              child: GestureDetector(
                onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
//                          builder: (context) => VideoScreen(),
                          builder: (context) => YoutubePlayerScreen(),
//                        builder: (context) => VideoExample(),
                        ),
                      )
                    },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Live",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),
              ),
            ),
            Divider(),
            Container(
              child: GestureDetector(
                onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CalendarPage(),
                        ),
                      )
                    },
                child: Icon(
                  MountCarmelIcons.calendar,
                  color: Colors.brown,
                ),
              ),
              padding: EdgeInsets.only(right: 20.0),
            ),
          ],
        ),
        body: Center(
          child: (_dataLoadingStatusStatus ==
                  DataLoadingStatus.ConnectionFailed)
              ? ErrorMessage.errMsg(errorMessage: ErrorMessageEnum.NoInternetError)
              : ((_dataLoadingStatusStatus == DataLoadingStatus.LoadingData) ||
                      (_dataLoadingStatusStatus ==
                          DataLoadingStatus.ConnectivityChecking))
                  ? LoadingIndicator()
                  : Container(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 10, right: 10),
                      child: RefreshIndicator(
                        key: _refreshIndicatorKey,
                        onRefresh: _refresh,
                        child: _feedList.isNotEmpty
                            ? ListView.builder(
                                itemCount: _feedList.length,
                                itemBuilder: (context, index) {
                                  try {
                                    return _feedContent(_feedList[index]);
                                  } catch (e) {
                                    print(e.toString());
                                  }
                                })
                            : ErrorMessage.errMsg(errorMessage: ErrorMessageEnum.NoInternetError),
                      ),
                    ),
        ),
      ),
    );
  }

  Future<void> getFeedData() async {
    var response = await http.get(AppConstants.FEEDS_JSON_URL);
    if (this.mounted) {
      setState(() {
        if (response.statusCode == 200) {
          _feedList = (json.decode(response.body) as List)
              .map((data) => new Feed.fromJson(data))
              .toList();
        } else {
          print(response.statusCode);
          _dataLoadingStatusStatus = DataLoadingStatus.ConnectionFailed;
        }
        _dataLoadingStatusStatus = DataLoadingStatus.SuccessfulDataLoading;
      });
    }
  }

  Widget _feedContent(Feed feed) {
    if (_dataLoadingStatusStatus == DataLoadingStatus.ConnectionFailed ||
        feed == null) return Container();

    String url = AppConstants.API_BASE_URL + feed.coverPhoto;
    try {
      FadeInImage.assetNetwork(
        fadeInCurve: Curves.bounceIn,
        image: url,
        placeholder: AppConstants.MT_CARMEL_LOGO_PATH,
      );
    } catch (e) {
      print(e.toString() + "feeds");
      return Container();
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      height: 250,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.20),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: GestureDetector(
          onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeedDetailScreen(feed),
                  ),
                ),
              },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    feed.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 260,
                  child: CachedNetworkImage(
                      key: Key(url.replaceAll("/", "")),
                      imageUrl: url,
                      placeholder: (context, url) => LoadingIndicator(),
                      errorWidget: (context, url, error) =>
                          new Icon(Icons.error),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                height: 50.0,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _noTags(feed.content),
                  style: AppConstants.OPTION_STYLE1,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _noTags(String content) {
    String newText = content;
    newText = newText
        .replaceAll("<p>", "")
        .replaceAll("</p>", "")
        .replaceAll("/br", "");
    return newText;
  }

  Future<void> _refresh() {
    return this.getFeedData().then((_feedList) {
      this.setState(() {});
    });
  }


}
