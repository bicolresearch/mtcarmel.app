/*
*  Filename    :   basic_message.dart
*  Purpose     :	 Abstract class for messages
*  Created     :   2019-07-05 16:44 by Detective Conan
*  Updated     :   2019-07-15 09:44 by Detective conan
*  Changes     :   Replaced the textStyle constants with Inherited provider
*/

import 'package:flutter/material.dart';

abstract class BasicMessage {
  static const TextStyle TITLE_TEXTSTYLE = TextStyle(
      color: Colors.brown,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: "Helvetica");

  static Widget message(
      {@required text,
      style,
      textAlign = TextAlign.center,
      icon}) {
    if (icon == null)
      return Center(
          child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Text(
          "$text",
          style: TITLE_TEXTSTYLE,
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
            style: TITLE_TEXTSTYLE,
            textAlign: textAlign,
          ),
        ],
      ),
    ));
  }
}
