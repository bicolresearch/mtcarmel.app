/*
*	Filename		:	bible_books.dart
*	Purpose			:	Responsible for the collection of Bible books
* Created			: 2019-06-18 14:04:02 by Detective Conan
*	Updated			: 2019-06-18 14:04:02 by Detective Conan 
*	Changes			:
*/

import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/1corinthians_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/1john_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/1peter_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/1thessalonians_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/1timothy_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/2corinthians_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/2john_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/2peter_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/2thessalonians_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/2timothy_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/3john_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/acts_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/colossians_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/ephesians_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/galatians_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/hebrews_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/james_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/john_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/jude_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/luke_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/mark_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/matthew_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/philemon_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/philippians_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/revelation_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/romans_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_nt/titus_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/1chronicles_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/1kings_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/1samuel_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/2chronicles_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/2kings_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/2samuel_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/amos_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/daniel_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/ecclesiastes_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/esther_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/exodus_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/ezekiel_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/ezra_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/genesis_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/habakkuk_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/haggai_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/hosea_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/isaiah_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/jeremiah_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/job_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/joel_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/jonah_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/joshua_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/judges_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/lamentations_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/leviticus_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/malachi_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/micah_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/nahum_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/nehemiah_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/numbers_book.dart';
// import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/leviticus_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/deuteronomy_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/obadiah_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/proverbs_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/psalms_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/ruth_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/songs_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/zechariah_book.dart';
import 'package:mt_carmel_app/src/helpers/bible_helpers/bible_ot/zephaniah_book.dart';

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
    oldTestamentBooks.add(LeviticusBook());
    oldTestamentBooks.add(NumbersBook());
    oldTestamentBooks.add(DeuteronomyBook());
    oldTestamentBooks.add(JoshuaBook());
    oldTestamentBooks.add(JudgesBook());
    oldTestamentBooks.add(RuthBook());
    oldTestamentBooks.add(FirstSamuelBook());
    oldTestamentBooks.add(SecondSamuelBook());
    oldTestamentBooks.add(FirstKingsBook());
    oldTestamentBooks.add(SecondKingsBook());
    oldTestamentBooks.add(FirstChroniclesBook());
    oldTestamentBooks.add(SecondChroniclesBook());
    oldTestamentBooks.add(EzraBook());
    oldTestamentBooks.add(NehemiahBook());
    oldTestamentBooks.add(EstherBook());
    oldTestamentBooks.add(JobBook());
    oldTestamentBooks.add(PsalmsBook());
    oldTestamentBooks.add(ProverbsBook());
    oldTestamentBooks.add(EcclesiastesBook());
    oldTestamentBooks.add(SongsBook());
    oldTestamentBooks.add(IsaiahBook());
    oldTestamentBooks.add(JeremiahBook());
    oldTestamentBooks.add(LamentationsBook());
    oldTestamentBooks.add(EzekielBook());
    oldTestamentBooks.add(DanielBook());
    oldTestamentBooks.add(HoseaBook());
    oldTestamentBooks.add(JoelBook());
    oldTestamentBooks.add(AmosBook());
    oldTestamentBooks.add(ObadiahBook());
    oldTestamentBooks.add(JonahBook());
    oldTestamentBooks.add(MicahBook());
    oldTestamentBooks.add(NahumBook());
    oldTestamentBooks.add(HabakkukBook());
    oldTestamentBooks.add(ZephaniahBook());
    oldTestamentBooks.add(HaggaiBook());
    oldTestamentBooks.add(ZechariahBook());
    oldTestamentBooks.add(MalachiBook());
  }
    
  void _addNewTestamentBooks() {
    // TODO add new testament books
    newTestamentBooks.add(MatthewBook());
    newTestamentBooks.add(MarkBook());
    newTestamentBooks.add(LukeBook());
    newTestamentBooks.add(JohnBook());
    newTestamentBooks.add(ActsBook());
    newTestamentBooks.add(RomansBook());
    newTestamentBooks.add(FirstCorinthiansBook());
    newTestamentBooks.add(SecondCorinthiansBook());
    newTestamentBooks.add(GalatiansBook());
    newTestamentBooks.add(EphesiansBook());
    newTestamentBooks.add(PhilippiansBook());
    newTestamentBooks.add(ColossiansBook());
    newTestamentBooks.add(FirstThessaloniansBook());
    newTestamentBooks.add(SecondThessaloniansBook());
    newTestamentBooks.add(FirstTimothyBook());
    newTestamentBooks.add(SecondTimothyBook());
    newTestamentBooks.add(TitusBook());
    newTestamentBooks.add(PhilemonBook());
    newTestamentBooks.add(HebrewsBook());
    newTestamentBooks.add(JamesBook());
    newTestamentBooks.add(FirstPeterBook());
    newTestamentBooks.add(SecondPeterBook());
    newTestamentBooks.add(FirstJohnBook());
    newTestamentBooks.add(SecondJohnBook());
    newTestamentBooks.add(ThreeJohnBook());
    newTestamentBooks.add(JudeBook());
    newTestamentBooks.add(RevelationBook());
  }
}