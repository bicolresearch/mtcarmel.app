/*
*	Filename		:	bible_books.dart
*	Purpose			:	Responsible for the collection of Bible books
* Created			: 2019-06-18 14:04:02 by Detective Conan
*	Updated			: 2019-06-18 14:04:02 by Detective Conan 
*	Changes			:
*/



import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/genesis_book.dart';

class BibleBooks{  

  List<BibleBook> oldTestamentBooks = [];

  BibleBooks(){
    _addOldTestamentBooks();

    _addNewTestamentBooks();
          }        
    
        
  void _addOldTestamentBooks() {
    // TODO add old testament books
    oldTestamentBooks.add(GenesisBook());
  }
    
  void _addNewTestamentBooks() {
    // TODO add new testament books
  }
}