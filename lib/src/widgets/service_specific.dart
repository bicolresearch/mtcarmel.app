import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';

Widget serviceSpecific(BuildContext context, String service){
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 70.0),
          child: Text(service, 
          style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
          textAlign: TextAlign.center,
          ),
        ),
    Container(
      margin: EdgeInsets.symmetric(horizontal: 50.0),
      child: lineWidget()),
      ],
    );
}