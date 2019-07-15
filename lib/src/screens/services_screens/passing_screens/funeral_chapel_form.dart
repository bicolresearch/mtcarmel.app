/*
*	Filename		:	funeral_chapel_form.dart
*	Purpose			:	funeral chapel add form
* Created			: 2019-06-13 17:10:50 by Scarlet Witch
*	Updated			:	2019-06-27 18:25:30 by Scarlet Witch 
*	Changes			: added new fields 
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:mt_carmel_app/src/widgets/thank_you.dart';

class FuneralChapelForm extends StatelessWidget {
  const FuneralChapelForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      margin: EdgeInsets.fromLTRB(30.0, 50.0,30.0,50.0),
      child: Column(
        children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          child: Text("Funeral Chapel", 
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
                    Text("Name of Deceased", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead),
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
                //  Age
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30),
              child: Column(children: <Widget>[
                Text("Age", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: DropdownButtonFormField(
                     decoration: InputDecoration(
                       contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                       border: OutlineInputBorder(),
                       hintText: "",
                      //  labelText: "Name",
                       alignLabelWithHint: false,
                       ), items: <DropdownMenuItem>[],
                   ),
                  ),
                  //  lineWidget(),
                ],
              ),
            ),
                //  Marital Status (Dropdown)
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30),
              child: Column(children: <Widget>[
                Text("Marital Status", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: DropdownButtonFormField(
                     decoration: InputDecoration(
                       contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                       border: OutlineInputBorder(),
                       hintText: "",
                      //  labelText: "Name",
                       alignLabelWithHint: false,
                       ), items: <DropdownMenuItem>[],
                   ),
                  ),
                  //  lineWidget(),
                ],
              ),
            ),
            // Address
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30),
              child: Column(children: <Widget>[
                Text("Address", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead),
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
            // Date of Birth
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30),
              child: Column(children: <Widget>[
                Text("Date of Birth", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead),
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
            // Date of Death
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30),
              child: Column(children: <Widget>[
                Text("Date of Death", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead),
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
            // Cause of Death
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30),
              child: Column(children: <Widget>[
                Text("Cause of Death", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead),
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
            //  Date of Burial
             Container(
              margin: EdgeInsets.only(left: 30.0, right: 30),
              child: Column(children: <Widget>[
                Text("Date of Burial", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead),
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
            //  Place of Burial
             Container(
              margin: EdgeInsets.only(left: 30.0, right: 30),
              child: Column(children: <Widget>[
                Text("Place of Burial", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead),
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
                Text("Contact Person", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead),
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
            //Relationship with the deceased
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30),
              child: Column(children: <Widget>[
                Text("Relationship with the deceased", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead),
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
            // Mobile Number
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30),
              child: Column(children: <Widget>[
                Text("Mobile Number", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead),
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
            // Landline Number
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30),
              child: Column(children: <Widget>[
                Text("Landline Number", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead),
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
            // Email
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30),
              child: Column(children: <Widget>[
                Text("Email", style: Theme.of(context)
                      .primaryTextTheme
                      .subhead),
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
    Thank you for requesting a funeral chapel. Schedule your rental and settle your rental fee in your mailbox.
    
    You may view the status of your request in your mailbox.
    """;
  }
}