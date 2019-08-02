/*
*	 Filename		  :	  services_screen.dart
*	 Purpose		  :	  Displays the list of the services of the church
*  Created		  :   2019-06-11 15:52:50 by Detective Conan
*  Updated     :   2019-08-02 10:40 by Detective conan
*  Changes     :   Implemented services by using apis.
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/helpers/visibility_helper.dart';
import 'package:mt_carmel_app/src/models/service_item.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/screens/services_screens/module_screen.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/services_header.dart';
import 'package:mt_carmel_app/src/widgets/services_tiles.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ServicesScreen extends StatefulWidget {
  static const String JOIN_US = 'Join Us!';
  static const String MAKE_REQUEST = 'Make a Request';
  static const String BAPTISM = 'Baptism';
  static const String COMMUNION = 'Communion';
  static const String CONFIRMATION = 'Confirmation';
  static const String WEDDING = 'Marriage';
  static const String PASSING = 'Passing';
  static const String EVENTS = 'Events';

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  ScrollController _scrollController;
  MoreArrowEnum _currentMoreArrow = MoreArrowEnum.None;

  List<ServiceItem> _serviceItemList = [];

  bool _isLoading = true;
  bool _isJsonFailed = false;

  VisibilityHelper _arrowMoreUp = VisibilityHelper(
    child: VisibilityHelper.arrowUp,
    visibility: VisibilityFlag.gone,
  );
  VisibilityHelper _arrowMoreDown = VisibilityHelper(
    child: VisibilityHelper.arrowDown,
    visibility: VisibilityFlag.gone,
  );

  @override
  void initState() {
    super.initState();
    print("initializing serviceScreen...");
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    getJsonData().then((_) {
      _initializeArrows();
    }).catchError((e) {
      debugPrint("ServiceScreen.initState: $e");
    });
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

                  _arrowMoreUp,
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.symmetric(
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
                  _arrowMoreDown,
                ],
              ),
            ),
    );
  }

  Widget _serviceItem(context, final ServiceItem serviceItem) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => _navigateToService(serviceItem),
          ),
        );
      },
      // TODO tobe refactor for dynamic forms and tabs
      child: serviceTile(context, serviceItem),
    );
  }

  Widget _navigateToService(final ServiceItem serviceItem) {
    switch (serviceItem.name) {
      case ServicesScreen.JOIN_US:
        //TODO for the current model
        return ModuleScreen(
          serviceItem: serviceItem,
          moduleApis: ["https://api.mountcarmel.ph/service_confraternity"],
        );
      case ServicesScreen.MAKE_REQUEST:
        //TODO for the current model
        return ModuleScreen(
          serviceItem: serviceItem,
          moduleApis: [
          "https://api.mountcarmel.ph/service_prayer_request",
          "https://api.mountcarmel.ph/service_mass_request",
          "https://api.mountcarmel.ph/service_liturgical",
          "https://api.mountcarmel.ph/service_certification",
          ],
        );
      case ServicesScreen.BAPTISM:
        //TODO for the current model
        return ModuleScreen(
          serviceItem: serviceItem,
          moduleApis: [
          "https://api.mountcarmel.ph/service_individual_baptism",
          "https://api.mountcarmel.ph/service_community_baptism",
          "https://api.mountcarmel.ph/service_adult_baptism",
          ],
        );
      case ServicesScreen.COMMUNION:
        //TODO for the current model
        return ModuleScreen(
          serviceItem: serviceItem,
          moduleApis: [
          "https://api.mountcarmel.ph/service_first_communion",
          "https://api.mountcarmel.ph/service_communion_of_the_sick",
          ],
        );
      case ServicesScreen.CONFIRMATION:
        //TODO for the current model
        return ModuleScreen(
          serviceItem: serviceItem,
          moduleApis: [
            "https://api.mountcarmel.ph/service_confirmation",
          ],
        );
      case ServicesScreen.WEDDING:
        //TODO for the current model
        return ModuleScreen(
          serviceItem: serviceItem,
          moduleApis: [
            "https://api.mountcarmel.ph/service_marriage",
          ],
        );
      case ServicesScreen.PASSING:
        //TODO for the current model
        return ModuleScreen(
          serviceItem: serviceItem,
          moduleApis: [
            "https://api.mountcarmel.ph/service_funeral_service",
            "https://api.mountcarmel.ph/service_funeral_chapel",
            "https://api.mountcarmel.ph/service_crypt_lobby",
          ],
        );
      case ServicesScreen.EVENTS:
        //TODO for the current model
        return ModuleScreen(
          serviceItem: serviceItem,
          moduleApis: [
            "https://api.mountcarmel.ph/service_november_mass",
            "https://api.mountcarmel.ph/service_events_FMHH_venue",
          ],
        );
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
                child: VisibilityHelper.arrowDown,
                visibility: VisibilityFlag.gone);
            _arrowMoreUp = VisibilityHelper(
                child: VisibilityHelper.arrowUp,
                visibility: VisibilityFlag.gone);
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
                  child: VisibilityHelper.arrowDown,
                  visibility: VisibilityFlag.gone);
              _arrowMoreUp = VisibilityHelper(
                  child: VisibilityHelper.arrowUp,
                  visibility: VisibilityFlag.visible);
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
                  child: VisibilityHelper.arrowDown,
                  visibility: VisibilityFlag.visible);
              _arrowMoreUp = VisibilityHelper(
                  child: VisibilityHelper.arrowUp,
                  visibility: VisibilityFlag.gone);
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
                  child: VisibilityHelper.arrowDown,
                  visibility: VisibilityFlag.visible);
              _arrowMoreUp = VisibilityHelper(
                  child: VisibilityHelper.arrowUp,
                  visibility: VisibilityFlag.visible);
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
              margin: const EdgeInsets.only(bottom: 30.0),
              child: leftArrowBackButton(context: context),
            )
          ],
        ),
      ),
    );
  }
}
