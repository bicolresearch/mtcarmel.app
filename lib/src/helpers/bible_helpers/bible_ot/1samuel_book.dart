
/*
*   Filename:   1samuel_book.dart
*   Purpose :   Creates the number of chapters and verses of 1Samuel book.
*   Created :   2019-06-18 23:30:02 by Detective Conan
*   Updated :   2019-06-18 23:30:02 by Detective Conan 
*   Changes :
*/
        

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class FirstSamuelBook extends BibleBook{
  
  List<Chapter> chapters = [];

  FirstSamuelBook(){
    super.bookName = '1Samuel';
    super.numberOfChapters = 31;
    _assignChapters();
      }

  //TODO add chapters  
  void _assignChapters() {}
}        
            