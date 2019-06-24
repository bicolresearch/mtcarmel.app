/*
*	Filename		:	services_screen.dart
*	Purpose			:	Displays the list of the services of the church
* Created			: 2019-06-11 15:52:50 by Detective Conan
*	Updated			: 2019-06-17 15:20:21 by Constantina 
*	Changes			: add services messages/content
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/helpers/visibility_helper.dart';
import 'package:mt_carmel_app/src/model/service.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/screens//services_screens/passing_screens/passing.dart';
import 'package:mt_carmel_app/src/screens/services_screens/baptism_screens/baptism.dart';
import 'package:mt_carmel_app/src/screens/services_screens/communion_screens/communion.dart';
import 'package:mt_carmel_app/src/screens/services_screens/confirmation_screens/confirmation.dart';
import 'package:mt_carmel_app/src/screens/services_screens/event_screen/event.dart';
import 'package:mt_carmel_app/src/screens/services_screens/join_us_screens/join_us.dart';
import 'package:mt_carmel_app/src/screens/services_screens/make_request_screens/make_request.dart';
import 'package:mt_carmel_app/src/screens/services_screens/marriage_screens/marriage.dart';
import 'package:mt_carmel_app/src/widgets/services_header.dart';
import 'package:mt_carmel_app/src/widgets/services_tiles.dart';

class ServicesScreen extends StatefulWidget {
  //TODO temporary text
  static const String message =
      "lorem ipsum dolor sit amet. conse ctetur adipiscing elit. Integer necodio, Praesent libero. Sed cursus.";
  static const String confra_message =
      "Be an active part of the mission and service of the Carmelite Church";

  static const String JOIN_US = 'Join us';
  static const String MAKE_REQUEST = 'Make a request';
  static const String BAPTISIM = 'Baptism';
  static const String COMMUNION = 'Communion';
  static const String CONFIRMATION = 'Confirmation';
  static const String WEDDING = 'Wedding';
  static const String PASSING = 'Passing';
  static const String EVENTS = 'Events';

  ServicesScreen(BuildContext context);

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final List<Service> services = [
    Service(ServicesScreen.JOIN_US, ServicesScreen.confra_message),
    Service(ServicesScreen.MAKE_REQUEST, ServicesScreen.message),
    Service(ServicesScreen.BAPTISIM, ServicesScreen.message),
    Service(ServicesScreen.COMMUNION, ServicesScreen.message),
    Service(ServicesScreen.CONFIRMATION, ServicesScreen.message),
    Service(ServicesScreen.WEDDING, ServicesScreen.message),
    Service(ServicesScreen.PASSING, ServicesScreen.message),
    Service(ServicesScreen.EVENTS, ServicesScreen.message),
  ];

  ScrollController _scrollController;

  static Icon _arrowUp = Icon(
    Icons.keyboard_arrow_up,
    color: Colors.brown,
  );
  static Icon _arrowDown = Icon(
    Icons.keyboard_arrow_down,
    color: Colors.brown,
  );

  VisibilityHelper _arrowMoreUp = VisibilityHelper(
    child: _arrowUp,
    visibility: VisibilityFlag.gone,
  );
  VisibilityHelper _arrowMoreDown = VisibilityHelper(
    child: _arrowDown,
    visibility: VisibilityFlag.gone,
  );

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
    _initializeArrows();
  }

  Future _initializeArrows() async {
    await Future.delayed(Duration(seconds: 3));
    _scrollListener();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            //
            GestureDetector(onTap: _scrollListener, child: servicesHeader()),

            GestureDetector(onTap: _moveUp, child: _arrowMoreUp),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.symmetric(
                  horizontal: 50.0,
                ),
                child: NotificationListener<ScrollNotification>(
                  onNotification: (scrollNotification) {
                    if (scrollNotification is ScrollStartNotification) {
                      _onStartScroll(scrollNotification.metrics);
                    } else if (scrollNotification is ScrollUpdateNotification) {
                      _onUpdateScroll(scrollNotification.metrics);
                    } else if (scrollNotification is ScrollEndNotification) {
                      _onEndScroll(scrollNotification.metrics);
                    }
                  },
                  child: ListView.builder(
                      controller: _scrollController,
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        return _serviceItem(context, services[index]);
                      }),
                ),
              ),
            ),
            GestureDetector(onTap: _moveDown, child: _arrowMoreDown),
          ],
        ),
      ),
    );
  }

  Widget _serviceItem(context, Service service) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => _navigateToService(service.service_name),
            ));
      },
      child: serviceTile(service.service_name, ServicesScreen.message),
    );
  }

  Widget _navigateToService(String service_name) {
    switch (service_name) {
      case ServicesScreen.JOIN_US:
        return JoinUs();
      case ServicesScreen.MAKE_REQUEST:
        return MakeRequest1();
      case ServicesScreen.BAPTISIM:
        return Baptism();
      case ServicesScreen.COMMUNION:
        return Communion();
      case ServicesScreen.CONFIRMATION:
        return Confirmation();
      case ServicesScreen.WEDDING:
        return Marriage();
      case ServicesScreen.PASSING:
        return Passing();
      case ServicesScreen.EVENTS:
        return Events();
    }
  }

  void _onStartScroll(ScrollMetrics metrics) {}

  void _onUpdateScroll(ScrollMetrics metrics) {}

  void _onEndScroll(ScrollMetrics metrics) {
    _scrollListener();
  }

  _scrollListener() {
    if (!_scrollController.hasClients) return;
    try {
      if (_scrollController.offset ==
              _scrollController.position.maxScrollExtent &&
          _scrollController.offset ==
              _scrollController.position.minScrollExtent) {
        setState(() {
          _arrowMoreDown = VisibilityHelper(
              child: _arrowDown, visibility: VisibilityFlag.gone);
          _arrowMoreUp = VisibilityHelper(
              child: _arrowUp, visibility: VisibilityFlag.gone);
        });
        return;
      }
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(() {
          _arrowMoreDown = VisibilityHelper(
              child: _arrowDown, visibility: VisibilityFlag.gone);
          _arrowMoreUp = VisibilityHelper(
              child: _arrowUp, visibility: VisibilityFlag.visible);
        });
        return;
      }
      if (_scrollController.offset <=
              _scrollController.position.minScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(() {
          _arrowMoreDown = VisibilityHelper(
              child: _arrowDown, visibility: VisibilityFlag.visible);
          _arrowMoreUp = VisibilityHelper(
              child: _arrowUp, visibility: VisibilityFlag.gone);
        });
        return;
      }
      if (_scrollController.offset <
              _scrollController.position.maxScrollExtent &&
          _scrollController.offset >
              _scrollController.position.minScrollExtent) {
        setState(() {
          _arrowMoreDown = VisibilityHelper(
              child: _arrowDown, visibility: VisibilityFlag.visible);
          _arrowMoreUp = VisibilityHelper(
              child: _arrowUp, visibility: VisibilityFlag.visible);
        });
        return;
      }
    } catch (e) {
      print(e.toString());
      print("error in _scrolListener");
    }
  }

  _moveUp() {
    _scrollController.animateTo(_scrollController.offset - 200,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  _moveDown() {
    _scrollController.animateTo(_scrollController.offset + 200,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }
}
