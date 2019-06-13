/*
*	Filename		:	communion.dart
*	Purpose			:	
* Created			: 2019-06-13 16:34:11 by jo
*	Updated			:	2019-06-13 16:34:11 by jo 
*	Changes			: added form comment, update form - added navigation to each make request form/screen
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/screens/services_screens/communion_screens/first_communion_info.dart';
import 'package:mt_carmel_app/src/screens/services_screens/communion_screens/communion_of_the_sick_info.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:mt_carmel_app/src/widgets/service_specific.dart';
import 'package:mt_carmel_app/src/widgets/services_header.dart';
import 'package:mt_carmel_app/src/widgets/services_tiles.dart';

class Communion extends StatelessWidget {
  const Communion({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
          servicesHeader(),
          SizedBox(height: 10.0,),
          serviceTile(AppConstants.COMMUNION, AppConstants.sample_message),
          SizedBox(height: 10.0,),
          lineWidget(),
           Column(children: <Widget>[
            GestureDetector(
                  onTap: ()async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => 
                        FirstCommunionInfo()
                      )
                    );
                    if (result)
                      Navigator.pop(context, true);
                  },
              child: serviceSpecific("First Communion")),
            GestureDetector(
                  onTap: ()async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => 
                        CommunionOfTheSickInfo()
                      )
                    );
                    if (result)
                      Navigator.pop(context, true);
                  },
              child: serviceSpecific("Communion of the Sick")),            
            ],
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(bottom: 30.0),
              child: leftArrowBackButton(context: context),
            )
          ],
        ),
      ),
    );
  }
}