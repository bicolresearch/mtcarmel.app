/*
*	Filename		:	transparency_screen.dart
*	Purpose			:	Displays the recent donation transactions
* Created			: 2019-06-05 09:10:50 Detective Conan
*	Updated			: 2019-07-03 11:57 by Detective conan
*	Changes			: Implemented Refreshing of donation transaction list.
*/

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/helpers/visibility_helper.dart';
import 'package:mt_carmel_app/src/models/donations.dart';
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class TransparencyScreen extends StatefulWidget {
  static const TextStyle optionStyle = TextStyle(
      color: Colors.brown, fontSize: 13.0, fontWeight: FontWeight.bold);

  TransparencyScreen(BuildContext context);

  @override
  _TransparencyScreenState createState() => _TransparencyScreenState();
}

class _TransparencyScreenState extends State<TransparencyScreen> {
  var _isJsonFailed = false;
  var _isJsonLoading = true;
  Donations _donations;

  NumberFormat _formatCurrency;

  ScrollController _scrollController;

  static Icon _arrowUp = Icon(
    Icons.keyboard_arrow_up,
  );
  static Icon _arrowDown = Icon(
    Icons.keyboard_arrow_down,
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
    this.getDonationsJson().timeout(Duration(seconds: 1)).then((result) {
      _isJsonLoading = false;
      print(_isJsonLoading);
    });
  }

  Future _initializeArrows() async {
    await Future.delayed(Duration(milliseconds: 500));
    _scrollListener();
  }

  Future<bool> getDonationsJson() async {
    var response = await http.get(AppConstants.TRANSACTION_JSON_URL);
    if (this.mounted) {
      setState(() {
        if (response.statusCode == 200) {
          final body = json.decode(response.body);
          _donations = Donations.fromJson(body);

          _isJsonLoading = false;
          _initializeArrows();
        } else {
          _isJsonLoading = false;
          _isJsonFailed = true;
        }
      });
    }
    print("getDonations");
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: _isJsonLoading
              ? LoadingIndicator()
              : _isJsonFailed
                  ? _failedContent()
                  : Container(
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      padding: EdgeInsets.only(bottom: 10.0),
                                      child: Icon(
                                        MountCarmelIcons.transparency,
                                        size: 100,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          "Transparency",
                                          style: AppConstants.OPTION_STYLE3,
                                          textAlign: TextAlign.justify,
                                        ),
                                        Center(
                                          child: Text(
                                            "Total help received online for this year",
                                            style: AppConstants.OPTION_STYLE1,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              child: Container(
                                                  width: 200.0,
                                                  height: 20.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.brown[600],
                                                    border:
                                                        Border.all(width: 0.8),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  child: getTotal()),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                MountCarmelIcons.refresh,
                                              ),
                                              onPressed: () {
                                                print(
                                                    "Refresh button pressed.");
                                                setState(() {
                                                  _isJsonLoading = true;
                                                  this.getDonationsJson();
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                        Divider(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              height: (MediaQuery.of(context).size.height) / 2,
                              width: double.infinity,
                            ),
                          ),

                          //TRANSACTION LIST
                          GestureDetector(onTap: _moveUp, child: _arrowMoreUp),

                          Expanded(
                            child: Container(
                                width: double.infinity,
                                child: NotificationListener<ScrollNotification>(
                                  onNotification: (scrollNotification) {
                                    if (scrollNotification
                                        is ScrollStartNotification) {
                                      _onStartScroll(
                                          scrollNotification.metrics);
                                    } else if (scrollNotification
                                        is ScrollUpdateNotification) {
                                      _onUpdateScroll(
                                          scrollNotification.metrics);
                                    } else if (scrollNotification
                                        is ScrollEndNotification) {
                                      _onEndScroll(scrollNotification.metrics);
                                    }
                                  },
                                  child: ListView.builder(
                                    controller: _scrollController,
                                    itemCount:
                                        (_donations.donationsList == null)
                                            ? 0
                                            : _donations.donationsList.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                          child: _isJsonLoading
                                              ? LoadingIndicator()
                                              : _transactionContent(_donations
                                                  .donationsList[index]));
                                    },
                                  ),
                                )),
                          ),
                          GestureDetector(
                              onTap: _moveDown, child: _arrowMoreDown),
                        ],
                      ),
                      height: MediaQuery.of(context).size.height,
                    )),
    );
  }

  Widget _transactionContent(Donation donation) {
    if (_isJsonFailed) return Container();
    String url = AppConstants.API_BASE_URL + donation.profilePhoto;
    if (Image.network(url) != null) {
      return Container(
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              width: 40.0,
              child: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(url),
                radius: 20,
                backgroundColor: Colors.brown,
              ),
            ),
            Spacer(),
            Container(
                width: 90.0,
                child: Text("${donation.firstName} ${donation.lastName}")),
            Spacer(flex: 2),
            Container(
                width: 70.0,
                child: Text(_formattedAmount(double.parse(donation.amount)))),
            Spacer(),
            Container(
              width: 60.0,
              child: Text(
                donation.postedOn,
                style: TextStyle(fontSize: 10.0),
              ),
            ),
            Spacer(flex: 2),
            Container(width: 60.0, child: Text(donation.donationType)),
            Spacer(),
          ],
        ),
      );
    }
    return Container();
  }

  Widget getTotal() {
    return Text(
        _formattedAmount(double.parse(_donations.totalDonations.amount)),
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String _formattedAmount(double amount) {
    try {
      // format to philippine peso and separates with commas
      final formatCurrency =
          NumberFormat.currency(symbol: "\u20b1", decimalDigits: 2);
      return formatCurrency.format(amount);
    } catch (e) {
      print(e.toString());
      return "\u20b1 $amount";
    }
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
    if (_scrollController.offset >= _scrollController.position.minScrollExtent)
      _scrollController.animateTo(_scrollController.offset - 200,
          curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  _moveDown() {
    if (_scrollController.offset <= _scrollController.position.maxScrollExtent)
      _scrollController.animateTo(_scrollController.offset + 200,
          curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  void _onStartScroll(ScrollMetrics metrics) {}

  void _onUpdateScroll(ScrollMetrics metrics) {}

  void _onEndScroll(ScrollMetrics metrics) {
    _scrollListener();
  }

  Widget _failedContent() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(
          "No results. Please check the network connection.",
          style: AppConstants.OPTION_STYLE3,
        ),
      ),
    );
  }
}
