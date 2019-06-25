
/*
*   Filename:   2peter_book.dart
*   Purpose :   Creates the number of chapters and verses of 2Peter book.
*   Created :   2019-06-18 23:30:02 by Detective Conan
*   Updated :   2019-06-18 23:30:02 by Detective Conan 
*   Changes :
*/
        

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class SecondPeterBook extends BibleBook{
  
  List<Chapter> chapters = [];

  SecondPeterBook(){
    super.bookName = '2Peter';
    super.numberOfChapters = 3;
        _assignChapters();
      }

  //TODO add chapters  
  void _assignChapters() {}
}        
            