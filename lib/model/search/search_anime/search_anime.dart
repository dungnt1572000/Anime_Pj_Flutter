import 'package:json_annotation/json_annotation.dart';
import 'package:net_working/model/search/search_anime/result_anime.dart';

part 'search_anime.g.dart';
@JsonSerializable()
class Search_Anime {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  List<Results_Anime> results;
  int lastPage;

  Search_Anime({required this.requestHash,
    required this.requestCached,
    required this.requestCacheExpiry,
    required this.results,
    required this.lastPage});

  factory Search_Anime.fromJson(Map<String,dynamic> json)=> _$Search_AnimeFromJson(json);

  Map<String, dynamic> toJson() => _$Search_AnimeToJson(this);
}

