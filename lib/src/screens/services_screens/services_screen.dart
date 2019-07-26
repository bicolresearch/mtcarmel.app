/*
*	 Filename		  :	  services_screen.dart
*	 Purpose		  :	  Displays the list of the services of the church
*  Created		  :   2019-06-11 15:52:50 by Detective Conan
*  Updated     :   2019-07-26 10:59 by Detective conan
*  Changes     :   Enhanced the scrolling.
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/helpers/visibility_helper.dart';
import 'package:mt_carmel_app/src/models/church_service.dart';
import 'package:mt_carmel_app/src/models/service_item.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/screens//services_screens/passing_screens/passing.dart';
import 'package:mt_carmel_app/src/screens/services_screens/baptism_screens/baptism.dart';
import 'package:mt_carmel_app/src/screens/services_screens/communion_screens/communion.dart';
import 'package:mt_carmel_app/src/screens/services_screens/confirmation_screens/confirmation.dart';
import 'package:mt_carmel_app/src/screens/services_screens/event_screen/church_event.dart';
import 'package:mt_carmel_app/src/screens/services_screens/join_us_screens/join_us.dart';
import 'package:mt_carmel_app/src/screens/services_screens/make_request_screens/make_request.dart';
import 'package:mt_carmel_app/src/screens/services_screens/marriage_screens/marriage.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_type_screen.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/services_header.dart';
import 'package:mt_carmel_app/src/widgets/services_tiles.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ServicesScreen extends StatefulWidget {
  //TODO temporary text
  static const String message =
      "lorem ipsum dolor sit amet. conse ctetur adipiscing elit. Integer necodio, Praesent libero. Sed cursus.";
  static const String confra_message =
      "Be an active part of the mission and service of the Carmelite Church";

  static const String JOIN_US = 'Join Us!';
  static const String MAKE_REQUEST = 'Make a Request';
  static const String BAPTISM = 'Baptism';
  static const String COMMUNION = 'Communion';
  static const String CONFIRMATION = 'Confirmation';
  static const String WEDDING = 'Marriage';
  static const String PASSING = 'Passing';
  static const String EVENTS = 'Events';

  ServicesScreen(BuildContext context);

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  ScrollController _scrollController;
  MoreArrowEnum _currentMoreArrow = MoreArrowEnum.None;

  ChurchService _churchService;

  List<ServiceItem> _serviceItemList = [];

  bool _isLoading = true;
  bool _isJsonFailed = false;

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
    print("initializing serviceScreen...");
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    getJsonData().then((_) {
      _initializeArrows();
    }).catchError((e) {
      debugPrint("ServiceScreen.initState: $e");
    });
    super.initState();
  }

  Future _initializeArrows() async {
    await Future.delayed(Duration(milliseconds: 300));
    _scrollListener();
  }

  //TODO move to dedicated business logic class.
  Future<void> getJsonData() async {
    _isJsonFailed = false;
    _isLoading = true;
    var response = await http
        .get(AppConstants.SERVICES_JSON_URL)
        .timeout(Duration(milliseconds: 3000));
    if (this.mounted) {
      setState(() {
        if (response.statusCode == 200) {
          _serviceItemList = (json.decode(response.body) as List)
              .map((data) => new ServiceItem.fromJson(data))
              .toList();
          print(_serviceItemList.length);
          _isLoading = false;
        } else {
          //throw Exception('Failed to load photos');
          _isJsonFailed = true;
          _isLoading = false;
        }
      });
    }
  }

  @override
  void dispose() {
    print("disposing servicesScreen...");
    _scrollController.dispose();
    _churchService = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _isLoading
          ? LoadingIndicator()
          : Scaffold(
              body: Column(
                children: <Widget>[
                  //
                  GestureDetector(
                      onTap: _scrollListener, child: servicesHeader(context)),

                  GestureDetector(onTap: _moveUp, child: _arrowMoreUp),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (scrollNotification) {
                          if (scrollNotification is ScrollStartNotification) {
                            _onStartScroll(scrollNotification.metrics);
                          } else if (scrollNotification
                              is ScrollUpdateNotification) {
                            _onUpdateScroll(scrollNotification.metrics);
                          } else if (scrollNotification
                              is ScrollEndNotification) {
                            _onEndScroll(scrollNotification.metrics);
                          }
                          return;
                        },
                        child: ListView.builder(
                            controller: _scrollController,
                            itemCount: _serviceItemList.length,
                            itemBuilder: (context, index) {
                              return _serviceItem(
                                  context, _serviceItemList[index]);
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

  Widget _serviceItem(context, ServiceItem serviceItem) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => _navigateToService(serviceItem),
          ),
        );
        _churchService = null;
      },
      // TODO tobe refactor for dynamic forms and tabs
      child: serviceTile(context, serviceItem),
    );
  }

  Widget _navigateToService(ServiceItem serviceItem) {
    switch (serviceItem.name) {
      case ServicesScreen.JOIN_US:
        //TODO for the current model
        _churchService = JoinUs.getChurchService(serviceItem);
        return ServiceTypeScreen(churchService: _churchService);
      case ServicesScreen.MAKE_REQUEST:
        //TODO for the current model
        _churchService = MakeRequest.getChurchService(serviceItem);
        return ServiceTypeScreen(churchService: _churchService);
      case ServicesScreen.BAPTISM:
        //TODO for the current model
        _churchService = Baptism.getChurchService(serviceItem);
        return ServiceTypeScreen(churchService: _churchService);
      case ServicesScreen.COMMUNION:
        //TODO for the current model
        _churchService = Communion.getChurchService(serviceItem);
        return ServiceTypeScreen(churchService: _churchService);
      case ServicesScreen.CONFIRMATION:
        //TODO for the current model
        _churchService = Confirmation.getChurchService(serviceItem);
        return ServiceTypeScreen(churchService: _churchService);
      case ServicesScreen.WEDDING:
        //TODO for the current model
        _churchService = Marriage.getChurchService(serviceItem);
        return ServiceTypeScreen(churchService: _churchService);
      case ServicesScreen.PASSING:
        //TODO for the current model
        _churchService = Passing.getChurchService(serviceItem);
        return ServiceTypeScreen(churchService: _churchService);
      case ServicesScreen.EVENTS:
        //TODO for the current model
        _churchService = ChurchEvent.getChurchService(serviceItem);
        return ServiceTypeScreen(churchService: _churchService);
    }
    return NoService(serviceItem: serviceItem);
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
        setState(
          () {
            _arrowMoreDown = VisibilityHelper(
                child: _arrowDown, visibility: VisibilityFlag.gone);
            _arrowMoreUp = VisibilityHelper(
                child: _arrowUp, visibility: VisibilityFlag.gone);
          },
        );
        return;
      }
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        if (_currentMoreArrow != MoreArrowEnum.MoreUpOnly) {
          _currentMoreArrow = MoreArrowEnum.MoreUpOnly;
          setState(
            () {
              _arrowMoreDown = VisibilityHelper(
                  child: _arrowDown, visibility: VisibilityFlag.gone);
              _arrowMoreUp = VisibilityHelper(
                  child: _arrowUp, visibility: VisibilityFlag.visible);
            },
          );
        }
        return;
      }
      if (_scrollController.offset <=
              _scrollController.position.minScrollExtent &&
          !_scrollController.position.outOfRange) {
        if (_currentMoreArrow != MoreArrowEnum.MoreDownOnly) {
          _currentMoreArrow = MoreArrowEnum.MoreDownOnly;
          setState(
            () {
              _arrowMoreDown = VisibilityHelper(
                  child: _arrowDown, visibility: VisibilityFlag.visible);
              _arrowMoreUp = VisibilityHelper(
                  child: _arrowUp, visibility: VisibilityFlag.gone);
            },
          );
        }
        return;
      }
      if (_scrollController.offset <
              _scrollController.position.maxScrollExtent &&
          _scrollController.offset >
              _scrollController.position.minScrollExtent) {
        if (_currentMoreArrow != MoreArrowEnum.MoreUpAndDown) {
          _currentMoreArrow = MoreArrowEnum.MoreUpAndDown;
          setState(
            () {
              _arrowMoreDown = VisibilityHelper(
                  child: _arrowDown, visibility: VisibilityFlag.visible);
              _arrowMoreUp = VisibilityHelper(
                  child: _arrowUp, visibility: VisibilityFlag.visible);
            },
          );
        }
        return;
      }
    } catch (e) {
      print(e.toString());
      print("error in _scrolListener");
    }
  }

  _moveUp() {
    if (_scrollController.offset >= _scrollController.position.minScrollExtent)
      _scrollController.animateTo(_scrollController.offset - 200,
          curve: Curves.linear, duration: Duration(milliseconds: 400));
  }

  _moveDown() {
    if (_scrollController.offset <= _scrollController.position.maxScrollExtent)
      _scrollController.animateTo(_scrollController.offset + 200,
          curve: Curves.linear, duration: Duration(milliseconds: 400));
  }
}

class NoService extends StatelessWidget {
  const NoService({Key key, this.serviceItem}) : super(key: key);
  final ServiceItem serviceItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Spacer(),
            Text(
              "No service for ${serviceItem.name}",
              style: Theme.of(context).primaryTextTheme.subhead,
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
