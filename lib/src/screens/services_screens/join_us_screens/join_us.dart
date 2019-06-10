import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:mt_carmel_app/src/widgets/services_header.dart';
import 'package:mt_carmel_app/src/widgets/services_tiles.dart';

class JoinUs extends StatelessWidget {
  const JoinUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
          servicesHeader(),
          SizedBox(height: 10.0,),
          serviceTile(AppConstants.JOIN_US, AppConstants.sample_message),
          SizedBox(height: 10.0,),
          lineWidget(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 70.0),
            child: GestureDetector(
              onTap: () {
                print("Tapped item");
              },
              child: Text("Confraternity of Our Lady of Mount Carmel", 
              style: AppConstants.OPTION_STYLE2,
              textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50.0),
            child: lineWidget()),

          Spacer(),
          Container(
            margin: EdgeInsets.only(bottom: 30.0),
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
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