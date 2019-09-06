/*
*	 Filename		  :	  services_screen.dart
*	 Purpose		  :	  Displays the list of the services of the church
*  Created		  :   2019-06-11 15:52:50 by Detective Conan
*	 Updated			:   06/09/2019 3:27 PM PM by Detective Conan
*	 Changes			:   Changed the GestureDetector with InkWell
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/core/services/module_list_service.dart';
import 'package:mt_carmel_app/src/helpers/visibility_helper.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:mt_carmel_app/src/screens/services_screens/module_screen.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/module_reference_tile.dart';
import 'package:mt_carmel_app/src/widgets/service_header.dart';
import 'dart:async';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';

class ServicesScreen extends StatefulWidget {
  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  ScrollController _scrollController;
  MoreArrowEnum _currentMoreArrow = MoreArrowEnum.None;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<ModuleReference> _moduleReferences = [];

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
  initState() {
    super.initState();
    print("initializing serviceScreen...");
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _moduleReferences = locator<ModuleListService>().moduleReferences;
    if (_moduleReferences.isEmpty) {
      getModules();
    } else {
      if (this.mounted)
        setState(() {
          _isJsonFailed = false;
          _isLoading = false;
        });
    }
  }

  Future getModules() async {
    await locator<ModuleListService>().getJsonData().then(
      (_) {
        _initializeArrows();
        if (this.mounted)
          setState(() {
            _moduleReferences = locator<ModuleListService>().moduleReferences;
            _isJsonFailed = false;
            _isLoading = false;
          });
      },
    ).catchError(
      (e) {
        debugPrint("ServiceScreen.initState: $e");
        if (this.mounted)
          setState(() {
            _isJsonFailed = true;
            _isLoading = false;
          });
      },
    );
  }

  Future _initializeArrows() async {
    await Future.delayed(Duration(milliseconds: 300));
    _scrollListener();
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
              key: _scaffoldKey,
              body: Column(
                children: <Widget>[
                  ServiceHeader(),
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
                            itemCount: _moduleReferences.length,
                            itemBuilder: (context, index) {
                              return _moduleReferenceItem(
                                  context, _moduleReferences[index]);
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

  Widget _moduleReferenceItem(context, final ModuleReference moduleReference) {
    return InkWell(
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ModuleScreen(
                    moduleReference: moduleReference,
                  )),
        );
        if (result.runtimeType == String) {
          final String val = result;
          if (val.contains("No sub-services")) {
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text(
                '$val',
                textAlign: TextAlign.center,
              ),
              duration: Duration(seconds: 3),
            ));
          }
        }
      },
      child: ModuleReferenceTile(
          context: context, moduleReference: moduleReference),
    );
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
