/*
*	 Filename		 :	 transparency_screen.dart
*	 Purpose		 :	 Displays the recent donation transactions
*  Created		 :   2019-06-05 09:10:50 Detective Conan
*  Updated     :   2019-07-26 10:58 by Detective conan
*  Changes     :   enhanced the scrolling.
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

  @override
  _TransparencyScreenState createState() => _TransparencyScreenState();
}

class _TransparencyScreenState extends State<TransparencyScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  bool _isJsonFailed = false;
  bool _isJsonLoading = true;
  Donations _donations;

  ScrollController _scrollController;
  MoreArrowEnum _currentMoreArrow = MoreArrowEnum.None;

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
    debugPrint("initializing transparency screen...");
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
    this.getDonationsJson().then((result) {
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
                          Container(
                            child: Column(
                              children: <Widget>[
                                Flexible(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10.0),
                                        child: Icon(
                                          MountCarmelIcons.transparency,
                                          size: 100,
                                        ),
                                      ),
                                      Text(
                                        "Transparency",
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .title
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.justify,
                                      ),
                                      Center(
                                        child: Text(
                                          "Total help received online for this year",
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .caption,
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
                                              print("Refresh button pressed.");
                                              setState(() {
                                                _refreshIndicatorKey
                                                    .currentState
                                                    .show();
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
                            height: MediaQuery.of(context).size.height / 2,
                            width: double.infinity,
                          ),

                        //TRANSACTION LIST
                        _arrowMoreUp,

                        Expanded(
                          child: Container(
                            width: double.infinity,
                            child: NotificationListener<ScrollNotification>(
                              onNotification: (scrollNotification) {
                                if (scrollNotification
                                    is ScrollStartNotification) {
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
                              child: RefreshIndicator(
                                key: _refreshIndicatorKey,
                                onRefresh: _refresh,
                                child: ListView.builder(
                                  controller: _scrollController,
                                  itemCount: (_donations.donationsList == null)
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
                              ),
                            ),
                          ),
                        ),
                        _arrowMoreDown,
                      ],
                    ),
                    height: MediaQuery.of(context).size.height,
                  ),
      ),
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
              margin: const EdgeInsets.all(5.0),
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
                child: Text("${donation.firstName} ${donation.lastName}",
                    style: TextStyle(fontSize: 12.0))),
            Spacer(flex: 2),
            Container(
                width: 70.0,
                child: Text(_formattedAmount(double.parse(donation.amount)),
                    style: TextStyle(fontSize: 12.0))),
            Spacer(),
            Container(
              width: 35.0,
              child: Text(
                timePassTransaction(DateTime.parse("${donation.postedOn}")),
                style: TextStyle(fontSize: 12.0),
              ),
            ),
            Spacer(flex: 2),
            Container(
                width: 60.0,
                child: Text(donation.donationType,
                    style: TextStyle(fontSize: 12.0))),
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
    print("disposing transparency Screen...");
    _scrollController.dispose();
    super.dispose();
  }

  String _formattedAmount(double amount) {
    try {
      // format to philippine peso and separates with commas
      final formatCurrency =
          NumberFormat.currency(symbol: "Php", decimalDigits: 0);
      return "${formatCurrency.format(amount)}";
    } catch (e) {
      print(e.toString());
      return "\u20b1 $amount";
    }
  }

  String timePassTransaction(DateTime date) {
    int hourPassed = DateTime.now().difference(date).inHours;
    int dayPassed = DateTime.now().difference(date).inDays;

    if (hourPassed < 24)
      return "$hourPassed hr";
    else if (hourPassed >= 24 && dayPassed < 30)
      return "$dayPassed d";
    else {
      return "${(dayPassed / 30).floor()} mo";
    }
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
                child: VisibilityHelper.arrowDown, visibility: VisibilityFlag.gone);
            _arrowMoreUp = VisibilityHelper(
                child: VisibilityHelper.arrowUp, visibility: VisibilityFlag.gone);
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
                  child: VisibilityHelper.arrowDown, visibility: VisibilityFlag.gone);
              _arrowMoreUp = VisibilityHelper(
                  child: VisibilityHelper.arrowUp, visibility: VisibilityFlag.visible);
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
                  child: VisibilityHelper.arrowDown, visibility: VisibilityFlag.visible);
              _arrowMoreUp = VisibilityHelper(
                  child: VisibilityHelper.arrowUp, visibility: VisibilityFlag.gone);
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
                  child: VisibilityHelper.arrowDown, visibility: VisibilityFlag.visible);
              _arrowMoreUp = VisibilityHelper(
                  child: VisibilityHelper.arrowUp, visibility: VisibilityFlag.visible);
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
          style: Theme.of(context)
              .primaryTextTheme
              .title
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Future<void> _refresh() {
    return this.getDonationsJson().then((_donations) {
      setState(() {});
    });
  }
}
