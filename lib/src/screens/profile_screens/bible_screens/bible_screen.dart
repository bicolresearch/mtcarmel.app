/*
*	 Filename		 :	 bible_screen.dart
*	 Purpose		 :	 displays the list of bible books
*  Created		 :   2019-06-18 10:02:34 by Detective Conan
*	 Updated			:   20/09/2019 9:26 AM PM by Detective Conan
*	 Changes			:   Added card for the book name
*/

import 'package:flutter/material.dart';

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_books.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/bible_screens/bible_book_screen.dart';

import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';

enum BookPart { OldTestament, NewTestament }

class BibleScreen extends StatefulWidget {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

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
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
              child: Text(
                "Holy Bible",
                style: Theme.of(context)
                    .primaryTextTheme
                    .title
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Divider(),
                    //Old testamentBooks
                    _bookPart(
                        BookPart.OldTestament, _bibleBooks.oldTestamentBooks),
                    Divider(),
                    //New testamentBooks
                    _bookPart(
                        BookPart.NewTestament, _bibleBooks.newTestamentBooks),
                    Divider(),
                  ],
                ),
              ),
            ),
            leftArrowBackButton(context: context),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  List<String> booksToStrings(List<BibleBook> books) {
    List<String> bookList = [];
    for (BibleBook book in books) {
      bookList.add(book.bookName);
    }
    return bookList;
  }

  void close() {
    this.dispose();
  }

  Widget _bookPart(BookPart testament, List<BibleBook> bibleBooks) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ExpansionTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 34.0),
            child: Text(
              (testament == BookPart.OldTestament)
                  ? "Old Testaments"
                  : "New Testament",
              style: Theme.of(context)
                  .primaryTextTheme
                  .title
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          children: [
            ListView.builder(
              physics: ScrollPhysics(parent: ScrollPhysics()),
              shrinkWrap: true,
              itemCount: bibleBooks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BibleBookScreen(book: bibleBooks[index]),
                        ),
                      );
                    },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        height: 50.0,
                        child: Card(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                                bibleBooks[index].bookName,
                                style: Theme.of(context).primaryTextTheme.title,
                                textAlign: TextAlign.center,
                              ),
                          ),
                        ),
                      ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
