
/*
*   Filename:   habakkuk_book.dart
*   Purpose :   Creates the number of chapters and verses of Habakkuk book.
*   Created :   2019-06-18 23:30:02 by Detective Conan
*   Updated :   2019-06-18 23:30:02 by Detective Conan 
*   Changes :
*/
        

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class HabakkukBook extends BibleBook{
  
  List<Chapter> chapters = [];

  HabakkukBook(){
    super.bookName = 'Habakkuk';
    super.numberOfChapters = 3;
    _assignChapters();
      }

  //TODO add chapters  
  void _assignChapters() {}
}        
            