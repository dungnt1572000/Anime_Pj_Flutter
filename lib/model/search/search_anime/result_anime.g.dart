// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_anime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Results_Anime _$Results_AnimeFromJson(Map<String, dynamic> json) =>
    Results_Anime(
      malId: json['malId'] as int,
      url: json['url'] as String,
      imageUrl: json['imageUrl'] as String,
      title: json['title'] as String,
      airing: json['airing'] as bool,
      synopsis: json['synopsis'] as String,
      type: json['type'] as String,
      episodes: json['episodes'] as int,
      score: (json['score'] as num).toDouble(),
      startDate: json['startDate'],
      endDate: json['endDate'],
      members: json['members'] as int,
      rated: json['rated'],
    );

Map<String, dynamic> _$Results_AnimeToJson(Results_Anime instance) =>
    <String, dynamic>{
      'malId': instance.malId,
      'url': instance.url,
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'airing': instance.airing,
      'synopsis': instance.synopsis,
      'type': instance.type,
      'episodes': instance.episodes,
      'score': instance.score,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'members': instance.members,
      'rated': instance.rated,
    };
