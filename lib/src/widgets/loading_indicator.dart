/*
*  Filename    :   loading_indicator.dart
*  Purpose     :	 Displays CircularProgressIndicator when loading
*  Created     :   2019-07-03 16:40 by Detective Conan
*  Updated     :   2019-07-04 08:46 by Detective conan 
*  Changes     :   Changed the strokeWidth from 4.0 to 2.0.
*/

import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      strokeWidth: 2.0,
    ));
  }
}
