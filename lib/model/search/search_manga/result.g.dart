// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      malId: json['mal_id'] as int,
      url: json['url'] as String,
      imageUrl: json['image_url'] as String,
      title: json['title'] as String,
      publishing: json['publishing'] as bool,
      synopsis: json['synopsis'] as String,
      type: json['type'] as String,
      chapters: json['chapters'] as int,
      volumes: json['volumes'] as int,
      score: (json['score'] as num).toDouble(),
      startDate: json['start_date'],
      endDate: json['end_date'],
      members: json['members'] as int,
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'malId': instance.malId,
      'url': instance.url,
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'publishing': instance.publishing,
      'synopsis': instance.synopsis,
      'type': instance.type,
      'chapters': instance.chapters,
      'volumes': instance.volumes,
      'score': instance.score,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'members': instance.members,
    };
