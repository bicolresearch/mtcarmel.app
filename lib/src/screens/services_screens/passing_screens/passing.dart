/*
*	Filename		:	passing.dart
*	Purpose			:	
* Created			: 2019-06-13 18:22:25 by Scarlet Witch
*	Updated			:	2019-06-17 16:04:09 by Scarlet Witch 
*	Changes			: add services messages/content
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/screens/services_screens/passing_screens/funeral_service_info.dart';
import 'package:mt_carmel_app/src/screens/services_screens/passing_screens/funeral_chapel_info.dart';
import 'package:mt_carmel_app/src/screens/services_screens/passing_screens/crypt_lobby_info.dart';
import 'package:mt_carmel_app/src/screens/services_screens/passing_screens/november_mass_info.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:mt_carmel_app/src/widgets/service_specific.dart';
import 'package:mt_carmel_app/src/widgets/services_header.dart';
import 'package:mt_carmel_app/src/widgets/services_tiles.dart';
////
class Passing extends StatelessWidget {
  //////
  const Passing({Key key}) : super(key: key);
  static const String passing_message = "Provide christian services and a peaceful resting place for our late loved ones";

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
          serviceTile(AppConstants.PASSING, passing_message),
          SizedBox(height: 10.0,),
          lineWidget(),
           Container(
             height: 300,
             child: SingleChildScrollView(
               child: Column(children: <Widget>[
                GestureDetector(
                  onTap: ()async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => 
                        FuneralServiceInfo()
                      )
                    );
                    if (result)
                      Navigator.pop(context, true);
                  },
                  child: serviceSpecific("Funeral Service")),
                  GestureDetector(
                  onTap: ()async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => 
                        FuneralChapelInfo()
                      )
                    );
                    if (result)
                      Navigator.pop(context, true);
                  },
                  child: serviceSpecific("Funeral Chapels")),
                  GestureDetector(
                  onTap: ()async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => 
                        CryptLobbyInfo()
                      )
                    );
                    if (result)
                      Navigator.pop(context, true);
                  },
                  child: serviceSpecific("Crypt Lobby")),
                  GestureDetector(
                  onTap: ()async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => 
                        NovemberMassInfo()
                      )
                    );
                    if (result)
                      Navigator.pop(context, true);
                  },
                  child: serviceSpecific("November Mass for the Dead")),
                ],
                ),
             ),
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