
/*
*   Filename:   2corinthians_book.dart
*   Purpose :   Creates the number of chapters and verses of 2Corinthians book.
*   Created :   2019-06-18 23:30:02 by Detective Conan
*   Updated :   2019-06-18 23:30:02 by Detective Conan 
*   Changes :
*/
        

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class SecondCorinthiansBook extends BibleBook{
  
  List<Chapter> chapters = [];

  SecondCorinthiansBook(){
    super.bookName = '2Corinthians';
    super.numberOfChapters = 13;
        _assignChapters();
      }

  //TODO add chapters  
  void _assignChapters() {}
}        
            