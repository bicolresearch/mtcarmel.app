import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:mt_carmel_app/src/widgets/service_specific.dart';
import 'package:mt_carmel_app/src/widgets/services_header.dart';
import 'package:mt_carmel_app/src/widgets/services_tiles.dart';
////
class About extends StatelessWidget {
  //////
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,          
        //   children: <Widget>[
        //    Column(children: <Widget>[
        //     Text("About the parish",
        //     style: AppConstants.OPTION_STYLE3,),
        //     Text("Our Lady of Mt. Carmel",
        //     style: AppConstants.OPTION_STYLE2,),
        //     Spacer(),
        //     Text("Location: Cubao",
        //     style: AppConstants.OPTION_STYLE1,),
        //     Spacer(),
        //     Text("Date of establishment: 17 February 1975",
        //     style: AppConstants.OPTION_STYLE1,),
        //     Spacer(),
        //     Text("Feast day: 17 February 1975",
        //     style: AppConstants.OPTION_STYLE1,),
        //     ],
        //     ),
        //     Spacer(),
        //     Container(
        //       margin: EdgeInsets.only(bottom: 30.0),
        //       child: GestureDetector(
        //         onTap: (){
        //           Navigator.pop(context);
        //           print("tapped");
        //         },
        //         child: Icon(Icons.keyboard_arrow_left, 
        //         size: 50.0,
        //         color: Colors.brown,)),
        //     )
        //   ],
        // ),
        child: Column(
          children: <Widget>[
            Spacer(),
            Text("About"),
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