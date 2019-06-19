
/*
*   Filename:   numbers_book.dart
*   Purpose :   Creates the number of chapters and verses of Numbers book.
*   Created :   2019-06-18 23:30:02 by Detective Conan
*   Updated :   2019-06-18 23:30:02 by Detective Conan 
*   Changes :
*/
        

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class NumbersBook extends BibleBook{
  
  List<Chapter> chapters = [];

  NumbersBook(){
    super.bookName = 'Numbers';
    super.numberOfChapters = 36;
    _assignChapters();
      }

  //TODO add chapters  
  void _assignChapters() {}
}        
            