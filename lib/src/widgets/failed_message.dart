/*
*  Filename    :   failed_message.dart.dart
*  Purpose     :   Displays message failure
*  Created     :   2019-07-02 09:33 by Detective Conan
*  Updated     :   2019-07-15 09:43 by Detective conan
*  Changes     :   Replaced the textStyle constants with Inherited provider.
*                  Added BuildContext parameter
*/

import 'package:flutter/material.dart';

Widget failedMessage(BuildContext context) {

 return Center(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Icon(Icons.perm_scan_wifi, size: 64.0, color: Colors.brown,),
            Text("No internet connection.", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead, textAlign: TextAlign.center, ),
          ],
        ),
      ));
}
