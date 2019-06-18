/*
*	Filename		:	bible_books.dart
*	Purpose			:	Responsible for the collection of Bible books
* Created			: 2019-06-18 14:04:02 by Detective Conan
*	Updated			: 2019-06-18 14:04:02 by Detective Conan 
*	Changes			:
*/

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/exodus_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/genesis_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/numbers_book.dart';
// import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/leviticus_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/deuteronomy_book.dart';

class BibleBooks{  

  List<BibleBook> oldTestamentBooks = [];
  List<BibleBook> newTestamentBooks = [];

  BibleBooks(){
    _addOldTestamentBooks();

    _addNewTestamentBooks();
          }        
    
        
  void _addOldTestamentBooks() {
    // TODO add old testament books
    oldTestamentBooks.add(GenesisBook());
    oldTestamentBooks.add(ExodusBook());
    // oldTestamentBooks.add(LeviticusBook());
    oldTestamentBooks.add(NumbersBook());
    oldTestamentBooks.add(DeuteronomyBook());
    // oldTestamentBooks.add(JoshuaBook());
    // oldTestamentBooks.add(JudgesBook());
    // oldTestamentBooks.add(RuthBook());
    // oldTestamentBooks.add(FirstSamuelBook());
    // oldTestamentBooks.add(SecondSamuelBook());
    // oldTestamentBooks.add(FirstKingsBook());
    // oldTestamentBooks.add(SecondKingsBook());
    // oldTestamentBooks.add(FirstChroniclesBook());
    // oldTestamentBooks.add(SecondChroniclesBook());
    // oldTestamentBooks.add(EzraBook());
    // oldTestamentBooks.add(NehemiahBook());
    // oldTestamentBooks.add(EstherBook());
    // oldTestamentBooks.add(JobBook());
    // oldTestamentBooks.add(PsalmsBook());
    // oldTestamentBooks.add(ProverbsBook());
    // oldTestamentBooks.add(EcclesiastesBook());
    // oldTestamentBooks.add(SongsBook());
    // oldTestamentBooks.add(IsaiahBook());
    // oldTestamentBooks.add(JeremiahBook());
    // oldTestamentBooks.add(LamentationsBook());
    // oldTestamentBooks.add(EzekielBook());
    // oldTestamentBooks.add(DanielBook());
    // oldTestamentBooks.add(HoseaBook());
    // oldTestamentBooks.add(JoelBook());
    // oldTestamentBooks.add(AmosBook());
    // oldTestamentBooks.add(ObadiahBook());
    // oldTestamentBooks.add(JonahBook());
    // oldTestamentBooks.add(MicahBook());
    // oldTestamentBooks.add(NahumBook());
    // oldTestamentBooks.add(HabakkukBook());
    // oldTestamentBooks.add(ZephaniahBook());
    // oldTestamentBooks.add(HaggaiBook());
    // oldTestamentBooks.add(ZechariahBook());
    // oldTestamentBooks.add(MalachiBook());
  }
    
  void _addNewTestamentBooks() {
    // TODO add new testament books
    // newTestamentBooks.add(MatthewBook());
    // newTestamentBooks.add(MarkBook());
    // newTestamentBooks.add(LukeBook());
    // newTestamentBooks.add(JohnBook());
    // newTestamentBooks.add(ActsBook());
    // newTestamentBooks.add(RomansBook());
    // newTestamentBooks.add(FirstCorinthiansBook());
    // newTestamentBooks.add(SecondCorinthiansBook());
    // newTestamentBooks.add(GalatiansBook());
    // newTestamentBooks.add(EphesiansBook());
    // newTestamentBooks.add(PhilippiansBook());
    // newTestamentBooks.add(ColossiansBook());
    // newTestamentBooks.add(FirstThessaloniansBook());
    // newTestamentBooks.add(SecondThessaloniansBook());
    // newTestamentBooks.add(FirstTimothyBook());
    // newTestamentBooks.add(SecondTimothyBook());
    // newTestamentBooks.add(TitusBook());
    // newTestamentBooks.add(PhilemonBook());
    // newTestamentBooks.add(HebrewsBook());
    // newTestamentBooks.add(JamesBook());
    // newTestamentBooks.add(FirstPeterBook());
    // newTestamentBooks.add(SecondPeterBook());
    // newTestamentBooks.add(FirstJohnBook());
    // newTestamentBooks.add(SecondJohnBook());
    // newTestamentBooks.add(ThreeJohnBook());
    // newTestamentBooks.add(JudeBook());
    // newTestamentBooks.add(RevelationBook());
  }
}