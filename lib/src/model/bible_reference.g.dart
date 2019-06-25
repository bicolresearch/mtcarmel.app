// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bible_reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BibleReference _$BibleReferenceFromJson(Map<String, dynamic> json) {
  return BibleReference(
      json['reference'] as String,
      (json['verses'] as List)
          ?.map((e) =>
              e == null ? null : Verse.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['text'] as String,
      json['translation_id'] as String,
      json['translation_name'] as String,
      json['translation_note'] as String);
}

Map<String, dynamic> _$BibleReferenceToJson(BibleReference instance) =>
    <String, dynamic>{
      'reference': instance.reference,
      'verses': instance.verses,
      'text': instance.text,
      'translation_name': instance.translationName,
      'translation_id': instance.translationId,
      'translation_note': instance.translationNote
    };

Verse _$VerseFromJson(Map<String, dynamic> json) {
  return Verse(
      json['verse'] as int,
      json['book_id'] as String,
      json['book_name'] as String,
      json['chapter'] as int,
      json['text'] as String);
}

Map<String, dynamic> _$VerseToJson(Verse instance) => <String, dynamic>{
      'book_id': instance.bookId,
      'book_name': instance.bookName,
      'chapter': instance.chapter,
      'verse': instance.verse,
      'text': instance.text
    };
