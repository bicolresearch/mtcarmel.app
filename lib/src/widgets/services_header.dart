/*
*  Filename    :   services_header.dart
*  Purpose     :
*  Created     :   2019-07-12 16:49 by Detective Conan
*  Updated     :   2019-07-15 09:42 by Detective conan
*  Changes     :   Replaced the textStyle constants with Inherited provider
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';

Widget servicesHeader(context) {
  return Column(
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(top: 24.0, bottom: 5.0),
        width: double.infinity,
        child: Text(
          'The Services',
          style: Theme.of(context)
              .primaryTextTheme
              .title
              .copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
        width: double.infinity,
        child: Text(
          AppConstants.NATIONAL_SHRINE_TEXT,
          style: Theme.of(context)
              .primaryTextTheme
              .caption
              .copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
