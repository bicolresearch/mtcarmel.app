import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:mt_carmel_app/src/widgets/thank_you.dart';

class ConfraternityForm extends StatelessWidget {
  const ConfraternityForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      margin: EdgeInsets.fromLTRB(30.0, 50.0,30.0,50.0),
      child: Column(
        children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          child: GestureDetector(
            onTap: () {
              print("Tapped item");
            },
            child: Text("Confraternity of Our Lady of Mount Carmel", 
            style: Theme.of(context)
                      .primaryTextTheme
                      .title.copyWith(fontWeight : FontWeight.bold),
            textAlign: TextAlign.center,
            ),
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
                    Text("Name", style: Theme.of(context)
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
                // Home Address
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30),
              child: Column(children: <Widget>[
                Text("Home Address", style: Theme.of(context)
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
            // Birthday
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30),
              child: Column(children: <Widget>[
                Text("Birthday", style: Theme.of(context)
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
            //contact number
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30),
              child: Column(children: <Widget>[
                Text("Contact Number", style: Theme.of(context)
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
                Text("Home Address", style: Theme.of(context)
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
    Thank you for joining the Confraternity. Your application is subject for review, upon approval please settle the application fee.
    
    Please visit Mount Carmel Shrine head office to receive your Scapular, Confraternity Manual and Certificate of Confraternity.

    We will be reaching you through your provided contact details.

    You may view the status of your request in your mailbox.
    """;
  }
}