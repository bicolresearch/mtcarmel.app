/*
* Filename	  : tab_navigator.dart
* Purpose		  : Navigates to different tabs
* Created		  : 2019-05-21 by Detective Conan
*	Updated			: 2019-07-04 13:33:26 by Scarlet Witch 
*	Changes			: removed SystemChrome.setEnabledSystemUIOverlays
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/screens/transparency_screens/transparency_screen.dart';
import '../presentations/mount_carmel_icons.dart';
import '..//screens/feeds_screens/feeds_screen.dart';
import '../screens/send_help_screens/send_help_screen.dart';
import '..//screens/services_screens/services_screen.dart';
import '../screens/profile_screens/profile_screen.dart';

class TabNavigator extends StatefulWidget {
  TabNavigator() : super();

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          FeedScreen(),
          SendHelpScreen(),
          ServicesScreen(),
          TransparencyScreen(),
          ProfileScreen(),
        ],
        controller: _controller,
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: SafeArea(
          child: TabBar(
            indicatorColor: Colors.transparent,
            unselectedLabelColor: Colors.brown[200],
            labelColor: Colors.brown,
            tabs: <Widget>[
              Tab(
                icon: Icon(MountCarmelIcons.home),
              ),
              Tab(
                icon: Icon(MountCarmelIcons.sendhelp),
              ),
              Tab(
                icon: Icon(MountCarmelIcons.services),
              ),
              Tab(
                icon: Icon(MountCarmelIcons.transparency),
              ),
              Tab(
                icon: Icon(MountCarmelIcons.profile),
              ),
            ],
            controller: _controller,
          ),
        ),
      ),
    );
  }
}
