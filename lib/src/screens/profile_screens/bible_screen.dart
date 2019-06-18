/*
*	Filename		:	bible_screen.dart
*	Purpose			:	displays the list of bible books
* Created			: 2019-06-18 10:02:34 by Detective Conan
*	Updated			: 2019-06-18 10:02:34 by Detective Conan 
*	Changes			:
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_books.dart';

import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';


class BibleScreen extends StatefulWidget {

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  BibleScreen(BuildContext context);

  @override
  _BibleScreenState createState() => _BibleScreenState();
}

class _BibleScreenState extends State<BibleScreen> {

  BibleBooks _bibleBooks;

  @override
  void initState() {  
    _bibleBooks = BibleBooks();
    super.initState();
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Old Testaments",
                style: AppConstants.OPTION_STYLE3,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height - 200.0,
                  child: _bibleBooks.oldTestamentBooks.isNotEmpty
                      ?GridView.count(
                        primary: true,
                        crossAxisCount: 3,
                        children: List.generate(_bibleBooks.oldTestamentBooks.length, (index) {
                          return getStructuredGridCell(_bibleBooks.oldTestamentBooks[index]);
                        }   
                      ),
                    ):LinearProgressIndicator(),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: leftArrowBackButton(context: context),
          ),
          ],
        ),
      )        
    );
  }

Card getStructuredGridCell(BibleBook bibleBook) {
    return Card(
      elevation: 1.5,
      child: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0,5.0),
          child: Text(bibleBook.bookName, style: AppConstants.OPTION_STYLE2, 
            textAlign: TextAlign.center,),
        ),
      )
    );
  }
  
  void close(){    
    this.dispose();
  }    
}