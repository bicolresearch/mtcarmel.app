import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/screens/services_screens/make_request_screens/prayer_request_form.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';

class PrayerRequestInfo extends StatelessWidget {
  const PrayerRequestInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(30.0, 50.0,30.0,50.0),
        child: Column(
          children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 70.0),
            child: GestureDetector(
              onTap: () {
                print("Tapped item");
              },
              child: Text("Prayer Request", 
              style: AppConstants.OPTION_STYLE3,
              textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50.0),
            child: lineWidget()),
          SizedBox(height: 30.0),
          Expanded(
              child: Container(
              width: 200.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Text("Prayer Request is free of charge", 
              style: AppConstants.OPTION_STYLE2,
              textAlign: TextAlign.left,),               
            ],
            ),
            ),
          ),        
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
                    PrayerRequestForm()
                  )
                );
                if(result)
                  Navigator.pop(context, true);
            },
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30.0),
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
}