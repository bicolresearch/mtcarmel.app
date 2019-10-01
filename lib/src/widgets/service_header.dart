/*
*  Filename    :   service_header.dart
*  Purpose     :
*  Created     :   2019-07-12 16:49 by Detective Conan
*	 Updated			:   25/09/2019 3:49 PM PM by Detective Conan
*	 Changes			:   Made Branch name dynamic
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/branch.dart';

class ServiceHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final String branchName = locator<BranchService>().branch.name;
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
          padding:
              EdgeInsets.only(top: 8.0, bottom: 12.0, left: 12.0, right: 12.0),
          width: double.infinity,
          child: Text(
            "$branchName",
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
}

//Widget servicesHeader(context) {
//  return Column(
//    children: <Widget>[
//      Container(
//        padding: EdgeInsets.only(top: 24.0, bottom: 5.0),
//        width: double.infinity,
//        child: Text(
//          'The Services',
//          style: Theme.of(context)
//              .primaryTextTheme
//              .title
//              .copyWith(fontWeight: FontWeight.bold),
//          textAlign: TextAlign.center,
//        ),
//      ),
//      Container(
//        padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
//        width: double.infinity,
//        child: Text(
//          AppConstants.NATIONAL_SHRINE_TEXT,
//          style: Theme.of(context)
//              .primaryTextTheme
//              .caption
//              .copyWith(fontWeight: FontWeight.bold),
//          textAlign: TextAlign.center,
//        ),
//      ),
//    ],
//  );
//}
