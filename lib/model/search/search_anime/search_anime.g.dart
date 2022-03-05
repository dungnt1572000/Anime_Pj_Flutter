// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_anime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Search_Anime _$Search_AnimeFromJson(Map<String, dynamic> json) => Search_Anime(
      requestHash: json['requestHash'] as String,
      requestCached: json['requestCached'] as bool,
      requestCacheExpiry: json['requestCacheExpiry'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => Results_Anime.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastPage: json['lastPage'] as int,
    );

Map<String, dynamic> _$Search_AnimeToJson(Search_Anime instance) =>
    <String, dynamic>{
      'requestHash': instance.requestHash,
      'requestCached': instance.requestCached,
      'requestCacheExpiry': instance.requestCacheExpiry,
      'results': instance.results,
      'lastPage': instance.lastPage,
    };
