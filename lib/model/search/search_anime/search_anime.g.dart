// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_anime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Search_Anime _$Search_AnimeFromJson(Map<String, dynamic> json) => Search_Anime(
      requestHash: json['request_hash'] as String,
      requestCached: json['request_cached'] as bool,
      requestCacheExpiry: json['request_cache_expiry'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => Results_Anime.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastPage: json['last_page'] as int,
    );

Map<String, dynamic> _$Search_AnimeToJson(Search_Anime instance) =>
    <String, dynamic>{
      'requestHash': instance.requestHash,
      'requestCached': instance.requestCached,
      'requestCacheExpiry': instance.requestCacheExpiry,
      'results': instance.results,
      'lastPage': instance.lastPage,
    };
