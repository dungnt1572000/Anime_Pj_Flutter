import 'package:json_annotation/json_annotation.dart';

part 'result_anime.g.dart';
@JsonSerializable()
class Results_Anime {
  int malId;
  String url;
  String imageUrl;
  String title;
  bool airing;
  String synopsis;
  String type;
  int episodes;
  double score;
  dynamic startDate;
  dynamic endDate;
  int members;
  dynamic rated;

  Results_Anime({required this.malId,
    required this.url,
    required this.imageUrl,
    required this.title,
    required this.airing,
    required this.synopsis,
    required this.type,
    required this.episodes,
    required this.score,
    required this.startDate,
    required this.endDate,
    required this.members,
    required this.rated});

  factory Results_Anime.fromJson(Map<String, dynamic> json)=> _$Results_AnimeFromJson(json);
  Map<String, dynamic> toJson()=>_$Results_AnimeToJson(this);
}