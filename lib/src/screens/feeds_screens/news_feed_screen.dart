/*
*   Filename    :   news_feed_screen.dart
*   Purpose     :
*   Created     :   05/09/2019 10:30 AM by Detective Conan
*	 Updated			:   19/09/2019 2:15 PM PM by Detective Conan
*	 Changes			:   Moved the Branch name to the feed list view.
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/live_stream_bloc/live_stream_bloc.dart';
import 'package:mt_carmel_app/src/blocs/live_stream_bloc/live_stream_event.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/branch.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';

import 'package:mt_carmel_app/src/screens/feeds_screens/calendar.dart';
import 'package:mt_carmel_app/src/screens/feeds_screens/feed_list_view.dart';
import 'package:mt_carmel_app/src/screens/feeds_screens/live_stream_screen.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';

class NewsFeedScreen extends StatefulWidget {
  @override
  _NewsFeedScreenState createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstants.CARMEL_NAME,
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
            child: InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return BlocProvider<LiveStreamBloc>(
                        builder: (context) =>
                            LiveStreamBloc()..dispatch(FetchLiveStream()),
                        child: LiveStreamScreen());
                  }),
                )
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Live",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .title
                      .copyWith(fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ),
            ),
          ),
          Divider(),
          Container(
            child: InkWell(
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
            padding: const EdgeInsets.only(right: 20.0),
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
//            Container(
//              width: double.infinity,
//              margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
//              decoration: BoxDecoration(
//                color: Colors.brown,
//                border: Border.all(width: 0.0),
//                borderRadius: BorderRadius.circular(16.0),
//              ),
//              child: Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Text(
//                  "${branch.name}",
//                  style: Theme.of(context)
//                      .primaryTextTheme
//                      .subhead
//                      .copyWith(color: Colors.white),
//                  textAlign: TextAlign.center,
//                  softWrap: true,
//                ),
//              ),
//            ),
            Expanded(child: Container(child: FeedListView())),
          ],
        ),
      ),
    );
  }
}
