/*
*	Filename		:	event.dart
*	Purpose			:	
* Created			: 2019-06-11 15:52:50 by Detective Conan
*	Updated			:	2019-06-17 16:04:09 by Scarlet Witch  
*	Changes			: add services messages/content
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/screens/services_screens/event_screen/father_mark_horan_hall_venue_info.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:mt_carmel_app/src/widgets/services_header.dart';
import 'package:mt_carmel_app/src/widgets/services_tiles.dart';

class Events extends StatelessWidget {
  const Events({Key key}) : super(key: key);
  static const String event_message = "Celebrate marriage or events in the delightful premises of the church";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
          servicesHeader(),
          SizedBox(height: 10.0,),
          serviceTile(AppConstants.EVENTS, event_message),
          SizedBox(height: 10.0,),
          lineWidget(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 70.0),
            child: GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    //builder: (context) => ServicesDetailScreen(service.service_name),
                    builder: (context) => 
                    FatherMarkHoranHallVenueInfo()
                  )
                );
                if (result)
                  Navigator.pop(context, true);
              },
              child: Text("Father Mark Horan Hall - Venue", 
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
            child: leftArrowBackButton(context: context),
          )
          ],
        ),
      ),
    );
  }
}