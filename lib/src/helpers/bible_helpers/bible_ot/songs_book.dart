
/*
*   Filename:   songs_book.dart
*   Purpose :   Creates the number of chapters and verses of Songs book.
*   Created :   2019-06-18 23:30:02 by Detective Conan
*   Updated :   2019-06-18 23:30:02 by Detective Conan 
*   Changes :
*/
        

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class SongsBook extends BibleBook{
  
  List<Chapter> chapters = [];

  SongsBook(){
    super.bookName = 'Songs';
    super.numberOfChapters = 8;
    _assignChapters();
      }

  //TODO add chapters  
  void _assignChapters() {}
}        
            