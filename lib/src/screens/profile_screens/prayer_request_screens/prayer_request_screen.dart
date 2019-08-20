/*
*  Filename    :   prayer_request_screen.dart
*  Purpose     :	
*  Created     :   2019-08-20 16:42 by Detective Conan
*  Updated     :   2019-08-20 16:42 by Detective Conan 
*  Changes     :
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/prayer_request_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/prayer_request.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/prayer_request_screens/prayer_requested_detail_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class PrayerRequestScreen extends StatefulWidget {
  @override
  _PrayerRequestScreenState createState() => _PrayerRequestScreenState();
}

class _PrayerRequestScreenState extends State<PrayerRequestScreen> {
  List<PrayerRequest> _prayerRequests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: _prayerRequests.isEmpty
                  ? LoadingIndicator()
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return _prayerRequestItem(
                            context, _prayerRequests[index + 1]);
                      },
                      itemCount: _prayerRequests.length - 1,
                    ),
            ),
          ),
          leftArrowBackButton(context: context),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    locator<PrayerRequestService>().getPrayerRequests().then(((value) {
      if (this.mounted)
        setState(() {
          debugPrint(value.toString());
          _prayerRequests = value;
        });
    }));
    super.initState();
  }

  Widget _prayerRequestItem(BuildContext context, PrayerRequest prayerRequest) {
    return Dismissible(
      key: Key(prayerRequest.id),
      child: Card(
        child: ListTile(
          title: Text(
            prayerRequest.author,
            style: Theme.of(context)
                .primaryTextTheme
                .title
                .copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            prayerRequest.prayer,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).primaryTextTheme.title,
            maxLines: 1,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PrayerRequestedDetailScreen(prayerRequest: prayerRequest),
              ),
            );
          },
        ),
      ),
    );
  }
}
