import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

import 'package:mt_carmel_app/src/models/bible_reference.dart';
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
  var _chapterContent = "";
  List<String> _chapters = [];

  List<Verse> _verses = [];

  BibleReference _reference;

  var _isLoading = true;

  var _isJsonFailed = false;

  @override
  void initState() {
    _initChapters();
    super.initState();
    this.getJasonData();
  }

  Future<BibleReference> getJasonData() async {
    var response = await http
        .get(AppConstants.BIBLE_JSON_BASE_URL + book.bookName + _chapterSelect+ "?translation=kjv");
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
                    style: AppConstants.OPTION_STYLE2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(this.book.bookName, style: AppConstants.OPTION_STYLE3),
                  DropdownButton<String>(
                    value: _chapterSelect,
                    onChanged: (String newValue) {
                      setState(() {
                        _chapterSelect = newValue;
                        getJasonData();
                      });
                    },
                    items:
                        _chapters.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: AppConstants.OPTION_STYLE2,
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
                    ? CircularProgressIndicator()
                :_chapterText(),
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
        itemCount: (_reference==null)?0:_reference.verses.length,
        itemBuilder: (context, index) {
          return Text("\t${index+1} ${_reference.verses[index].text}",
                      style: AppConstants.OPTION_STYLE2);
        });
  }

}

