/*
*   Filename    :   news_feed_bloc.dart
*   Purpose     :
*   Created     :   04/09/2019 7:11 PM by Detective Conan
*	 Updated			:   10/09/2019 9:29 AM PM by Detective Conan
*	 Changes			:   The not loaded state will not throw on when list of post is already loaded.
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/news_feed_bloc/news_feed_event.dart';
import 'package:mt_carmel_app/src/blocs/news_feed_bloc/news_feed_state.dart';
import 'package:mt_carmel_app/src/core/services/news_feed_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/shared_preference_helper.dart';
import 'package:mt_carmel_app/src/models/feed.dart';

class NewsFeedBloc extends Bloc<NewsFeedEvent, NewsFeedState> {
  List<String> _postIds = [];

  NewsFeedBloc();

  @override
  NewsFeedState get initialState => FeedUninitialized();

  @override
  Stream<NewsFeedState> mapEventToState(NewsFeedEvent event) async* {
    if (event is FetchFeed) {
      bool isResetBranch = await SharedPreferencesHelper.getResetBranch();
      if (isResetBranch) _postIds.clear();
      try {



        if (_postIds.isEmpty) yield FeedLoading();
        final feed = await locator<NewsFeedService>().getFeed();
        if (feed != null) {
          if (_hasFeedChanged(feed)) {
            await SharedPreferencesHelper.setResetBranch(false);
            yield FeedLoaded(feed);
          }  else if (_postIds.isEmpty) {
            if (isResetBranch) {
//              await SharedPreferencesHelper.setResetBranch(false);
              yield FeedNoPost();
            }
            //yield FeedNotChanged();
          }
        } else
          yield FeedErrorLoading();
      } catch (e) {
        if (e.toString().contains("No connection")) {
          yield FeedNoConnection();
          return;
        }
        yield FeedErrorLoading();
      }
    }
    if (event is RefreshFeed) {
      try {
//        yield FeedRefreshing();
        final feed = await locator<NewsFeedService>().getFeed();
        if (feed != null) {
          if (_hasFeedChanged(feed)) {
            yield FeedLoaded(feed);
          } else {
            if (_postIds.isEmpty) yield FeedNotChanged();
          }
        } else {
          if (_postIds.isEmpty) yield FeedErrorLoading();
        }
      } catch (e) {
        if (_postIds.isEmpty) yield FeedErrorLoading();
      }
    }
  }

  bool _hasFeedChanged(Feed feed) {
    bool changed = false;
    List<String> newIds = [];
    for (var post in feed.data) {
      newIds.add(post.id);
      if (!_postIds.contains(post.id)) {
        changed = true;
      }
    }
    if (changed) {
      _postIds = newIds;
    }
    return changed;
  }
}
