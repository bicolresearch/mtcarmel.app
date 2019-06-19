/*
*	Filename		:	genesis_book.dart
*	Purpose			:	Creates the number of chapters and verses of Genisis book.
* Created			: 2019-06-18 14:06:02 by Detective Conan
*	Updated			: 2019-06-18 14:06:02 by Detective Conan 
*	Changes			:
*/

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';

class GenesisBook extends BibleBook{
  
  List<Chapter> chapters = [];

  GenesisBook(){
    super.bookName = "Genesis";
    super.numberOfChapters = 50;
    _assignChapters();
  }
    
  void _assignChapters() {
    // 50 chapters total
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
    chapters.add(Chapter(32, 32));
    chapters.add(Chapter(33, 20));
    chapters.add(Chapter(34, 31));
    chapters.add(Chapter(35, 29));
    chapters.add(Chapter(36, 43)); 
    chapters.add(Chapter(37, 36)); 
    chapters.add(Chapter(38, 30)); 
    chapters.add(Chapter(39, 23)); 
    chapters.add(Chapter(40, 23)); 
    chapters.add(Chapter(41, 57));
    chapters.add(Chapter(42, 38));
    chapters.add(Chapter(43, 34));
    chapters.add(Chapter(44, 34));
    chapters.add(Chapter(45, 28));
    chapters.add(Chapter(46, 34));
    chapters.add(Chapter(47, 31));
    chapters.add(Chapter(48, 22));
    chapters.add(Chapter(49, 33));
    chapters.add(Chapter(50, 26));
  }
}