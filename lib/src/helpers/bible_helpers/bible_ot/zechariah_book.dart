
/*
*   Filename:   zechariah_book.dart
*   Purpose :   Creates the number of chapters and verses of Zechariah book.
*   Created :   2019-06-18 23:30:02 by Detective Conan
*   Updated :   2019-06-18 23:30:02 by Detective Conan 
*   Changes :
*/
        

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class ZechariahBook extends BibleBook{
  
  List<Chapter> chapters = [];

  ZechariahBook(){
    super.bookName = 'Zechariah';
    _assignChapters();
      }

  //TODO add chapters  
  void _assignChapters() {}
}        
            