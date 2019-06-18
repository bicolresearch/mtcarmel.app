
/*
*   Filename:   1kings_book.dart
*   Purpose :   Creates the number of chapters and verses of 1Kings book.
*   Created :   2019-06-18 23:30:02 by Detective Conan
*   Updated :   2019-06-18 23:30:02 by Detective Conan 
*   Changes :
*/
        

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class FirstKingsBook extends BibleBook{
  
  List<Chapter> chapters = [];

  FirstKingsBook(){
    super.bookName = '1Kings';
    _assignChapters();
      }

  //TODO add chapters  
  void _assignChapters() {}
}        
            