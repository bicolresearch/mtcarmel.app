
/*
*   Filename:   1peter_book.dart
*   Purpose :   Creates the number of chapters and verses of 1Peter book.
*   Created :   2019-06-18 23:30:02 by Detective Conan
*   Updated :   2019-06-18 23:30:02 by Detective Conan 
*   Changes :
*/
        

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class FirstPeterBook extends BibleBook{
  
  List<Chapter> chapters = [];

  FirstPeterBook(){
    super.bookName = '1Peter';
    super.numberOfChapters = 5;
        _assignChapters();
      }

  //TODO add chapters  
  void _assignChapters() {}
}        
            