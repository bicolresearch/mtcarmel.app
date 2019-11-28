/*
*	 Filename		 :	 pastor_screen.dart
*	 Purpose		 :	 Displays the list of pastors
*  Created	 	 :   2019-06-11 15:56:33 by Detective Conan
*	 Updated			:   28/11/2019 10:13 AM PM by Detective Conan
*	 Changes			:   Changed the order of the list. Starts with the recent.
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/pastors_bloc/pastors_bloc.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/carmelite.dart';

class PastorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final branch = locator<BranchService>().branch;
    final pastors = BlocProvider.of<PastorsBloc>(context).pastors;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        margin: EdgeInsets.only(top: 50.0, bottom: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10.0, left: 10, right: 10),
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
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Pastors",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .title
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 50.0,
                        ),
                        child: ListView.builder(
                            physics: ScrollPhysics(parent: ScrollPhysics()),
                            shrinkWrap: true,
                            itemCount: pastors.length,
                            itemBuilder: (context, index) {
                              return _pastorItem(
                                  context, pastors[index]);
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pastorItem(context, Carmelite pastor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ListTile(
          title: Text(
            '${pastor.name}',
            style: Theme.of(context).primaryTextTheme.subhead,
            textAlign: TextAlign.center,
          ),
          subtitle: Text(
            '${pastor.position ?? ""}\n${pastor.congregation}',
            style: Theme.of(context).primaryTextTheme.caption,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
