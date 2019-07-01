import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';

Widget servicesHeader(){
  return Column(
        children: <Widget> [Container(
          padding: EdgeInsets.only(top: 24.0 ,bottom: 5.0),
          width: double.infinity,
          child: Text('The Services', 
            style: AppConstants.OPTION_STYLE3,textAlign: TextAlign.center,),
        ),
        Container(
          padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
          width: double.infinity,
          child: Text(AppConstants.NATIONAL_SHRINE_TEXT,
                                style: AppConstants.OPTION_STYLE1,textAlign: TextAlign.center,),
      ),
    ],
  );
}