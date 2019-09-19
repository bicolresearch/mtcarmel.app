/*
*	 Filename		 :	 priest_screen.dart
*	 Purpose		 :	 Shows the Carmelites Priests
*  Created		 :   2019-06-11 14:14:18 by Detective Conan
*	 Updated			:   19/09/2019 10:11 AM PM by Detective Conan
*	 Changes			:   Changed the title to current branch view
**/

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/priests_bloc/priests_bloc.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';

import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/data_priest.dart';
import 'package:mt_carmel_app/src/models/priest.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';
import 'dart:async';
import 'dart:convert';

import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';

class PriestsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final branch = locator<BranchService>().branch;
    final priests = BlocProvider.of<PriestsBloc>(context).priests;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${branch.name}",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .subhead
                              .copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Carmelite Priests",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .title
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Container(
                          child: GridView.count(
                        physics: ScrollPhysics(parent: ScrollPhysics()),
                        shrinkWrap: true,
                        primary: true,
                        crossAxisCount: 2,
                        children: List.generate(priests.length, (index) {
                          try {
                            return getStructuredGridCell(
                                context, priests[index]);
                          } catch (e) {
                            print(e.toString());
                            return Container();
                          }
                        }),
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Card getStructuredGridCell(context, Priest priest) {
    String url = AppConstants.API_BASE_URL + priest.mediaPath;
    return Card(
      elevation: 1.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5.0),
            width: 88.0,
            height: 88.0,
            child: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(url),
              backgroundColor: Colors.brown,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  priest.name,
                  style: Theme.of(context).primaryTextTheme.caption.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
                (priest.position != null)
                    ? Text(
                        priest.position,
                        style: Theme.of(context).primaryTextTheme.caption,
                        textAlign: TextAlign.center,
                        softWrap: true,
                      )
                    : Container(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
