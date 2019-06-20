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
import 'package:mt_carmel_app/src/screens/profile_screens/bible_screens/bible_book_screen.dart';

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
              padding: const EdgeInsets.fromLTRB(8.0, 40.0, 8.0, 12.0),
              child: Text("Holy Bible",
                style: AppConstants.OPTION_STYLE3,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("Old Testaments",
                style: AppConstants.OPTION_STYLE3,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Container(
                child: _bibleBooks.oldTestamentBooks.isNotEmpty
                    ?GridView.count(
                      shrinkWrap: true,
                      primary: true,
                      crossAxisCount: 3,
                      children: List.generate(_bibleBooks.oldTestamentBooks.length, (index) {
                        return getStructuredGridCell(_bibleBooks.oldTestamentBooks[index]);
                      }   
                    ),
                  ):Container(),
              ),
            ),

          // new testament
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("New Testaments",
                style: AppConstants.OPTION_STYLE3,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Container(
                child: _bibleBooks.newTestamentBooks.isNotEmpty
                    ?GridView.count(
                      primary: true,
                      crossAxisCount: 3,
                      children: List.generate(_bibleBooks.newTestamentBooks.length, (index) {
                        return getStructuredGridCell(_bibleBooks.newTestamentBooks[index]);
                      }   
                    ),
                  ):Container(),
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

Widget getStructuredGridCell(BibleBook bibleBook) {
    return GestureDetector(
      onTap: () {Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BibleBookScreen(book: bibleBook),
          )
        );
      },
      child: Card(
        elevation: 1.5,
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0,5.0),
            child: Text(bibleBook.bookName, style: AppConstants.OPTION_STYLE2, 
              textAlign: TextAlign.center,),
          ),
        )
      ),
    );
  }
  
  void close(){    
    this.dispose();
  }    
}