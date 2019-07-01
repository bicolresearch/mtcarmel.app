/*
*	Filename		:	tranparency_screen.dart
*	Purpose			:	
* Created			: 
*	Updated			:	2019-06-26 17:33:34 by jo 
*	Changes			: update model name
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/helpers/visibility_helper.dart';
import 'package:mt_carmel_app/src/models/total_transaction_amount.dart';
import 'package:mt_carmel_app/src/models/transaction.dart';
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';

class TransparencyScreen extends StatefulWidget {
  static const TextStyle optionStyle = TextStyle(
      color: Colors.brown, fontSize: 13.0, fontWeight: FontWeight.bold);

  TransparencyScreen(BuildContext context);

  @override
  _TransparencyScreenState createState() => _TransparencyScreenState();
}

class _TransparencyScreenState extends State<TransparencyScreen> {
  var _totalDonated = 0.0;
  var _isLoading = true;
  var _isJsonFailed = false;
  var _isTotalLoading = true;
  var _isJsonTotalFailed = false;
  List<TotalTransactionAmount> _totalTransactionAmountList = [];

  List<Transaction> _transactionList = [];

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
    this.getJsonTransactionData();
    this.getTotalAmt();
  }

  Future _initializeArrows() async {
    await Future.delayed(Duration(milliseconds: 500));
    _scrollListener();
  }

  Future<void> getJsonTransactionData() async {
    var response = await http.get(AppConstants.TRANSACTION_JSON_URL);
    if (this.mounted) {
      setState(() {
        if (response.statusCode == 200) {
          _transactionList = (json.decode(response.body) as List)
              .map((data) => new Transaction.fromJson(data))
              .toList();
          _isLoading = false;
        } else {
          _isJsonFailed = true;
          _isLoading = false;
        }
      });
      _initializeArrows();
    }
  }

  Future<void> getTotalAmt() async {
    var response =
        await http.get('http://192.168.254.109/api/transparency.json');
    if (this.mounted) {
      setState(() {
        if (response.statusCode == 200) {
          _totalTransactionAmountList = (json.decode(response.body) as List)
              .map((data) => new TotalTransactionAmount.fromJson(data))
              .toList();
          _isTotalLoading = false;
        } else {
          _isJsonTotalFailed = true;
          _isTotalLoading = false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: _isTotalLoading
              ? CircularProgressIndicator()
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
                                                border: Border.all(width: 0.8),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: getTotal()),
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            MountCarmelIcons.refresh,
                                          ),
                                          onPressed: () {
                                            print("Refresh button pressed.");
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
                                  _onStartScroll(scrollNotification.metrics);
                                } else if (scrollNotification
                                    is ScrollUpdateNotification) {
                                  _onUpdateScroll(scrollNotification.metrics);
                                } else if (scrollNotification
                                    is ScrollEndNotification) {
                                  _onEndScroll(scrollNotification.metrics);
                                }
                              },
                              child: ListView.builder(
                                controller: _scrollController,
                                itemCount: _transactionList.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                      child: _isLoading
                                          ? CircularProgressIndicator()
                                          : _transactionContent(
                                              _transactionList[index]));
                                },
                              ),
                            )),
                      ),
                      GestureDetector(onTap: _moveDown, child: _arrowMoreDown),
                    ],
                  ),
                  height: MediaQuery.of(context).size.height,
                )),
    );
  }

  Widget _transactionContent(Transaction transaction) {
    if (_isJsonFailed) return Container();
    String url = AppConstants.API_BASE_URL + transaction.coverPhoto;
    if (Image.network(url) != null) {
      return Container(
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              width: 40.0,
              child: CircleAvatar(
                backgroundImage: NetworkImage(url),
                radius: 20,
                backgroundColor: Colors.brown,
              ),
            ),
            Spacer(),
            Container(width: 90.0, child: Text(transaction.firstName)),
            Spacer(flex: 2),
            Container(
                width: 70.0, child: Text(transaction.amount)),
            Spacer(),
            Container(width: 25.0, child: Text(transaction.postedOn)),
            Spacer(flex: 2),
            Container(width: 60.0, child: Text(transaction.donationType)),
            Spacer(),
          ],
        ),
      );
    }
    return Container();
  }

  Widget getTotal() {
    double total = 0.0;

    if (_totalTransactionAmountList.isNotEmpty &&
        _totalTransactionAmountList[0] != null) {
      total = _totalTransactionAmountList[0].total;
    }

    return Text(_formattedAmount(total),
        textAlign: TextAlign.center, style: TextStyle(color: Colors.white));
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
}
