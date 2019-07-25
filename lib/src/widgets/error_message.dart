/*
*  Filename    :   error_message.dart
*  Purpose     :	 Use to display error messages. Customizable
*  Created     :   2019-07-08 08:41 by Detective conan 
*  Updated     :   2019-07-08 09:29 by Detective conan
*  Changes     :   replaced the icon image when Loading failed.
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/widgets/basic_message.dart';

enum ErrorMessageEnum { NoInternetError, LoadingError, SomethingWrong }

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
      case ErrorMessageEnum.LoadingError:
        text = """No results found.
        Check internet connection.""";
        icon = Icon(
          Icons.event_busy,
          size: iconSize,
          color: iconColor,
        );
        break;
      default: //Something went wrong
        text = """Something went wrong.""";
        icon = Icon(
          Icons.error,
          size: iconSize,
          color: iconColor,
        );
        break;
    }
    return BasicMessage.message(text: text, icon: icon);
  }
}
