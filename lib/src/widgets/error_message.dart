/*
*  Filename    :   error_message.dart
*  Purpose     :	 Use to display error messages. Customizable
*  Created     :   2019-07-08 08:41 by Detective conan 
*  Updated     :   2019-07-08 08:41 by Detective conan
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/widgets/basic_message.dart';

enum ErrorMessageEnum { NoInternetError, LoadingError }

class ErrorMessage extends BasicMessage {
  static double iconSize = 56.0;
  static Color iconColor = Colors.brown;

  static Widget errMsg({@required errorMessage}) {
    String text;
    Icon icon;
    switch (errorMessage) {
      case ErrorMessageEnum.NoInternetError:
        text = "No internet connection.";
        icon = Icon(
          Icons.perm_scan_wifi,
          size: iconSize,
          color: iconColor,
        );
        break;
      default:
        text = "No results found. Failure loading data.";
        icon = Icon(
          Icons.perm_scan_wifi,
          size: iconSize,
          color: iconColor,
        );
    }
    return BasicMessage.message(text: text, icon: icon);
  }
}
