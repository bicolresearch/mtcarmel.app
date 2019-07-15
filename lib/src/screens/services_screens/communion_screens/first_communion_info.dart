/*
*	Filename		:	first_communion_info.dart
*	Purpose			:	first communion info add form
* Created			: 2019-06-13 16:11:17 by Scarlet Witch
*	Updated			:	2019-06-13 16:11:17 by Scarlet Witch 
*	Changes			:
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/screens/services_screens/communion_screens/first_communion_form.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';

class FirstCommunionInfo extends StatelessWidget {
  const FirstCommunionInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Text("First Communion", 
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
                Text("Applicant may only have 1 or 2 sponsors during first communion.", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Text("Fees:", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Application Fee", 
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("500 php", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,),
                ),
                Text("Upon submission, you may contact Catechetical Ministry office to schedule your catechesis.", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Text("Call 727-94-32 local 411", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                Text("Tuesday to Saturdays", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                Text("9am-5pm", 
                style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,
                textAlign: TextAlign.left,), 
                SizedBox(height: 10.0),
                Text("You may settle your bill using your debit card, credit card or cash.", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead,),
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
                          FirstCommunionForm()
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