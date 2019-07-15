/*
*	Filename		:	mass_request_info.dart
*	Purpose			:	mass request info add form
* Created			: 2019-06-13 14:53:18 by Scarlet Witch
*	Updated			:	2019-06-13 14:53:18 by Scarlet Witch 
*	Changes			: added form comment, update margins and buttons, remove widget GestureDetector
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/screens/services_screens/make_request_screens/mass_request_form.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';

class MassRequestInfo extends StatelessWidget {
  const MassRequestInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Text("Mass Request", 
            style: Theme.of(context)
                      .primaryTextTheme
                      .title.copyWith(fontWeight : FontWeight.bold),
            textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40.0),
            child: lineWidget()),
          SizedBox(height: 30.0),
          Expanded(
              child: SingleChildScrollView(
                child: Container(
                //width: 200.0,
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Text("After submission, you may donate any amount as an offering for your requested mass in your mailbox.", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,),
            ],
            ),
            ),
              ),
          ),        
          Container(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: <Widget>[
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  color: Colors.brown,
                  child: Text("Accept", 
                  style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => 
                          MassRequestForm()
                        )
                      );
                      if(result)
                        Navigator.pop(context, true);
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 30.0),
                    child: leftArrowBackButton(context: context),
                  )
                ],
              ),
          ),
          ],
        ),
      ),
    );
  }
}