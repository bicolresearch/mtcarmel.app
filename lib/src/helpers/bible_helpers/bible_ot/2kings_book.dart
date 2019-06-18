
/*
*   Filename:   2kings_book.dart
*   Purpose :   Creates the number of chapters and verses of 2Kings book.
*   Created :   2019-06-18 23:30:02 by Detective Conan
*   Updated :   2019-06-18 23:30:02 by Detective Conan 
*   Changes :
*/
        

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class SecondKingsBook extends BibleBook{
  
  List<Chapter> chapters = [];

  SecondKingsBook(){
    super.bookName = '2Kings';
    _assignChapters();
      }

  //TODO add chapters  
  void _assignChapters() {}
}        
            