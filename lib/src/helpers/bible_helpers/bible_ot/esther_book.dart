
/*
*   Filename:   esther_book.dart
*   Purpose :   Creates the number of chapters and verses of Esther book.
*   Created :   2019-06-18 23:30:02 by Detective Conan
*   Updated :   2019-06-18 23:30:02 by Detective Conan 
*   Changes :
*/
        

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class EstherBook extends BibleBook{
  
  List<Chapter> chapters = [];

  EstherBook(){
    super.bookName = 'Esther';
    super.numberOfChapters = 10;
    _assignChapters();
      }

  //TODO add chapters  
  void _assignChapters() {}
}        
            