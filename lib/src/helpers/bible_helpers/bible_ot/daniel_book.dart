
/*
*   Filename:   daniel_book.dart
*   Purpose :   Creates the number of chapters and verses of Daniel book.
*   Created :   2019-06-18 23:30:02 by Detective Conan
*   Updated :   2019-06-18 23:30:02 by Detective Conan 
*   Changes :
*/
        

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class DanielBook extends BibleBook{
  
  List<Chapter> chapters = [];

  DanielBook(){
    super.bookName = 'Daniel';
    super.numberOfChapters = 12;
    _assignChapters();
      }

  //TODO add chapters  
  void _assignChapters() {}
}        
            