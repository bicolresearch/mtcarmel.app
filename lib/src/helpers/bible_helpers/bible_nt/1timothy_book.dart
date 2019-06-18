
/*
*   Filename:   1timothy_book.dart
*   Purpose :   Creates the number of chapters and verses of 1Timothy book.
*   Created :   2019-06-18 23:30:02 by Detective Conan
*   Updated :   2019-06-18 23:30:02 by Detective Conan 
*   Changes :
*/
        

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class FirstTimothyBook extends BibleBook{
  
  List<Chapter> chapters = [];

  FirstTimothyBook(){
    super.bookName = '1Timothy';
    _assignChapters();
      }

  //TODO add chapters  
  void _assignChapters() {}
}        
            