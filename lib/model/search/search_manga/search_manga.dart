import 'package:json_annotation/json_annotation.dart';
import 'package:net_working/model/search/search_manga/result.dart';
part 'search_manga.g.dart';

@JsonSerializable()
class Search_Manga {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  List<Results> results;
  int lastPage;

  Search_Manga({required this.requestHash,
    required this.requestCached,
    required this.requestCacheExpiry,
    required this.results,
    required this.lastPage});

  factory Search_Manga.fromJson(Map<String,dynamic> json)=> _$Search_MangaFromJson(json);

  Map<String, dynamic> toJson() => _$Search_MangaToJson(this);
}
