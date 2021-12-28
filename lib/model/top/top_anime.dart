class Top_Anime {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  List<Top_anime> top;

  Top_Anime(
      this.requestHash, this.requestCached, this.requestCacheExpiry, this.top);

  factory Top_Anime.fromJson(Map<String, dynamic> json) {
    var topanime = json['top'] as List;
    List<Top_anime> _top_anime =
        topanime.map((e) => Top_anime.fromJson(e)).toList();
    return Top_Anime(json['request_hash'], json['request_cached'],
        json['request_cache_expiry'], _top_anime);
  }
}

class Top_anime {
  int malId;
  int rank;
  String title;
  String url;
  String imageUrl;
  String type;
  dynamic episodes;
  dynamic startDate;
  dynamic endDate;
  int members;
  dynamic score;

  Top_anime(
      this.malId,
      this.rank,
      this.title,
      this.url,
      this.imageUrl,
      this.type,
      this.episodes,
      this.startDate,
      this.endDate,
      this.members,
      this.score);

  factory Top_anime.fromJson(Map<String, dynamic> json) {
    return Top_anime(
        json['mal_id'],
        json['rank'],
        json['title'],
        json['url'],
        json['image_url'],
        json['type'],
        json['episodes'],
        json['start_date'],
        json['end_date'],
        json['members'],
        json['score']);
  }
}
