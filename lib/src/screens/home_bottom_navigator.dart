/*
*   Filename    :   home_bottom_navigator.dart
*   Purpose     :
*   Created     :   04/09/2019 2:36 PM by Detective Conan
*	 Updated			:   05/11/2019 3:06 PM PM by Detective Conan
*	 Changes			:   Updates the Apptab each selectec apptab.
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/news_feed_bloc/news_feed_bloc.dart';
import 'package:mt_carmel_app/src/blocs/news_feed_bloc/news_feed_event.dart';
import 'package:mt_carmel_app/src/blocs/profile_feature_bloc/profile_feature_bloc.dart';
import 'package:mt_carmel_app/src/blocs/profile_feature_bloc/profile_feature_event.dart';
import 'package:mt_carmel_app/src/blocs/send_help_bloc/send_help_bloc.dart';
import 'package:mt_carmel_app/src/blocs/send_help_bloc/send_help_event.dart';
import 'package:mt_carmel_app/src/blocs/services_bloc/services_bloc.dart';
import 'package:mt_carmel_app/src/blocs/services_bloc/services_event.dart';
import 'package:mt_carmel_app/src/blocs/tab_bloc/tab.dart';

//import 'package:mt_carmel_app/src/blocs/transparency_bloc/transparency_bloc.dart';
import 'package:mt_carmel_app/src/screens/feeds_screens/news_feed_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/profile_page.dart';
import 'package:mt_carmel_app/src/screens/send_help_screens/send_help_page.dart';
import 'package:mt_carmel_app/src/screens/services_screens/services_page.dart';
import 'package:mt_carmel_app/src/screens/tab_selector.dart';

//import 'package:mt_carmel_app/src/screens/transparency_screens/transparency_page.dart';
//import 'package:mt_carmel_app/src/blocs/transparency_bloc/transparency_event.dart';

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
    final tabBloc = BlocProvider.of<TabBloc>(context);
    tabBloc.dispatch(UpdateTab(activeTab));
    switch (activeTab) {
      case AppTab.NewsFeed:
        return BlocProvider<NewsFeedBloc>(
            builder: (context) => NewsFeedBloc()..dispatch(FetchFeed()),
            child: NewsFeedScreen());
      case AppTab.SendHelp:
        return BlocProvider<SendHelpBloc>(
            builder: (context) => SendHelpBloc()..dispatch(FetchSendHelp()),
            child: SendHelpPage());
      case AppTab.Services:
        return BlocProvider<ServicesBloc>(
            builder: (context) => ServicesBloc()..dispatch(FetchServices()),
            child: ServicesPage());
//      case AppTab.Transparency:
//        final bloc = BlocProvider.of<TransparencyBloc>(context);
//        bloc.dispatch(FetchTransparency());
//        return TransparencyPage();
      case AppTab.Profile:
        return BlocProvider<ProfileFeatureBloc>(
            builder: (context) =>
                ProfileFeatureBloc()..dispatch(FetchProfileFeature()),
            child: ProfilePage());
    }
  }
}
