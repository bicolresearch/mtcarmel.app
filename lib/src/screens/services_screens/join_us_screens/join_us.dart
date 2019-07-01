/*
*	Filename		:	join_us.dart
*	Purpose			:	
* Created			: 2019-06-11 15:52:50 by Detective Conan
*	Updated			:	2019-06-17 15:48:25 by Scarlet Witch 
*	Changes			: add services messages/content
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/screens/services_screens/join_us_screens/confraternity_info.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:mt_carmel_app/src/widgets/services_header.dart';
import 'package:mt_carmel_app/src/widgets/services_tiles.dart';

class JoinUs extends StatelessWidget {
  const JoinUs({Key key}) : super(key: key);
  //static const String join_us_message = "Be an active part of the mission and service of the Carmelite Church";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
          servicesHeader(),
          SizedBox(height: 10.0,),
          serviceTile(AppConstants.JOIN_US, AppConstants.confraternity_message),
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
                    ConfraternityInfo()
                  )
                );
                if (result)
                  Navigator.pop(context, true);
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
            child: leftArrowBackButton(context: context),
          )
          ],
        ),
      ),
    );
  }
}