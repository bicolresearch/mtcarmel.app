/*
*   Filename    :   feed_list_view.dart
*   Purpose     :
*   Created     :   05/09/2019 10:58 AM by Detective Conan
*	 Updated			:   18/09/2019 1:31 PM PM by Detective Conan
*	 Changes			:   Added button for retry and reloading the posts.
*/

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/news_feed_bloc/news_feed_bloc.dart';
import 'package:mt_carmel_app/src/blocs/news_feed_bloc/news_feed_event.dart';
import 'package:mt_carmel_app/src/blocs/news_feed_bloc/news_feed_state.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/models/feed.dart';
import 'package:mt_carmel_app/src/screens/feeds_screens/feed_detail_screen.dart';
import 'package:mt_carmel_app/src/widgets/error_message.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';
import 'package:html2md/html2md.dart' as html2md;

class FeedListView extends StatefulWidget {
  @override
  _FeedListViewState createState() => _FeedListViewState();
}

class _FeedListViewState extends State<FeedListView> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NewsFeedBloc, NewsFeedState>(
        builder: (context, state) {
          if (state is FeedUninitialized) {
            return LoadingIndicator();
          }
          if (state is FeedLoading) {
            return LoadingIndicator();
          } else if (state is FeedLoaded) {
            final feed = state.feed;
            return _postsView(feed.data);
          } else if (state is FeedErrorLoading) {
            print("error loading");
            return Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(child: Text("Something went wrong!")),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    color: Colors.brown,
                    child: Text(
                      "Retry",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      BlocProvider.of<NewsFeedBloc>(context)
                          .dispatch(FetchFeed());
                    },
                  ),
                ],
              ),
            );
          } else if (state is FeedNoPost) {
            print("No posts at the moment!");
            return Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(child: Text("No posts at the moment.")),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    color: Colors.brown,
                    child: Text(
                      "Reload",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      BlocProvider.of<NewsFeedBloc>(context)
                          .dispatch(FetchFeed());
                    },
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _postsView(List<PostData> posts) {
    return Container(
      padding: EdgeInsets.all(10),
      child: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _getFeedData,
        child: ListView.builder(
          physics: ScrollPhysics(parent: ScrollPhysics()),
          shrinkWrap: true,
          itemCount: posts.length,
          itemBuilder: (context, index) {
            try {
              return _postContent(posts[posts.length - (index + 1)]);
            } catch (e) {
              debugPrint(e.toString());
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _postContent(PostData postData) {
    String url = AppConstants.API_BASE_URL + postData.mediaPath;
    try {
      FadeInImage.assetNetwork(
        fadeInCurve: Curves.bounceIn,
        image: url,
        placeholder: AppConstants.MT_CARMEL_LOGO_PATH,
      );
    } catch (e) {
      debugPrint("FeedView._postContent: $e");
      return Container();
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      height: 250,
      child: InkWell(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FeedDetailScreen(postData),
            ),
          ),
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 0.20),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
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
                      key: Key(postData.mediaId),
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
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _getFeedData() async {
    await Future.delayed(Duration(milliseconds: 300));
    BlocProvider.of<NewsFeedBloc>(context).dispatch(RefreshFeed());
  }
}
