/*
*  Filename    :   prayer_request_screen.dart
*  Purpose     :	
*  Created     :   2019-08-20 16:42 by Detective Conan
*  Updated     :   2019-08-20 16:42 by Detective Conan 
*  Changes     :
*/

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/mass_request_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/mass_request.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/mass_request_screens/mass_requested_detail_screen.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class MassRequestScreen extends StatefulWidget {
  @override
  _MassRequestScreenState createState() => _MassRequestScreenState();
}

class _MassRequestScreenState extends State<MassRequestScreen> {
  List<MassRequest> _massRequests = [];

  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Mass Request",
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: _massRequests.isEmpty
                  ? LoadingIndicator()
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return _massRequestItem(context, _massRequests[index]);
                      },
                      itemCount: _massRequests.length,
                    ),
            ),
          ),
          leftArrowBackButton(context: context),
          SizedBox(
            height: 20.0,
          ),
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
    locator<MassRequestService>().getMassRequests().then(
      ((value) {
        if (this.mounted)
          setState(() {
            debugPrint(value.toString());
            _massRequests = value;
          });
      }),
    );
    super.initState();
  }

  Widget _massRequestItem(BuildContext context, MassRequest massRequest) {
    return Dismissible(
      key: Key(massRequest.id),
      child: Card(
        child: ListTile(
          title: Text(
            massRequest.author,
            style: Theme.of(context)
                .primaryTextTheme
                .title
                .copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            massRequest.name ?? "",
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).primaryTextTheme.title,
            maxLines: 1,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    MassRequestedDetailScreen(massRequest: massRequest),
              ),
            );
          },
        ),
      ),
    );
  }
}
