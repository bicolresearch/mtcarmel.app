/*
*   Filename    :   transparency_screen.dart
*   Purpose     :
*   Created     :   12/09/2019 5:06 PM by Detective Conan
*   Updated     :   12/09/2019 5:06 PM by Detective Conan
*   Changes     :   
*/

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/transparency_bloc/transparency_bloc.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/models/donations.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';

import 'package:intl/intl.dart';

class TransparencyScreen extends StatefulWidget {
  @override
  _TransparencyScreenState createState() => _TransparencyScreenState();
}

class _TransparencyScreenState extends State<TransparencyScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TransparencyBloc>(context);
    final donationRecords = bloc.donationRecord;
    final totalAmount = bloc.totalAmount;

    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(children: <Widget>[
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
                          .copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.justify,
                    ),
                    Center(
                      child: Text(
                        "Total help received online for this year",
                        style: Theme.of(context).primaryTextTheme.caption,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Container(
                              width: 200.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                color: Colors.brown[600],
                                border: Border.all(width: 0.8),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Text(
                                  _formattedAmount(double.parse(totalAmount.toString())),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white))),
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
          height: MediaQuery.of(context).size.height / 2,
          width: double.infinity,
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            child: ListView.builder(
              itemCount: (donationRecords.data == null)
                  ? 0
                  : donationRecords.data.length,
              itemBuilder: (context, index) {
                return Container(
                    child: _transactionContent(
                        donationRecords.data[index]));
              },
            ),
          ),
        ),
      ]),
    );
  }

  Widget _transactionContent(Donation donation) {

    String url = AppConstants.API_BASE_URL + donation.mediaPath;
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
                timePassTransaction(DateTime.parse("${donation.dtCreated}")),
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
}
