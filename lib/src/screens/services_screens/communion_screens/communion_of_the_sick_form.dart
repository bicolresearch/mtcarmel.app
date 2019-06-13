/*
*	Filename		:	communion_of_the_sick_form.dart
*	Purpose			:	communion of the sick add form
* Created			: 2019-06-13 16:17:05 by jo
*	Updated			:	2019-06-13 16:17:05 by jo 
*	Changes			:
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:mt_carmel_app/src/widgets/thank_you.dart';

class CommunionOfTheSickForm extends StatelessWidget {
  const CommunionOfTheSickForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      margin: EdgeInsets.fromLTRB(30.0, 50.0,30.0,50.0),
      child: Column(
        children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          child: Text("Communion of the Sick", 
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
                    Text("Name of Communicant", style: AppConstants.OPTION_STYLE2),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextField(
                        textAlign: TextAlign.center,
                         decoration: InputDecoration(
                           contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                           border: OutlineInputBorder(),
                           //hintText: "e.g. Juan dela Cruz",
                          //  labelText: "Name",
                           alignLabelWithHint: false,
                           ),
                       ),
                      ),
                      //  lineWidget(),
                    ],
                  ),
                ),
                // Communicant's Date of Birth
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30),
              child: Column(children: <Widget>[
                Text("Communicant's Date of Birth", style: AppConstants.OPTION_STYLE2),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                     decoration: InputDecoration(
                       contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                       border: OutlineInputBorder(),
                       hintText: "",
                      //  labelText: "Name",
                       alignLabelWithHint: false,
                       ),
                   ),
                  ),
                  //  lineWidget(),
                ],
              ),
            ),  
            // Spouse of Communicant
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30),
              child: Column(children: <Widget>[
                Text("Spouse of Communicant", style: AppConstants.OPTION_STYLE2),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                     decoration: InputDecoration(
                       contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                       border: OutlineInputBorder(),
                       hintText: "",
                      //  labelText: "Name",
                       alignLabelWithHint: false,
                       ),
                   ),
                  ),
                  //  lineWidget(),
                ],
              ),
            ),    
            // Spouse's Date of Birth
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30),
              child: Column(children: <Widget>[
                Text("Spouse's Date of Birth", style: AppConstants.OPTION_STYLE2),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                     decoration: InputDecoration(
                       contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                       border: OutlineInputBorder(),
                       hintText: "",
                      //  labelText: "Name",
                       alignLabelWithHint: false,
                       ),
                   ),
                  ),
                  //  lineWidget(),
                ],
              ),
            ),  
            // Home Address of Communicant
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30),
              child: Column(children: <Widget>[
                Text("Home Address of Communicant", style: AppConstants.OPTION_STYLE2),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                     decoration: InputDecoration(
                       contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                       border: OutlineInputBorder(),
                       hintText: "",
                      //  labelText: "Name",
                       alignLabelWithHint: false,
                       ),
                   ),
                  ),
                  //  lineWidget(),
                ],
              ),
            ),  
            // Contact Number of Communicant
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30),
              child: Column(children: <Widget>[
                Text("Contact Number of Communicant", style: AppConstants.OPTION_STYLE2),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                     decoration: InputDecoration(
                       contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                       border: OutlineInputBorder(),
                       hintText: "",
                      //  labelText: "Name",
                       alignLabelWithHint: false,
                       ),
                   ),
                  ),
                  //  lineWidget(),
                ],
              ),
            ),  
            // Date of Church Marriage
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30),
              child: Column(children: <Widget>[
                Text("Date of Church Marriage", style: AppConstants.OPTION_STYLE2),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                     decoration: InputDecoration(
                       contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                       border: OutlineInputBorder(),
                       hintText: "",
                      //  labelText: "Name",
                       alignLabelWithHint: false,
                       ),
                   ),
                  ),
                  //  lineWidget(),
                ],
              ),
            ),  
            // Date of Last Confession
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30),
              child: Column(children: <Widget>[
                Text("Date of Last Confession", style: AppConstants.OPTION_STYLE2),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                     decoration: InputDecoration(
                       contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                       border: OutlineInputBorder(),
                       hintText: "",
                      //  labelText: "Name",
                       alignLabelWithHint: false,
                       ),
                   ),
                  ),
                  //  lineWidget(),
                ],
              ),
            ),  
            // Preferred Time of Visit
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30),
              child: Column(children: <Widget>[
                Text("Preferred Time of Visit", style: AppConstants.OPTION_STYLE2),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                     decoration: InputDecoration(
                       contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                       border: OutlineInputBorder(),
                       hintText: "",
                      //  labelText: "Name",
                       alignLabelWithHint: false,
                       ),
                   ),
                  ),
                  //  lineWidget(),
                ],
              ),
            ), 
            //Contact Person
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30),
              child: Column(children: <Widget>[
                Text("Contact Person", style: AppConstants.OPTION_STYLE2),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                     decoration: InputDecoration(
                       contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                       border: OutlineInputBorder(),
                       hintText: "",
                      //  labelText: "Name",
                       alignLabelWithHint: false,
                       ),
                   ),
                  ),
                  //  lineWidget(),
                ],
              ),
            ),  
            // Contact Number
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30),
              child: Column(children: <Widget>[
                Text("Contact Number", style: AppConstants.OPTION_STYLE2),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                     decoration: InputDecoration(
                       contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                       border: OutlineInputBorder(),
                       hintText: "",
                      //  labelText: "Name",
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
    Thank you for requesting a communion for the sick. We will review your request, please wait for the approval of the office and the Extraordinary Ministers of the Holy Communion.
    
    You may view the status of your request in your mailbox.
    """;
  }
}