/*
*	 Filename		 :	 feeds_screen.dart
*	 Purpose		 :	 Displays the news feed such as photos, videos
*  Created		 :   2019-06-04 16:28:01 by Detective Conan
*  Updated     :   2019-07-23 12:57 by Detective conan
*  Changes     :   Put ellipsis on overflow of post description
*/

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/post_service.dart';
import 'package:mt_carmel_app/src/helpers/connectivity_checker.dart';
import 'package:mt_carmel_app/src/helpers/data_loading_status.dart';
import 'package:mt_carmel_app/src/models/feed.dart';

import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';
import 'dart:async';

import 'package:mt_carmel_app/src/screens/calendar.dart';
import 'package:mt_carmel_app/src/screens/feeds_screens/feed_detail_screen.dart';
import 'package:mt_carmel_app/src/screens/feeds_screens/youtube_player_screen.dart';
import 'package:mt_carmel_app/src/widgets/error_message.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen(BuildContext context);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  Feed _feed;

  DataLoadingStatus _dataLoadingStatus = DataLoadingStatus.ConnectivityChecking;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    print("initializing feed screen...");
    super.initState();
    _loadFeeds();
  }

  void _loadFeeds() {
    ConnectivityChecker.hasDataConnection().then(
      (value) {
        if (value && value != null) {
          _dataLoadingStatus = DataLoadingStatus.LoadingData;
          _getFeedData();
          if (this.mounted) setState(() {});
        } else {
          _dataLoadingStatus = DataLoadingStatus.ConnectionFailed;
          if (this.mounted) setState(() {});
        }
      },
    ).catchError(
      (e) {
        debugPrint("FeedScreen._loadFeeds: $e ");
      },
    );
  }

  @override
  void dispose() {
    print("disposing feed screen");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _feedScaffold(),
    );
  }

  Future<void> _getFeedData() async {
    PostService postService = PostService();
    await postService.getFeed().then(
      (feed) {
        if (feed == null)
          _dataLoadingStatus = DataLoadingStatus.LoadingFailed;
        else {
          _feed = feed;
          _dataLoadingStatus = DataLoadingStatus.SuccessfulDataLoading;
          if (this.mounted) setState(() {});
        }
      },
    ).catchError(
      (e) {
        debugPrint("FeedScreen._getFeeds: $e");
        _dataLoadingStatus = DataLoadingStatus.LoadingFailed;
        if (this.mounted) setState(() {});
      },
    );
  }

  Widget _feedScaffold() {
    switch (_dataLoadingStatus) {
      case DataLoadingStatus.ConnectionFailed:
        return ErrorMessage.errMsg(
            errorMessage: ErrorMessageEnum.NoInternetError);
      case DataLoadingStatus.ConnectivityChecking:
      // fall through
      case DataLoadingStatus.LoadingData:
        return LoadingIndicator();
      case DataLoadingStatus.LoadingFailed:
        return ErrorMessage.errMsg(errorMessage: ErrorMessageEnum.LoadingError);
      case DataLoadingStatus.SuccessfulDataLoading:
        return Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text(
              "The Basilica",
              style: Theme.of(context)
                  .primaryTextTheme
                  .title
                  .copyWith(fontWeight: FontWeight.bold),
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
                        builder: (context) => YoutubePlayerScreen(),
                      ),
                    )
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Live",
                      style: Theme.of(context).primaryTextTheme.title.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.red),
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
          body: Center(child: _feeds()),
        );
    }
    return LoadingIndicator();
  }

  Widget _feeds() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
      child: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _getFeedData,
        child: ListView.builder(
          itemCount: _feed.data.length,
          itemBuilder: (context, index) {
            try {
              return _feedContent(_feed.data[index]);
            } catch (e) {
              debugPrint(e.toString());
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _feedContent(PostData postData) {
    if (_dataLoadingStatus == DataLoadingStatus.ConnectionFailed ||
        postData == null) return Container();

    String url = AppConstants.API_BASE_URL + postData.coverPhoto;
    try {
      FadeInImage.assetNetwork(
        fadeInCurve: Curves.bounceIn,
        image: url,
        placeholder: AppConstants.MT_CARMEL_LOGO_PATH,
      );
    } catch (e) {
      debugPrint("FeedScreen._feedContent: $e");
      return Container();
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      height: 250,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.20),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: GestureDetector(
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FeedDetailScreen(postData),
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
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    postData.title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .subhead
                        .copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 260,
                  child: CachedNetworkImage(
                      key: Key(url.replaceAll("/", "").replaceAll(".", "")),
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
                  html2md.convert(postData.content),
                  style: Theme.of(context).primaryTextTheme.subhead,
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
}
