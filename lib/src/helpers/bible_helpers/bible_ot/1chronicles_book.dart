
/*
*   Filename:   1chronicles_book.dart
*   Purpose :   Creates the number of chapters and verses of 1Chronicles book.
*   Created :   2019-06-18 23:30:02 by Detective Conan
*   Updated :   2019-06-18 23:30:02 by Detective Conan 
*   Changes :
*/
        

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class FirstChroniclesBook extends BibleBook{
  
  List<Chapter> chapters = [];

  FirstChroniclesBook(){
    super.bookName = '1Chronicles';
    super.numberOfChapters = 29;
    _assignChapters();
      }

  //TODO add chapters  
  void _assignChapters() {}
}        
            