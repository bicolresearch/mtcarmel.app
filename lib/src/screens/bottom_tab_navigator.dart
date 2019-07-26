/*
*  Filename    :   bottom_tab_navigator.dart
*  Purpose     :	 Responsible for navigation from different tabs.
*  Created     :   2019-07-05 10:21 by Detective Conan
*  Updated     :   2019-07-26 15:23 by Detective conan
*  Changes     :   Added dialog when pressing the back button of android
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
          _body = FeedScreen(context);
          break;
        case 1:
          _body = SendHelpScreen(context);
          break;
        case 2:
          _body = ServicesScreen(context);
          break;
        case 3:
          _body = TransparencyScreen(context);
          break;
        default:
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
    return WillPopScope(
      child: Scaffold(
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
        ),
      ),
      onWillPop: () async {
        bool exit = await _exitDialog();
        return exit;
      },
    );
  }

  Future<bool> _exitDialog() {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: ListTile(
          title: Text("Would you like to close the app?"),
          leading: Icon(
            Icons.help,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Yes'),
            onPressed: () {
              Navigator.pop(context,true);
            },
          ),
          FlatButton(
            child: Text('No'),
            onPressed: () {
              Navigator.pop(context,false);
            },
          ),
        ],
      ),
    );
  }
}
