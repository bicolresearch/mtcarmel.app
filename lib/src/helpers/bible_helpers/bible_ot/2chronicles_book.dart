
/*
*   Filename:   2chronicles_book.dart
*   Purpose :   Creates the number of chapters and verses of 2Chronicles book.
*   Created :   2019-06-18 23:30:02 by Detective Conan
*   Updated :   2019-06-18 23:30:02 by Detective Conan 
*   Changes :
*/
        

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class SecondChroniclesBook extends BibleBook{
  
  List<Chapter> chapters = [];

  SecondChroniclesBook(){
    super.bookName = '2Chronicles';
    super.numberOfChapters = 36;
    _assignChapters();
      }

  //TODO add chapters  
  void _assignChapters() {}
}        
            