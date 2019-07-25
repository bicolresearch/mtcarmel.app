/*
*  Filename    :   service_info_screen.dart
*  Purpose     :   Displays the service info
*  Created     :   2019-07-22 09:21 by Detective Conan
*  Updated     :   2019-07-25 10:53 by Detective conan
*  Changes     :   Disabling when end of
*                  scroll was not reached
*/

import 'package:flutter/material.dart';
import 'package:flutter_html_textview_render/html_text_view.dart';
import 'package:mt_carmel_app/src/helpers/visibility_helper.dart';
import 'package:mt_carmel_app/src/models/church_service.dart';
import 'package:mt_carmel_app/src/screens/services_screens/service_forms/service_form_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';

class ServiceInfoScreen extends StatefulWidget {
  @required
  final ChurchServiceSubtype churchServiceSubtype;

  const ServiceInfoScreen({Key key, this.churchServiceSubtype})
      : super(key: key);

  @override
  _ServiceInfoScreenState createState() => _ServiceInfoScreenState();
}

class _ServiceInfoScreenState extends State<ServiceInfoScreen> {
  bool _isScrolledToTheLast = false;

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
    super.initState();
    _initializeArrows();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Text(
                widget.churchServiceSubtype.subTypeName,
                style: Theme.of(context)
                    .primaryTextTheme
                    .headline
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            lineWidget(),
            GestureDetector(onTap: _moveUp, child: _arrowMoreUp),
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
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: HtmlTextView(
                      data:
                          "<div style='color: #5d4037'>${widget.churchServiceSubtype.infoText}</div>",
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(onTap: _moveDown, child: _arrowMoreDown),
            Container(
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    color: Colors.brown,
                    child: Text(
                      "Accept",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: _isScrolledToTheLast
                        ? () async {
                            final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ServiceFormScreen(
                                        serviceSubType:
                                            widget.churchServiceSubtype)));
                            if (result) Navigator.pop(context, true);
                          }
                        : null,
                  ),
                  leftArrowBackButton(context: context),
                ],
              ),
            ),
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
        setState(() {
          _arrowMoreDown = VisibilityHelper(
              child: _arrowDown, visibility: VisibilityFlag.gone);
          _arrowMoreUp = VisibilityHelper(
              child: _arrowUp, visibility: VisibilityFlag.gone);
          _isScrolledToTheLast = true;
        });
        return;
      }
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(
          () {
            _arrowMoreDown = VisibilityHelper(
                child: _arrowDown, visibility: VisibilityFlag.gone);
            _arrowMoreUp = VisibilityHelper(
                child: _arrowUp, visibility: VisibilityFlag.visible);
            _isScrolledToTheLast = true;
          },
        );
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
    if (_scrollController.offset >= _scrollController.position.minScrollExtent)
      _scrollController.animateTo(_scrollController.offset - 200,
          curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  _moveDown() {
    if (_scrollController.offset <= _scrollController.position.maxScrollExtent)
      _scrollController.animateTo(_scrollController.offset + 200,
          curve: Curves.linear, duration: Duration(milliseconds: 500));
  }
}
