/*
*  Filename    :   service_form_common.dart
*  Purpose     :   Base class for all the formFields. To share common functions
*                  and attributes
*  Created     :   2019-07-22 09:06 by Detective Conan
*  Updated     :   2019-07-22 09:06 by Detective Conan
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/church_service.dart';

class ServiceFormCommon extends StatelessWidget {

  @required
  final ChurchFormField churchFormField;

  const ServiceFormCommon({Key key, this.churchFormField}) : super(key: key);
  Widget labelText(BuildContext context, String label){
    return Text(
      label,
      style: Theme.of(context)
          .primaryTextTheme
          .title
          ,
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


