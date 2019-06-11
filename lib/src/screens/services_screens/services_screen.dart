import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/model/service.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';
import 'package:mt_carmel_app/src/screens/passing_screens/passing.dart';
import 'package:mt_carmel_app/src/screens/services_screens/baptism_screens/baptism.dart';
import 'package:mt_carmel_app/src/screens/services_screens/communion_screens/communion.dart';
import 'package:mt_carmel_app/src/screens/services_screens/confiramtion_screens/confirmation.dart';
import 'package:mt_carmel_app/src/screens/services_screens/event_screen/event.dart';
import 'package:mt_carmel_app/src/screens/services_screens/join_us_screens/join_us.dart';
import 'package:mt_carmel_app/src/screens/services_screens/make_request_screens/make_request.dart';
import 'package:mt_carmel_app/src/screens/services_screens/marriage_screens/marriage.dart';
import 'package:mt_carmel_app/src/screens/services_screens/services_detail_screen.dart';
import 'package:mt_carmel_app/src/widgets/services_header.dart';
import 'package:mt_carmel_app/src/widgets/services_tiles.dart';
import 'package:mt_carmel_app/src/widgets/thank_you.dart';


class ServicesScreen extends StatelessWidget {
  
  //TODO temporary text
  static const String message = "lorem ipsum dolor sit amet. conse ctetur adipiscing elit. Integer necodio, Praesent libero. Sed cursus.";

  static const String JOIN_US = 'Join us';
  static const String MAKE_REQUEST = 'Make a request';
  static const String BAPTISIM = 'Baptism';
  static const String COMMUNION = 'Communion';
  static const String CONFIRMATION = 'Confirmation';
  static const String WEDDING = 'Wedding';
  static const String PASSING = 'Passing';
  static const String EVENTS = 'Events';

  final List<Service> services = [
    Service(JOIN_US, message),
    Service(MAKE_REQUEST, message),
    Service(BAPTISIM, message),
    Service(COMMUNION, message),
    Service(CONFIRMATION, message),
    Service(WEDDING, message),
    Service(PASSING, message),
    Service(EVENTS, message),
  ];

  ServicesScreen(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
                                        
      body: 
      Column(
        children: <Widget> [
        //   
        servicesHeader(),
            Expanded(
                child: Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.symmetric(
                  horizontal: 50.0,
                ),
                
                child: ListView.builder(
                  itemCount: services.length,
                  itemBuilder:(context, index){
                    return _serviceItem(context, services[index]);
                  }
                ),
              ),
            )
          ],
        ),                
      ),
    );
  }

  Widget _serviceItem(context, Service service){
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            //builder: (context) => ServicesDetailScreen(service.service_name),
            builder: (context) => 
            _navigateToService(service.service_name),
            //ThankYouScreen(message: service.service_name),
            //JoinUs(),
          )
        );
      },
      // from service.dart
      child: serviceTile(service.service_name, message),
    );
  }
        
  Widget  _navigateToService(String service_name) {
    switch(service_name)
    {
      case JOIN_US:
        return JoinUs();
      case MAKE_REQUEST:
         return MakeRequest1();
      case BAPTISIM:
        return Baptism();
      case COMMUNION:
        return Communion();
      case CONFIRMATION:
        return Confiramtion();
      case WEDDING:
       return Marriage();
      case PASSING:
       return Passing();
      case EVENTS:
       return Event();
      // default: 
      //   return MountCarmelIcons.logo;
    }
  }
}