/*
*	 Filename		 :	 bible_screen.dart
*	 Purpose		 :	 displays the list of bible books
*  Created		 :   2019-06-18 10:02:34 by Detective Conan
*  Updated     :   2019-07-25 10:33 by Detective conan
*  Changes     :   Adjusted Spacing between books.
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
        resizeToAvoidBottomPadding: false,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 40.0, 8.0, 0.0),
                  child: Text(
                    "Holy Bible",
                    style: Theme.of(context)
                        .primaryTextTheme
                        .title
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //Old testamentBooks
                        _bookPart(BookPart.OldTestament,
                            _bibleBooks.oldTestamentBooks),
                        //New testamentBooks
                        _bookPart(BookPart.NewTestament,
                            _bibleBooks.newTestamentBooks),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: leftArrowBackButton(context: context),
                ),
              ],
            ),
          ),
        ));
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Divider(),
        ),
        Text(
          (testament == BookPart.OldTestament)
              ? "Old Testaments"
              : "New Testament",
          style: Theme.of(context)
              .primaryTextTheme
              .title
              .copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Divider(),
        ),
        ListView.builder(
          physics: ScrollPhysics(parent: ScrollPhysics()),
          shrinkWrap: true,
          itemCount: bibleBooks.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          BibleBookScreen(book: bibleBooks[index]),
                    ),
                  );
                },
                child: Text(
                  bibleBooks[index].bookName,
                  style: Theme.of(context).primaryTextTheme.title,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
