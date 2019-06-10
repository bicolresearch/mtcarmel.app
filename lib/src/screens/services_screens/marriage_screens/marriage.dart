import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:mt_carmel_app/src/widgets/service_specific.dart';
import 'package:mt_carmel_app/src/widgets/services_header.dart';
import 'package:mt_carmel_app/src/widgets/services_tiles.dart';
////
class Marriage1 extends StatelessWidget {
  //////
  const Marriage1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
          servicesHeader(),
          SizedBox(height: 10.0,),
          ////////
          serviceTile(AppConstants.WEDDING, AppConstants.sample_message),
          SizedBox(height: 10.0,),
          lineWidget(),
           Column(children: <Widget>[
            GestureDetector(
              onTap: (){
                print("Tapped...");
              },
              child: serviceSpecific("Marriage")),
            ],
            ),
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