
/*
*   Filename:   psalms_book.dart
*   Purpose :   Creates the number of chapters and verses of Psalms book.
*   Created :   2019-06-18 23:30:02 by Detective Conan
*   Updated :   2019-06-18 23:30:02 by Detective Conan 
*   Changes :
*/
        

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class PsalmsBook extends BibleBook{
  
  List<Chapter> chapters = [];

  PsalmsBook(){
    super.bookName = 'Psalms';
    _assignChapters();
      }

  //TODO add chapters  
  void _assignChapters() {}
}        
            