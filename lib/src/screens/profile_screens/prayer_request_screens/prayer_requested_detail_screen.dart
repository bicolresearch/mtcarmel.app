/*
*  Filename    :   prayer_requested_detail_screen.dart
*  Purpose     :	
*  Created     :   2019-08-20 18:35 by Detective Conan
*  Updated     :   2019-08-20 18:35 by Detective Conan 
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/models/prayer_request.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';

class PrayerRequestedDetailScreen extends StatelessWidget {
  @required
  final PrayerRequest prayerRequest;

  const PrayerRequestedDetailScreen({Key key, this.prayerRequest})
      : assert(prayerRequest != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime datePosted =
        DateTime.parse("${prayerRequest.dtCreated ?? "01-01-2019"}");
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                "Prayer Request",
                style: Theme.of(context)
                    .primaryTextTheme
                    .headline
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Requested by: ${prayerRequest.createdBy}",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .subtitle
                              .copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Date requested: ${datePosted.month}-${datePosted.day}-${datePosted.year}",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .subtitle
                              .copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Text(
                        prayerRequest.prayer,
                        style: Theme.of(context).primaryTextTheme.title,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            leftArrowBackButton(context: context),
          ],
        ),
      ),
    );
  }
}
