/*
*	 Filename		 :	 make_request.dart
*	 Purpose		 :
*  Created		 :   2019-06-13 16:31:23 by Scarlet Witch
*  Updated     :   2019-07-12 16:51 by Detective conan
*  Changes     :   Pass the context to the header and serviceTile
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/models/service_item.dart';
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
  const MakeRequest1({Key key, this.serviceItem}) : super(key: key);
  final ServiceItem serviceItem;
  static const String make_request_message = "Be closer to God with the help of the church through prayers, holy masses and liturgy";

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
                  child: serviceSpecific(context, "Prayer Request")),
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
                  child: serviceSpecific(context, "Mass Request")),
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
                  child: serviceSpecific(context, "Liturgical Service")),
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
                  },child: serviceSpecific(context, "Certification")),
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