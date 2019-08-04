/*
*  Filename    :   bible_book_screen.dart
*  Purpose     :
*  Created     :   2019-07-15 09:45 by Detective Conan
*	 Updated			:   04/08/2019 9:23 PM PM by Detective Conan
*	 Changes			:   Adapt to new api's text format
*  */

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

import 'package:mt_carmel_app/src/models/bible_reference.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class BibleBookScreen extends StatefulWidget {
  BibleBookScreen({Key key, @required this.book}) : super(key: key);

  final BibleBook book;

  _BibleBookScreenState createState() => _BibleBookScreenState(book);
}

class _BibleBookScreenState extends State<BibleBookScreen> {
  _BibleBookScreenState(this.book);

  final BibleBook book;
  var _chapterSelect = "Chapter 1";
  List<String> _chapters = [];

  BibleReference _reference;

  var _isLoading = true;

  var _isJsonFailed = false;

  @override
  void initState() {
    _initChapters();
    super.initState();
    this.getJsonData();
  }

  Future<BibleReference> getJsonData() async {
    var response = await http.get(AppConstants.BIBLE_JSON_BASE_URL +
        book.bookName +
        _chapterSelect +
        "?translation=kjv");
    if (this.mounted) {
      setState(() {
        if (response.statusCode == 200) {
          try {
            final body = json.decode(response.body);

            _reference = BibleReference.fromJson(body);
          } catch (e) {
            print(e.toString() + "...");
            print(response.body);
          }
          _isLoading = false;
        } else {
          print(response.statusCode);
          _isJsonFailed = true;
          _isLoading = false;
        }
      });
    }
    return _reference;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                child: Text("King James Version",
                    style: Theme.of(context).primaryTextTheme.subhead),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(this.book.bookName,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .title
                          .copyWith(fontWeight: FontWeight.bold)),
                  DropdownButton<String>(
                    value: _chapterSelect,
                    onChanged: (String newValue) {
                      setState(() {
                        _chapterSelect = newValue;
                        getJsonData();
                      });
                    },
                    items:
                        _chapters.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: Theme.of(context).primaryTextTheme.subhead,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: (_reference == null)
                        ? LoadingIndicator()
                        : _chapterText(),
                  ),
                ),
              ),
              leftArrowBackButton(context: context),
            ],
          ),
        ),
      ),
    );
  }

  void _initChapters() {
    for (int i = 1; i <= this.book.numberOfChapters; i++) {
      _chapters.add("Chapter $i");
    }
  }

  Widget _chapterText() {
    return ListView.builder(
        itemCount: (_reference == null) ? 0 : _reference.verses.length,
        itemBuilder: (context, index) {
          return Text(
//              "\t${index + 1} ${utf8.decode(_reference.verses[index].text.codeUnits)}",
          "\t${index + 1} ${_reference.verses[index].text}",
              style: Theme.of(context).primaryTextTheme.subhead);
        });
  }
}
