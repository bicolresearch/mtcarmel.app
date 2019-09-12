/*
*	 Filename		  :	  services_screen.dart
*	 Purpose		  :	  Displays the list of the services of the church
*  Created		  :   2019-06-11 15:52:50 by Detective Conan
*	 Updated			:   08/09/2019 4:40 AM PM by Detective Conan
*	 Changes			:   Temporary covered the screen with container. to disable the screen while services in not ready.
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/services_bloc/services_bloc.dart';
import 'package:mt_carmel_app/src/blocs/sub_services_bloc/sub_services_bloc.dart';
import 'package:mt_carmel_app/src/blocs/sub_services_bloc/sub_services_event.dart';

import 'package:mt_carmel_app/src/helpers/visibility_helper.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:mt_carmel_app/src/screens/services_screens/sub_services_screen.dart';
import 'package:mt_carmel_app/src/widgets/module_reference_tile.dart';
import 'package:mt_carmel_app/src/widgets/service_header.dart';
import 'dart:async';

class ServicesScreen extends StatefulWidget {
  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  ScrollController _scrollController;
  MoreArrowEnum _currentMoreArrow = MoreArrowEnum.None;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<ModuleReference> _moduleReferences = [];

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
    _moduleReferences = BlocProvider.of<ServicesBloc>(context).moduleReferences;
    _initializeArrows();
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
      child: Stack(
        children: <Widget>[
          Scaffold(
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
          //TODO Removed when Services is ready
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Color.fromRGBO(0, 0, 0, 0.7),
          ),
        ],
      ),
    );
  }

  Widget _moduleReferenceItem(context, final ModuleReference moduleReference) {
    return InkWell(
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return BlocProvider<SubServicesBloc>(
                  builder: (context) => SubServicesBloc()
                ..dispatch(
                    FetchSubServices(moduleReference)),
              child: SubServicesScreen());
//                ModuleScreen(
//                moduleReference: moduleReference,
//              );
            },
          ),
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
