/*
*   Filename    :   home_bottom_navigator.dart
*   Purpose     :
*   Created     :   04/09/2019 2:36 PM by Detective Conan
*   Updated     :   04/09/2019 2:36 PM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/news_feed_bloc/news_feed_bloc.dart';
import 'package:mt_carmel_app/src/blocs/news_feed_bloc/news_feed_event.dart';
import 'package:mt_carmel_app/src/blocs/services_bloc/services_bloc.dart';
import 'package:mt_carmel_app/src/blocs/services_bloc/services_event.dart';
import 'package:mt_carmel_app/src/blocs/tab_bloc/tab.dart';
import 'package:mt_carmel_app/src/screens/feeds_screens/news_feed_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/profile_screen.dart';
import 'package:mt_carmel_app/src/screens/send_help_screens/send_help_screen.dart';
import 'package:mt_carmel_app/src/screens/services_screens/services_page.dart';
import 'package:mt_carmel_app/src/screens/tab_selector.dart';
import 'package:mt_carmel_app/src/screens/transparency_screens/transparency_screen.dart';

class HomeBottomNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabBloc = BlocProvider.of<TabBloc>(context);
    return BlocBuilder<TabBloc, AppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          body: _activeTab(context, activeTab),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) => tabBloc.dispatch(UpdateTab(tab)),
          ),
        );
      },
    );
  }

  _activeTab(context, AppTab activeTab) {
    switch(activeTab){

      case AppTab.NewsFeed:
        final bloc = BlocProvider.of<NewsFeedBloc>(context);
        bloc.dispatch(FetchFeed());
        return NewsFeedScreen();
      case AppTab.SendHelp:
        return SendHelpScreen();
      case AppTab.Services:
        final bloc = BlocProvider.of<ServicesBloc>(context);
        bloc.dispatch(FetchServices());
        return ServicesPage();
      case AppTab.Transparency:
        return TransparencyScreen();
      case AppTab.Profile:
        return ProfileScreen();
    }
  }
}
