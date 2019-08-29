/*
*  Filename    :   service_form_screen.dart
*  Purpose     :	
*  Created     :   2019-07-15 14:12 by Detective Conan
*  Updated     :   2019-08-15 12:38 by Detective conan
*  Changes     :   Added branch_id in fields.
*/

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:http/http.dart';
import 'package:mt_carmel_app/src/core/services/authentication_service.dart';
import 'package:mt_carmel_app/src/helpers/visibility_helper.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_field.dart';
import 'package:mt_carmel_app/src/screens/services_screens/thank_you/thank_you_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';

class ServiceFormScreen extends StatefulWidget {
  ServiceFormScreen({this.subModule});

  @required
  final ChurchSubModule subModule;

  @override
  _ServiceFormScreenState createState() => _ServiceFormScreenState();
}

class _ServiceFormScreenState extends State<ServiceFormScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  static final GlobalKey<FormBuilderState> _fbKey =
      GlobalKey<FormBuilderState>();
  bool _isScrolledToTheLast = false;
  MoreArrowEnum _currentMoreArrow = MoreArrowEnum.None;

  ScrollController _scrollController;

  VisibilityHelper _arrowMoreUp = VisibilityHelper(
    child: VisibilityHelper.arrowUp,
    visibility: VisibilityFlag.gone,
  );
  VisibilityHelper _arrowMoreDown = VisibilityHelper(
    child: VisibilityHelper.arrowDown,
    visibility: VisibilityFlag.gone,
  );

  Future _initializeArrows() async {
    await Future.delayed(Duration(milliseconds: 800));
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: _arrowMoreUp,
            ),
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollStartNotification) {
                    _onStartScroll(scrollNotification.metrics);
                  } else if (scrollNotification is ScrollUpdateNotification) {
                    _onUpdateScroll(scrollNotification.metrics);
                  } else if (scrollNotification is ScrollEndNotification) {
                    _onEndScroll(scrollNotification.metrics);
                  }
                  return;
                },
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: Text(
                          widget.subModule.name,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headline
                              .copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      lineWidget(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: FormBuilder(
                          key: _fbKey,
                          autovalidate: true,
                          child: Column(
                            children: <Widget>[
                              for (var formField in widget.subModule.formFields)
                                ServiceFormField(churchFormField: formField),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _arrowMoreDown,
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              color: Colors.brown,
              child: const Text(
                "Submit",
                style: const TextStyle(color: Colors.white),
              ),
              onPressed: _isScrolledToTheLast
                  ? () async {
                      //TODO implement validations and updating database

                      await _submit().then(
                        (success) async {
                          print(
                              "ServiceFormScreen._submit.then success=$success");
                          if (!success) {
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text(
                                'Did not saved. Please input necessary fields.',
                                textAlign: TextAlign.center,
                              ),
                              duration: Duration(seconds: 3),
                            ),);
                            return;
                          }

                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ThankYouScreen(
                                  thankYouText:
                                      widget.subModule.thankYouContent),
                            ),
                          );
                          if (result) Navigator.pop(context, true);
                        },
                      ).catchError((e) {
                        //TODO show error notification
                        print(e);
                      });
                    }
                  : null,
            ),
            leftArrowBackButton(context: context),
          ],
        ),
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

  Future _submit() async {
    if (widget.subModule.url == null || widget.subModule.url.isEmpty)
      throw Exception("No assigned api url.");

    _fbKey.currentState.save();
    if (_fbKey.currentState.validate()) {
      print(_fbKey.currentState.value);
      final url = widget.subModule.url;
      print(widget.subModule.url);
      Map<String, String> headers = {
        "Content-type": "application/x-www-form-urlencoded"
      };
      var fieldsValue = _fbKey.currentState.value;

      final userId =
          await locator<AuthenticationService>().getUserId().catchError((e) {
        print("ServiceFormScreen._submit() error: $e");
        throw Exception("Retrieving user id error. $e");
      });

      if (userId == null || userId == "") throw Exception("Not login");

      fieldsValue.putIfAbsent("user_id", () => userId);
      fieldsValue.putIfAbsent("branch_id", () => "1");
      debugPrint(fieldsValue.toString());
      print(headers);
      Map<String, String> casted = fieldsValue.cast();
      Response response = await post(
        url,
        headers: headers,
        body: casted,
      )
          .timeout(
            Duration(seconds: 3),
          )
          .catchError((e) => {
                print(e),
                throw Exception("Error in submitting ${widget.subModule.name}")
              });
      print(response.body);
      if (response == null) return false;

      if (response.statusCode == 201)
        return true;
      else
        return false;
    } else
      return false;
  }
}
