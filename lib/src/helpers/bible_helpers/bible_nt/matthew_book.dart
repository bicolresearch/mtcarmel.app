
/*
*   Filename:   matthew_book.dart
*   Purpose :   Creates the number of chapters and verses of Matthew book.
*   Created :   2019-06-18 23:30:02 by Detective Conan
*   Updated :   2019-06-18 23:30:02 by Detective Conan 
*   Changes :
*/
        

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class MatthewBook extends BibleBook{
  
  List<Chapter> chapters = [];

  MatthewBook(){
    super.bookName = 'Matthew';
    super.numberOfChapters = 28;
    _assignChapters();
      }

  //TODO add chapters  
  void _assignChapters() {}
}        
            