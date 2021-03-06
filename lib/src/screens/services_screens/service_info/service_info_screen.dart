/*
*  Filename    :   service_info_screen.dart
*  Purpose     :   Displays the service info
*  Created     :   2019-07-22 09:21 by Detective Conan
*	 Updated			:   19/09/2019 1:09 PM PM by Detective Conan
*	 Updated			:   07/11/2019 11:28 AM PM by Detective Conan
*	 Changes			:   Modified to adapt new model for submodule and formfields
*/

import 'package:flutter/material.dart';
import 'package:flutter_html_textview_render/html_text_view.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/visibility_helper.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:mt_carmel_app/src/widgets/login_screen.dart';
import 'package:provider/provider.dart';

class ServiceInfoScreen extends StatefulWidget {

  @override
  _ServiceInfoScreenState createState() => _ServiceInfoScreenState();
}

class _ServiceInfoScreenState extends State<ServiceInfoScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _isScrolledToTheLast = false;
  bool _isLoggedIn = false;
  MoreArrowEnum _currentMoreArrow = MoreArrowEnum.None;

  ScrollController _scrollController;

  GlobalKey _htmlKey = GlobalKey();

  VisibilityHelper _arrowMoreUp = VisibilityHelper(
    child: VisibilityHelper.arrowUp,
    visibility: VisibilityFlag.gone,
  );
  VisibilityHelper _arrowMoreDown = VisibilityHelper(
    child: VisibilityHelper.arrowDown,
    visibility: VisibilityFlag.gone,
  );

  Future _initializeArrows() async {
    await Future.delayed(Duration(milliseconds: 500));
    _scrollListener();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _initializeArrows();
    _checkLoginStatus().catchError((e) {
      debugPrint(e);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final subModuleAndFormFields = Provider.of<SubModuleAndFormFields>(context);
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Text(
                    subModuleAndFormFields.subModule.name,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                lineWidget(),
                _arrowMoreUp,
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollStartNotification) {
                        _onStartScroll(scrollNotification.metrics);
                      } else if (scrollNotification
                          is ScrollUpdateNotification) {
                        _onUpdateScroll(scrollNotification.metrics);
                      } else if (scrollNotification is ScrollEndNotification) {
                        _onEndScroll(scrollNotification.metrics);
                      }
                      return;
                    },
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: HtmlTextView(
                          data:
                              "<div style='color: #5d4037'>${subModuleAndFormFields.subModule.acceptanceContent}</div>",
                        ),
                        key: _htmlKey,
                      ),
                    ),
                  ),
                ),
                _arrowMoreDown,
                Container(
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        color: Colors.brown,
                        child: const Text(
                          "Accept",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: _isScrolledToTheLast
                            ? () async {
//                                _scaffoldKey.currentState.showSnackBar(
//                                  SnackBar(
//                                    content: Text(
//                                      'Online applications are not yet available.',
//                                      textAlign: TextAlign.center,
//                                    ),
//                                    duration: Duration(seconds: 3),
//                                  ),
//                                );

                                if (subModuleAndFormFields.formFields == null ||
                                    subModuleAndFormFields.formFields.isEmpty) {
                                  _scaffoldKey.currentState.showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Online application for this service is not yet available',
                                        textAlign: TextAlign.center,
                                      ),
                                      duration: Duration(seconds: 3),
                                    ),
                                  );
                                  return;
                                }

                                if (!_isLoggedIn) {
                                  _isLoggedIn = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                  );
                                }

                                if (_isLoggedIn) {
                                  final result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ServiceFormScreen(
                                                  subModuleAndFormFields: subModuleAndFormFields)));
                                  if (result) Navigator.pop(context, true);
                                }
                              }
                            : null,
                      ),
                    ],
                  ),
                ),
                leftArrowBackButton(context: context),
              ],
            ),
          ),
        ],
      ),
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
            _isScrolledToTheLast = true;
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
              _isScrolledToTheLast = true;
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

  Future _checkLoginStatus() async {
    await locator<AuthenticationService>().isLoggedIn().then((value) {
      _isLoggedIn = value;
    }).catchError((error) {
      print(error);
      _isLoggedIn = false;
    });
  }
}
