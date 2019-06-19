
/*
*   Filename:   leviticus_book.dart
*   Purpose :   Creates the number of chapters and verses of Leviticus book.
*   Created :   2019-06-18 23:30:02 by Detective Conan
*   Updated :   2019-06-18 23:30:02 by Detective Conan 
*   Changes :
*/
        

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class LeviticusBook extends BibleBook{
  
  List<Chapter> chapters = [];

  LeviticusBook(){
    super.bookName = 'Leviticus';
    super.numberOfChapters = 27;
    _assignChapters();
      }

  //TODO add chapters  
  void _assignChapters() {}
}        
            