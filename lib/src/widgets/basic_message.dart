/*
*  Filename    :   basic_message.dart
*  Purpose     :	 Abstract class for messages
*  Created     :   2019-07-05 16:44 by Detective Conan
*  Updated     :   2019-07-05 16:44 by Detective Conan 
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';

abstract class BasicMessage {
  static Widget message(
      {@required text,
      style = AppConstants.OPTION_STYLE2,
      textAlign = TextAlign.center,
      icon}) {
    if (icon == null)
      return Center(
          child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Text(
          "$text",
          style: style,
          textAlign: textAlign,
        ),
      ));
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icon,
          SizedBox(
            height: 10.0,
          ),
          Text(
            "$text",
            style: style,
            textAlign: textAlign,
          ),
        ],
      ),
    ));
  }
}
