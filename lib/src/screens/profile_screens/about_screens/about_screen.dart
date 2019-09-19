/*
*	 Filename		 :	 about_screen.dart
*	 Purpose		 :	 Show the details about the church.
*  Created		 :   2019-06-13 12:37:11 by Detective Conan
*	 Updated			:   18/09/2019 5:27 PM PM by Detective Conan
*	 Changes			:   Changed the branch name size to soft wrap.
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html_textview_render/html_text_view.dart';
import 'package:mt_carmel_app/src/blocs/about_bloc/about_bloc.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';

import 'package:mt_carmel_app/src/models/about.dart';
import 'package:mt_carmel_app/src/models/branch.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Branch branch = locator<BranchService>().branch;
    final About about = BlocProvider.of<AboutBloc>(context).about;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 30.0),
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        border: Border.all(width: 0.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${branch.name}",
                          style: TextStyle(
                              color: Colors.white, fontFamily: "Helvetica"),
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(AppConstants.MT_CARMEL_LOGO_PATH,
                          height: 160),
                    ),
                    _aboutBlock(context, about),
                    SizedBox(
                      height: 20.0,
                    ),
                    _history(context, about),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _history(BuildContext context, About about) {
    if (about == null || about.content == null || about.content.isEmpty)
      return Container();
    else {
      return Column(
        children: <Widget>[
          Text(
            "History",
            style: Theme.of(context)
                .primaryTextTheme
                .title
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HtmlTextView(
              data: "<div style='color: #5d4037'>${about.content}</div>",
              anchorColor: Color(0xFFFF0000),
            ),
          )
        ],
      );
    }
  }

  Widget _aboutItem(BuildContext context, _AboutItem aboutItem) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  "${aboutItem.label()} :",
                  style: Theme.of(context).primaryTextTheme.subhead,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Text(
                  "${aboutItem._value}",
                  style: Theme.of(context).primaryTextTheme.subhead,
                  textAlign: TextAlign.left,
                ),
              ),
              Divider(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _aboutBlock(
    BuildContext context,
    About about,
  ) {
    if (about == null) return Container();
    List<_AboutItem> aboutItems = [];

    if (about != null) {
      aboutItems
          .add(_AboutItem(about, _AboutItem._DATE_OF_ESTABLISHMENT_LABEL));
      aboutItems.add(_AboutItem(about, _AboutItem._FEAST_DAY_LABEL));
      aboutItems.add(_AboutItem(about, _AboutItem._TITULAR_LABEL));
      aboutItems.add(_AboutItem(about, _AboutItem._DIOCESE_LABEL));
    }
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "About the Church",
            style: Theme.of(context)
                .primaryTextTheme
                .title
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(parent: ScrollPhysics()),
            itemCount: aboutItems.length,
            itemBuilder: (context, index) {
              return _aboutItem(context, aboutItems[index]);
            }),
        Divider(),
      ],
    );
  }
}

class _AboutItem {
  static const String _DATE_OF_ESTABLISHMENT_LABEL = "Date of Establishment";
  static const String _FEAST_DAY_LABEL = "Feast day";
  static const String _TITULAR_LABEL = "Titular";
  static const String _DIOCESE_LABEL = "Diocese";

  String _label;
  String _value;

  _AboutItem(About about, String label) {
    _label = label;
    switch (label) {
      case _DATE_OF_ESTABLISHMENT_LABEL:
        _value = about.dateOfEstablishment;
        break;
      case _FEAST_DAY_LABEL:
        _value = about.feastDay;
        break;
      case _TITULAR_LABEL:
        _value = about.titular;
        break;
      case _DIOCESE_LABEL:
        _value = about.diocese;
        break;
    }
  }

  String label() {
    return _label;
  }

  String value() {
    return _value;
  }
}
