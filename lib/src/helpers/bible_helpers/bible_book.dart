/*
*	Filename		:	bible_book.dart
*	Purpose			:	Abstract class to be implemented by specific book of the bible
* Created			: 2019-06-18 14:05:07 by Detective Conan
*	Updated			: 2019-06-18 14:05:07 by Detective Conan 
*	Changes			:
*/

abstract class BibleBook{
  String bookName;
  List<Chapter> chapters;
  int numberOfChapters;
}

class Chapter{
  Chapter(this.chapterPosition, this.numberOfVerses);
  final int chapterPosition;
  final int numberOfVerses;
}