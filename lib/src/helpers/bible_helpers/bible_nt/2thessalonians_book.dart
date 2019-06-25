
/*
*   Filename:   2thessalonians_book.dart
*   Purpose :   Creates the number of chapters and verses of 2Thessalonians book.
*   Created :   2019-06-18 23:30:02 by Detective Conan
*   Updated :   2019-06-18 23:30:02 by Detective Conan 
*   Changes :
*/
        

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class SecondThessaloniansBook extends BibleBook{
  
  List<Chapter> chapters = [];

  SecondThessaloniansBook(){
    super.bookName = '2Thessalonians';
    super.numberOfChapters = 3;
        _assignChapters();
      }

  //TODO add chapters  
  void _assignChapters() {}
}        
            