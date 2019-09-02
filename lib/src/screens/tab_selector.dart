/*
*  Filename    :   tab_selector.dart
*  Purpose     :	 Responsible for navigation from different tabs.
*  Created     :   2019-07-05 10:21 by Detective Conan
*	 Updated			:   02/09/2019 9:29 AM PM by Detective Conan
*	 Changes			:   Renamed class.
*	 */

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';
import 'package:mt_carmel_app/src/screens/feeds_screens/feeds_screen.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/profile_screen.dart';
import 'package:mt_carmel_app/src/screens/send_help_screens/send_help_screen.dart';
import 'package:mt_carmel_app/src/screens/services_screens/services_screen.dart';
import 'package:mt_carmel_app/src/screens/transparency_screens/transparency_screen.dart';

class TabSelector extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<TabSelector> {
  int _cIndex = 0;
  Widget _body = Container();

  void _updateTab(index) {
    setState(() {
      _cIndex = index;
      switch (index) {
        case 0:
          _body = FeedScreen();
          break;
        case 1:
          _body = SendHelpScreen();
          break;
        case 2:
          _body = ServicesScreen();
          break;
        case 3:
          _body = TransparencyScreen();
          break;
        default:
          _body = ProfileScreen();
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
              icon: Icon(
                  MountCarmelIcons.home,
              ),
              title: new Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  MountCarmelIcons.sendhelp,
              ),
              title: new Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  MountCarmelIcons.services,
              ),
              title: new Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  MountCarmelIcons.transparency,
              ),
              title: new Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  MountCarmelIcons.profile,
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
