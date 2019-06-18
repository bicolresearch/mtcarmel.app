
/*
*   Filename:   ecclesiastes_book.dart
*   Purpose :   Creates the number of chapters and verses of Ecclesiastes book.
*   Created :   2019-06-18 23:30:02 by Detective Conan
*   Updated :   2019-06-18 23:30:02 by Detective Conan 
*   Changes :
*/
        

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class EcclesiastesBook extends BibleBook{
  
  List<Chapter> chapters = [];

  EcclesiastesBook(){
    super.bookName = 'Ecclesiastes';
    _assignChapters();
      }

  //TODO add chapters  
  void _assignChapters() {}
}        
            