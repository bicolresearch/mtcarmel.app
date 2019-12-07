/*
*  Filename    :   prayer_requested_detail_screen.dart
*  Purpose     :	
*  Created     :   2019-08-20 18:35 by Detective Conan
*  Updated     :   2019-08-23 10:29 by Detective conan
*  Changes     :   converted to statelessWidget. Added massPurpose argument to
*                  the constructor.
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/mass_request_bloc/mass_request_bloc.dart';
import 'package:mt_carmel_app/src/models/mass_request.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:provider/provider.dart';

class MassRequestedDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final massRequest = Provider.of<MassRequest>(context);
    final serviceName = Provider.of<String>(context);
    DateTime datePosted =
        DateTime.parse("${massRequest.dtCreated??"01-01-2019"}");
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                "$serviceName",
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
                          "Requested by: ${massRequest.createdBy}",
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Purpose Mass: ${massRequest.purposeName}",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .subtitle
                              .copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Text(
                        massRequest.name ?? "",
                        style: Theme.of(context).primaryTextTheme.title,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
