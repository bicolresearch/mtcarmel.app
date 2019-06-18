/*
*	Filename		:	bible_reference.dart
*	Purpose			:	Model for bible api
* Created			: 2019-06-18 14:09:06 by Detective Conan
*	Updated			: 2019-06-18 14:09:06 by Detective Conan 
*	Changes			:
*/

import 'package:json_annotation/json_annotation.dart';

part 'bible_reference.g.dart';

@JsonSerializable()
class BibleReference{
  
  final String reference;
  final List<Verse> verses;
  final String text; 
  final String translation_name;
  final String translation_id;
  final String translation_note;
  
  BibleReference(this.reference, 
    this.verses, 
    this.text, 
    this.translation_id, 
    this.translation_name, 
    this.translation_note);
  
    Map<String, dynamic> toJson() => _$BibleReferenceToJson(this);

    factory BibleReference.fromJson(Map<String, dynamic> json) => _$BibleReferenceFromJson(json);
  }

@JsonSerializable()
class Verse{
  Verse(this.verse,
    this.book_id,
    this.book_name,
    this.chapter,
    this.text);

  final String book_id;
  final String book_name;
  final String chapter;
  final String verse;
  final String text;

  factory Verse.fromJson(Map<String, dynamic> json) => _$VerseFromJson(json);
  Map<String, dynamic> toJson() => _$VerseToJson(this);
}
