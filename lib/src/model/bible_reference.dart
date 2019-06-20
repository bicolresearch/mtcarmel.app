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
  @JsonKey(name: "translation_name")
  final String translationName;
  @JsonKey(name: "translation_id")
  final String translationId;
  @JsonKey(name: "translation_note")
  final String translationNote;
  
  BibleReference(this.reference, 
    this.verses, 
    this.text, 
    this.translationId, 
    this.translationName, 
    this.translationNote);
  
    factory BibleReference.fromJson(Map<String, dynamic> json) => _$BibleReferenceFromJson(json);

    Map<String, dynamic> toJson() => _$BibleReferenceToJson(this);
  }

@JsonSerializable()
class Verse{
  Verse(this.verse,
    this.bookId,
    this.bookName,
    this.chapter,
    this.text);

  @JsonKey(name: "book_id")
  final String bookId;
  @JsonKey(name: "book_name")
  final String bookName;
  final String chapter;
  final String verse;
  final String text;

  factory Verse.fromJson(Map<String, dynamic> json) => _$VerseFromJson(json);
  Map<String, dynamic> toJson() => _$VerseToJson(this);
}
