class Top_Manga {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  List<Top> top;

  Top_Manga(this.requestHash, this.requestCached, this.requestCacheExpiry,
      this.top); // Top_Manga(
  //     {required this.requestHash,
  //     required this.requestCached,
  //     required this.requestCacheExpiry,
  //     required this.top});

  factory Top_Manga.fromJson(Map<String, dynamic> json) {
    var myTop = json['top'] as List;
    List<Top> _myTop = myTop.map((e) => Top.fromJson(e)).toList();
    return Top_Manga(json['request_hash'], json['request_cached'],
        json['request_cache_expiry'], _myTop);
  }
}

class Top {
  int malId;
  int rank;
  String title;
  String url;
  String type;
  dynamic volumes;
  dynamic startDate;
  dynamic endDate;
  int members;
  dynamic score;
  String imageUrl;

  Top(this.malId, this.rank, this.title, this.url, this.type, this.volumes,
      this.startDate, this.endDate, this.members, this.score, this.imageUrl);

  // Top(
  //     {required this.malId,
  //     required this.rank,
  //     required this.title,
  //     required this.url,
  //     required this.type,
  //     required this.volumes,
  //     required this.startDate,
  //     required this.endDate,
  //     required this.members,
  //     required this.score,
  //     required this.imageUrl});

  factory Top.fromJson(Map<String, dynamic> json) {
    var _volumes;
    if(json['volumes']==null){
      _volumes == null;
    }else{
      _volumes = json['volumes'];
    }
    var _end_date;
    if(json['end_date']==null){
      _end_date = null;
    }else{
      _end_date = json['end_date'];
    }
    return Top(
        json['mal_id'],
        json['rank'],
        json['title'],
        json['url'],
        json['type'],
        _volumes,
        json['start_date'],
        _end_date,
        json['members'],
        json['score'],
        json['image_url']);
  }
}
