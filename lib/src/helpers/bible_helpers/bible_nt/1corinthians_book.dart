
/*
*   Filename:   1corinthians_book.dart
*   Purpose :   Creates the number of chapters and verses of 1Corinthians book.
*   Created :   2019-06-18 23:30:02 by Detective Conan
*   Updated :   2019-06-18 23:30:02 by Detective Conan 
*   Changes :
*/
        

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class FirstCorinthiansBook extends BibleBook{
  
  List<Chapter> chapters = [];

  FirstCorinthiansBook(){
    super.bookName = '1Corinthians';
    _assignChapters();
      }

  //TODO add chapters  
  void _assignChapters() {}
}        
            