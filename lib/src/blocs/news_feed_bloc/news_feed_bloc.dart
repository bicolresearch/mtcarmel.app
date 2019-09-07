/*
*   Filename    :   news_feed_bloc.dart
*   Purpose     :
*   Created     :   04/09/2019 7:11 PM by Detective Conan
*   Updated     :   04/09/2019 7:11 PM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/news_feed_bloc/news_feed_event.dart';
import 'package:mt_carmel_app/src/blocs/news_feed_bloc/news_feed_state.dart';
import 'package:mt_carmel_app/src/core/services/news_feed_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/feed.dart';

class NewsFeedBloc extends Bloc<NewsFeedEvent, NewsFeedState> {
  final branchId;
  List<String> _postIds = [];

  NewsFeedBloc(this.branchId);

  @override
  NewsFeedState get initialState => FeedUninitialized();

  @override
  Stream<NewsFeedState> mapEventToState(NewsFeedEvent event) async* {
    if (event is FetchFeed) {
      try {
        yield FeedLoading();
        final feed = await locator<NewsFeedService>().getFeed();
        if (feed != null) {
          if (_hasFeedChanged(feed))
            yield FeedLoaded(feed);
          else
            yield FeedNotChanged();
        } else
          yield FeedErrorLoading();
      } catch (e) {
        yield FeedErrorLoading();
      }
    }
    if(event is RefreshFeed){
      try {
//        yield FeedRefreshing();
        final feed = await locator<NewsFeedService>().getFeed();
        if (feed != null) {
          if (_hasFeedChanged(feed)) {
            yield FeedLoaded(feed);
          }
          else {
//            yield FeedNotChanged();
          }
        } else {
//          yield FeedErrorLoading();
        }
      } catch (e) {
        print("NewsFeedBloc:mapEventToStat() $e");
//        yield FeedErrorLoading();
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
    if(changed){
      _postIds = newIds;
    }
    return changed;
  }
}