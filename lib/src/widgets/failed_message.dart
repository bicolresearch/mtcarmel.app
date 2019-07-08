/*
*  Filename    :   failed_message.dart.dart
*  Purpose     :   Displays message failure
*  Created     :   2019-07-02 09:33 by Detective Conan
*  Updated     :   2019-07-02 09:33 by Detective Conan 
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';

Widget failedMessage() {
//  return Center(
////      child: Padding(
////    padding: const EdgeInsets.all(40.0),
////    child: Text(
////      "No results. Please check the network connection",
////      style: AppConstants.OPTION_STYLE2,
////      textAlign: TextAlign.center,
////    ),
////  ));

 return Center(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Icon(Icons.perm_scan_wifi, size: 64.0, color: Colors.brown,),
            Text("No internet connection.", style: AppConstants.OPTION_STYLE2, textAlign: TextAlign.center, ),
          ],
        ),
      ));
}
