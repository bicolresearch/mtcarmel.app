/*
*   Filename	:   tab_navigator.dart
*   Purpose		:   Navigates to different tabs
*   Created		:   05/21/2019 by Conan
*   Updated		:   06/04/2019 by Conan
*   Changes		:   Added comments
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
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          FeedScreen(context),
          SendHelpScreen(context),
          ServicesScreen(context),
          TransparencyScreen(context),
          ProfileScreen(context),
        ],
        controller: controller,
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: SafeArea(
          child: TabBar(
            indicatorColor: Color.fromARGB(0, 0, 0, 0),
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
            controller: controller,
            //onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
