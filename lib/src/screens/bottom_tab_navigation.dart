/*
*  Filename    :   bottom_tab_navigation.dart
*  Purpose     :	 Responsible for navigation from different tabs.
*  Created     :   2019-07-05 10:21 by Detective Conan
*  Updated     :   2019-07-05 10:21 by Detective Conan 
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';
import 'package:mt_carmel_app/src/screens/feeds_screens/feeds_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/profile_screen.dart';
import 'package:mt_carmel_app/src/screens/send_help_screens/send_help_screen.dart';
import 'package:mt_carmel_app/src/screens/services_screens/services_screen.dart';
import 'package:mt_carmel_app/src/screens/transparency_screens/transparency_screen.dart';

class BottomTabNavigator extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<BottomTabNavigator> {
  int _cIndex = 0;
  Widget _body = Container();

  void _updateTab(index) {
    setState(() {
      _cIndex = index;
      switch (index) {
        case 0:
          print(index);
          _body = FeedScreen(context);
          break;
        case 1:
          print(index);
          _body = SendHelpScreen(context);
          break;
        case 2:
          print(index);
          _body = ServicesScreen(context);
          break;
        case 3:
          print(index);
          _body = TransparencyScreen(context);
          break;
        default:
          print(index);
          _body = ProfileScreen(context);
      }
    });
  }

  @override
  void initState() {
    _updateTab(_cIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double iconBarTopPadding = 12.0;
    return Scaffold(
        body: _body,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _cIndex,
          selectedItemColor: Colors.brown[600],
          unselectedItemColor: Colors.brown[200],
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: iconBarTopPadding),
                child: Icon(
                  MountCarmelIcons.home,
                ),
              ),
              title: new Text(''),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: iconBarTopPadding),
                child: Icon(
                  MountCarmelIcons.sendhelp,
                ),
              ),
              title: new Text(''),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: iconBarTopPadding),
                child: Icon(
                  MountCarmelIcons.services,
                ),
              ),
              title: new Text(''),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: iconBarTopPadding),
                child: Icon(
                  MountCarmelIcons.transparency,
                ),
              ),
              title: new Text(''),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: iconBarTopPadding),
                child: Icon(
                  MountCarmelIcons.profile,
                ),
              ),
              title: new Text(''),
            )
          ],
          onTap: (index) {
            _updateTab(index);
          },
        ));
  }
}
