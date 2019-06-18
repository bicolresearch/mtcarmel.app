/*
*	Filename		:	genesis_book.dart
*	Purpose			:	Creates the number of chapters and verses of Genisis book.
* Created			: 2019-06-18 14:06:02 by Detective Conan
*	Updated			: 2019-06-18 14:06:02 by Detective Conan 
*	Changes			:
*/

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class GenesisBook extends BibleBook{
  GenesisBook(){
    super.bookName = "Genesis";
    assignChapters();
  }
    
  void assignChapters() {
    List<Chapter> chapters = [];
    chapters.add(Chapter(1, 31));
    chapters.add(Chapter(2, 25));
    chapters.add(Chapter(3, 24));
    chapters.add(Chapter(4, 26));
    chapters.add(Chapter(5, 32));
    chapters.add(Chapter(6, 22));
    chapters.add(Chapter(7, 24));
    chapters.add(Chapter(8, 22));
    chapters.add(Chapter(9, 29));
    chapters.add(Chapter(10, 32));
    chapters.add(Chapter(11, 32));
    chapters.add(Chapter(12, 20));
    chapters.add(Chapter(13, 18));
    chapters.add(Chapter(14, 24));
    chapters.add(Chapter(15, 21));
    chapters.add(Chapter(16, 16));
    chapters.add(Chapter(17, 27));
    chapters.add(Chapter(18, 33));
    chapters.add(Chapter(19, 38));
    chapters.add(Chapter(20, 18));
    chapters.add(Chapter(21, 34));
    chapters.add(Chapter(22, 24));
    chapters.add(Chapter(23, 20));
    chapters.add(Chapter(24, 67));
    chapters.add(Chapter(25, 34));
    chapters.add(Chapter(26, 37));
    chapters.add(Chapter(27, 47));
    chapters.add(Chapter(28, 22));
    chapters.add(Chapter(29, 35));
    chapters.add(Chapter(30, 43));
    chapters.add(Chapter(31, 55));
  }
}