
/*
*   Filename:   ezekiel_book.dart
*   Purpose :   Creates the number of chapters and verses of Ezekiel book.
*   Created :   2019-06-18 23:30:02 by Detective Conan
*   Updated :   2019-06-18 23:30:02 by Detective Conan 
*   Changes :
*/
        

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class EzekielBook extends BibleBook{
  
  List<Chapter> chapters = [];

  EzekielBook(){
    super.bookName = 'Ezekiel';
    super.numberOfChapters = 48;
    _assignChapters();
      }

  //TODO add chapters  
  void _assignChapters() {}
}        
            