/*
*	Filename		:	prayer_request_form.dart
*	Purpose			:	prayer request add form
* Created			: 2019-06-13 14:57:50 by Scarlet Witch
*	Updated			:	2019-06-14 08:55:15 by Detective Conan
*	Changes			: Fixed the TextField issue. Made the TextField multiple lines.
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
          style: Theme.of(context)
                      .primaryTextTheme
                      .title.copyWith(fontWeight : FontWeight.bold),
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
                    Text("Write here ...", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        textAlign: TextAlign.start,
                         decoration: InputDecoration(
                           border: OutlineInputBorder(
                             borderSide: BorderSide(
                               color: Colors.brown,
                             )
                           ),
                           hintText: "write here...",
                           ),
                       ),
                      ),
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
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context, false);
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