import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';

class ThankYouScreen extends StatefulWidget {
  ThankYouScreen({Key key, this.message}) : super(key: key);

  final String message;

  _ThankYouScreenState createState() => _ThankYouScreenState(this.message);
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  final String message;

  _ThankYouScreenState(this.message);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
          Icon(MountCarmelIcons.thankyou, color: Colors.brown, size: 150.0,),
          SizedBox(height: 20.0),
          Text("${this.message}", ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            color: Colors.brown,
            child: Text("Finish", 
            style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
              print("Back pressed");
            },
          ),
         ],
        ),
      ),
    );
  }
}