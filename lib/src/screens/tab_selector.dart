/*
*  Filename    :   tab_selector.dart
*  Purpose     :	 Responsible for navigation from different tabs.
*  Created     :   2019-07-05 10:21 by Detective Conan
*	 Updated			:   04/09/2019 3:40 PM PM by Detective Conan
*	 Changes			:   Implemented bloc on bottom navigation.
*	 */

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/blocs/tab_bloc/tab.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';
import 'package:mt_carmel_app/src/utils/app_keys.dart';

class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  TabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(AppTab.values);
    return BottomNavigationBar(
      key: AppKeys.tabs,
      currentIndex: AppTab.values.indexOf(activeTab),
      selectedItemColor: Colors.brown[600],
      unselectedItemColor: Colors.brown[200],
      type: BottomNavigationBarType.fixed,
      onTap: (index) => onTabSelected(AppTab.values[index]),
      items: AppTab.values.map((tab) => _bottomNavigationBarItem(tab)).toList(),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(AppTab tab) {
    switch (tab) {
      case AppTab.NewsFeed:
        return BottomNavigationBarItem(
          icon: Icon(
            MountCarmelIcons.home,
            key: AppKeys.newsFeedTab,
          ),
          title: Text(""),
        );
      case AppTab.SendHelp:
        return BottomNavigationBarItem(
          icon: Icon(
            MountCarmelIcons.sendhelp,
            key: AppKeys.sendHelpTab,
          ),
          title: Text(""),
        );
      case AppTab.Services:
        return BottomNavigationBarItem(
          icon: Icon(
            MountCarmelIcons.services,
            key: AppKeys.servicesTab,
          ),
          title: Text(""),
        );
      case AppTab.Transparency:
        return BottomNavigationBarItem(
          icon: Icon(
            MountCarmelIcons.transparency,
            key: AppKeys.transparencyTab,
          ),
          title: Text(""),
        );
      case AppTab.Profile:
        return BottomNavigationBarItem(
          icon: Icon(
            MountCarmelIcons.profile,
            key: AppKeys.profileTab,
          ),
          title: Text(""),
        );
      default:
        return BottomNavigationBarItem(
          icon: Icon(
            MountCarmelIcons.home,
            key: AppKeys.newsFeedTab,
          ),
          title: Text(""),
        );
    }
  }
}
