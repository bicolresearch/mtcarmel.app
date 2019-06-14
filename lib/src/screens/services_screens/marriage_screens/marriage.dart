import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/screens/services_screens/marriage_screens/marriage_info.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:mt_carmel_app/src/widgets/service_specific.dart';
import 'package:mt_carmel_app/src/widgets/services_header.dart';
import 'package:mt_carmel_app/src/widgets/services_tiles.dart';
////
class Marriage extends StatelessWidget {
  //////
  const Marriage({Key key}) : super(key: key);

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
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    //builder: (context) => ServicesDetailScreen(service.service_name),
                    builder: (context) => 
                    MarriageInfo()
                  )
                );
                if (result)
                  Navigator.pop(context, true);
              },
              child: serviceSpecific("Marriage")),
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