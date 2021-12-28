import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Results {
  int malId;
  String url;
  String imageUrl;
  String title;
  bool publishing;
  String synopsis;
  String type;
  int chapters;
  int volumes;
  double score;
  dynamic startDate;
  dynamic endDate;
  int members;

  Results({required this.malId,
      required this.url,
      required this.imageUrl,
      required this.title,
      required this.publishing,
      required this.synopsis,
      required this.type,
      required this.chapters,
      required this.volumes,
      required this.score,
      this.startDate,
      this.endDate,
      required this.members});
  factory Results.fromJson(Map<String, dynamic> json)=> _$ResultsFromJson(json);
  Map<String, dynamic> toJson()=>_$ResultsToJson(this);
}