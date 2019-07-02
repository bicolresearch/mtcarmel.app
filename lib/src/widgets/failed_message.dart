/*
*  Filename    :   failed_message.dart.dart
*  Purpose     :   Displays message failure
*  Created     :   2019-07-02 09:33 by Detective Conan
*  Updated     :   2019-07-02 09:33 by Detective Conan 
*  Changes     :
*/



import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';

Widget failedMessage(){
  return Center(child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Text("No results. Please check the network connection", style: AppConstants.OPTION_STYLE2,),
  ));
}