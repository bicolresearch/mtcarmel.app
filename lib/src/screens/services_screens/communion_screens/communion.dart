/*
*	 Filename		 :   communion.dart
*	 Purpose		 :
*  Created		 :   2019-06-13 16:34:11 by Scarlet Witch
*  Updated     :   2019-07-15 09:53 by Detective conan
*  Changes     :   Replaced the textStyle constants with Inherited provider
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/service_item.dart';
import 'package:mt_carmel_app/src/screens/services_screens/communion_screens/first_communion_info.dart';
import 'package:mt_carmel_app/src/screens/services_screens/communion_screens/communion_of_the_sick_info.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:mt_carmel_app/src/widgets/service_specific.dart';
import 'package:mt_carmel_app/src/widgets/services_header.dart';
import 'package:mt_carmel_app/src/widgets/services_tiles.dart';

class Communion extends StatelessWidget {
  const Communion({Key key, this.serviceItem}) : super(key: key);

  final ServiceItem serviceItem;
  static const String communion_message = "Be united with our God through the christian rite of communion";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
          servicesHeader(context),
          SizedBox(height: 10.0,),
          serviceTile(context, serviceItem),
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
              child: serviceSpecific(context, "First Communion")),
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
              child: serviceSpecific(context, "Communion of the Sick")),
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