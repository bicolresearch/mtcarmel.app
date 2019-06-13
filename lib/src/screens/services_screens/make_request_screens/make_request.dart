import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/screens/services_screens/make_request_screens/prayer_request_info.dart';
import 'package:mt_carmel_app/src/screens/services_screens/make_request_screens/mass_request_info.dart';
import 'package:mt_carmel_app/src/screens/services_screens/make_request_screens/liturgical_service_info.dart';
import 'package:mt_carmel_app/src/screens/services_screens/make_request_screens/certification_info.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:mt_carmel_app/src/widgets/service_specific.dart';
import 'package:mt_carmel_app/src/widgets/services_header.dart';
import 'package:mt_carmel_app/src/widgets/services_tiles.dart';
////
class MakeRequest1 extends StatelessWidget {
  //////
  const MakeRequest1({Key key}) : super(key: key);

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
          serviceTile(AppConstants.MAKE_REQUEST, AppConstants.sample_message),
          SizedBox(height: 10.0,),
          lineWidget(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                GestureDetector(
                  onTap: ()async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => 
                        PrayerRequestInfo()
                      )
                    );
                    if (result)
                      Navigator.pop(context, true);
                  },
                  child: serviceSpecific("Prayer Request")),
                GestureDetector(
                  onTap: ()async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => 
                        MassRequestInfo()
                      )
                    );
                    if (result)
                      Navigator.pop(context, true);
                  },
                  child: serviceSpecific("Mass Request")),
                GestureDetector(
                  onTap: ()async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => 
                        LiturgicalServiceInfo()
                      )
                    );
                    if (result)
                      Navigator.pop(context, true);
                  },
                  child: serviceSpecific("Liturgical Service")),
                GestureDetector(
                  onTap: ()async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => 
                        CertificationInfo()
                      )
                    );
                    if (result)
                      Navigator.pop(context, true);
                  },child: serviceSpecific("Certification")),
                ],
                ),
            ),
          ),
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