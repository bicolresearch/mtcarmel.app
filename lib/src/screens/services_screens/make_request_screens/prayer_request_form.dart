/*
*	Filename		:	prayer_request_form.dart
*	Purpose			:	prayer request add form
* Created			: 2019-06-13 14:57:50 by jo
*	Updated			:	2019-06-13 14:57:50 by jo 
*	Changes			: added form comment, remove widget GestureDetector
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:mt_carmel_app/src/widgets/thank_you.dart';

class PrayerRequestForm extends StatelessWidget {
  const PrayerRequestForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      margin: EdgeInsets.fromLTRB(30.0, 50.0,30.0,50.0),
      child: Column(
        children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          child: Text("Prayer Request", 
          style: AppConstants.OPTION_STYLE3,
          textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30.0),
          child: lineWidget()),
        
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal:30.0, vertical: 10.0),
                  child: Column(children: <Widget>[
                    Text("Write here ...", style: AppConstants.OPTION_STYLE2),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextField(
                        textAlign: TextAlign.start,
                         decoration: InputDecoration(
                           contentPadding: EdgeInsets.symmetric(vertical: 200.0),
                           border: OutlineInputBorder(),
                           hintText: "write here...",
                           alignLabelWithHint: false,
                           ),
                       ),
                      ),
                      //  lineWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),  
        

        // Spacer(),
        Container(
          
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            color: Colors.brown,
            child: Text("Submit", 
            style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
             final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => 
                    ThankYouScreen(message: _thankYouMessage())
                  )
                );
              if(result)
                Navigator.pop(context, true);
            },
          ),
        ),
        Container(
          //margin: EdgeInsets.only(bottom: 30.0),
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context, false);
              print("tapped");
            },
            child: Icon(Icons.keyboard_arrow_left, 
            size: 50.0,
            color: Colors.brown,)),
        )
        ],
      ),
        ),
    );
  }
  String _thankYouMessage(){
    return 
    """
    Thank you for sending your prayer request. We will be offering your requests and petitions.
    
    You may view the status of your request in your mailbox.
    """;
  }
}