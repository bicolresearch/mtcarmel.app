
/*
*   Filename:   1thessalonians_book.dart
*   Purpose :   Creates the number of chapters and verses of 1Thessalonians book.
*   Created :   2019-06-18 23:30:02 by Detective Conan
*   Updated :   2019-06-18 23:30:02 by Detective Conan 
*   Changes :
*/
        

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class FirstThessaloniansBook extends BibleBook{
  
  List<Chapter> chapters = [];

  FirstThessaloniansBook(){
    super.bookName = '1Thessalonians';
    _assignChapters();
      }

  //TODO add chapters  
  void _assignChapters() {}
}        
            