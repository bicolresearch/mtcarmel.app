/*
*	 Filename		 :	 baptism.dart
*	 Purpose		 :
*  Created		 :   2019-06-13 19:36:12 by Scarlet Witch
*  Updated     :   2019-07-12 16:48 by Detective conan
*  Changes     :   Pass the context to the header and serviceTile
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/models/service_item.dart';
import 'package:mt_carmel_app/src/screens/services_screens/baptism_screens/individual_info.dart';
import 'package:mt_carmel_app/src/screens/services_screens/baptism_screens/community_info.dart';
import 'package:mt_carmel_app/src/screens/services_screens/baptism_screens/adult_info.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:mt_carmel_app/src/widgets/service_specific.dart';
import 'package:mt_carmel_app/src/widgets/services_header.dart';
import 'package:mt_carmel_app/src/widgets/services_tiles.dart';
////
class Baptism extends StatelessWidget {
  //////
  const Baptism({Key key, this.serviceItem}) : super(key: key);
  final ServiceItem serviceItem;
  static const String baptism_message = "Be part of the christian community and follow the word of the Lord";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
          servicesHeader(context),
          SizedBox(height: 10.0,),
          ////////
          serviceTile(context, this.serviceItem),
          SizedBox(height: 10.0,),
          lineWidget(),
           Column(children: <Widget>[
            GestureDetector(
                  onTap: ()async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => 
                        IndividualInfo()
                      )
                    );
                    if (result)
                      Navigator.pop(context, true);
                  },
              child: serviceSpecific("Individual Baptism")),
            GestureDetector(
                  onTap: ()async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => 
                        CommunityInfo()
                      )
                    );
                    if (result)
                      Navigator.pop(context, true);
                  },
              child: serviceSpecific("Community Baptism")),
            GestureDetector(
                  onTap: ()async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => 
                        AdultInfo()
                      )
                    );
                    if (result)
                      Navigator.pop(context, true);
                  },
              child: serviceSpecific("Adult Baptism")),
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