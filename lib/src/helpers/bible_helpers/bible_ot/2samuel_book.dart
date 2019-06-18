
/*
*   Filename:   2samuel_book.dart
*   Purpose :   Creates the number of chapters and verses of 2Samuel book.
*   Created :   2019-06-18 23:30:02 by Detective Conan
*   Updated :   2019-06-18 23:30:02 by Detective Conan 
*   Changes :
*/
        

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class SecondSamuelBook extends BibleBook{
  
  List<Chapter> chapters = [];

  SecondSamuelBook(){
    super.bookName = '2Samuel';
    _assignChapters();
      }

  //TODO add chapters  
  void _assignChapters() {}
}        
            