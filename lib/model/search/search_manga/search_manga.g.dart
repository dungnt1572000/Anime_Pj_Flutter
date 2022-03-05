// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_manga.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Search_Manga _$Search_MangaFromJson(Map<String, dynamic> json) => Search_Manga(
      requestHash: json['requestHash'] as String,
      requestCached: json['requestCached'] as bool,
      requestCacheExpiry: json['requestCacheExpiry'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastPage: json['lastPage'] as int,
    );

Map<String, dynamic> _$Search_MangaToJson(Search_Manga instance) =>
    <String, dynamic>{
      'requestHash': instance.requestHash,
      'requestCached': instance.requestCached,
      'requestCacheExpiry': instance.requestCacheExpiry,
      'results': instance.results,
      'lastPage': instance.lastPage,
    };
