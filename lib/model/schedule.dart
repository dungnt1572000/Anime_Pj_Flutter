class Schedule {
  Schedule(
    this.requestHash,
    this.requestCached,
    this.requestCacheExpiry,
    this.api_deprecation,
    this.api_deprecation_date,
    this.api_deprecation_into,
    this.days,
  );
  @override
  String toString() {
    // TODO: implement toString
    return 'Hello '+this.days.length.toString()+' Requesthash: '+this.requestHash;
  }

  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  bool api_deprecation;
  String api_deprecation_date;
  String api_deprecation_into;
  List<Sche_Item> days;

  factory Schedule.fromJson(Map<String, dynamic> json) {
    var list = json.keys.toList();
    String str = list[6];
    var _days;
    switch (str) {
      case 'monday':
        _days = make_List_Sche_Item(str, json);
        break;
      case 'tuesday':
        _days = make_List_Sche_Item(str, json);
        break;
      case 'wednesday':
        _days = make_List_Sche_Item(str, json);
        break;
      case 'thursday':
        _days = make_List_Sche_Item(str, json);
        break;
      case 'friday':
        _days = make_List_Sche_Item(str, json);
        break;
      case 'saturday':
        _days = make_List_Sche_Item(str, json);
        break;
      case 'sunday':
        _days = make_List_Sche_Item(str, json);
        break;
      case 'other':
        _days = make_List_Sche_Item(str, json);
        break;
      case 'unknown':
        _days = make_List_Sche_Item(str, json);
        break;
      default:
        _days = make_List_Sche_Item('monday', json);
        break;
    }

    return Schedule(
        json['request_hash'],
        json['request_cached'],
        json['request_cache_expiry'],
        json['API_DEPRECATION'],
        json['API_DEPRECATION_DATE'],
        json['API_DEPRECATION_INFO'],
        _days);
  }
}

List<Sche_Item> make_List_Sche_Item(String str, Map<String, dynamic> json) {
  if (json[str] != null) {
    var days = json[str] as List;
    List<Sche_Item> _days = days.map((e) => Sche_Item.fromJson(e)).toList();

    return _days;
  } else {
    return [];
  }
}

List<Gerne_Item> make_List_Gerne_Item(String str, Map<String, dynamic> json) {
  if (json[str] != null) {
    var genre = json[str] as List;
    List<Gerne_Item> _genre = genre.map((e) => Gerne_Item.fromJson(e)).toList();
    return _genre;
  } else {
    return [];
  }
}

class Sche_Item {
  Sche_Item(
    this.malId,
    this.url,
    this.title,
    this.imageUrl,
    this.synopsis,
    this.type,
    this.airingStart,
    this.episodes,
    this.members,
    this.genres,
    this.explicitGenres,
    this.themes,
    this.demographics,
    this.source,
    this.producers,
    this.score,
    this.licensors,
    this.r18,
    this.kids,
  );

  int malId;
  String url;
  String title;
  String imageUrl;
  String synopsis;
  String? type;
  String airingStart;
  int? episodes;
  int members;
  List<Gerne_Item> genres;
  List<dynamic>? explicitGenres;
  List<Gerne_Item>? themes;
  List<Gerne_Item>? demographics;
  String source;
  List<Gerne_Item>? producers;
  dynamic score;
  List<dynamic>? licensors;
  bool r18;
  bool kids;

  factory Sche_Item.fromJson(Map<String, dynamic> json) {
    var _make_genres, _make_themes, _make_demographics, _make_producers;
    _make_genres = make_List_Gerne_Item('genres', json);
    _make_themes = make_List_Gerne_Item('themes', json);
    _make_demographics = make_List_Gerne_Item('demographics', json);
    _make_producers = make_List_Gerne_Item('producers', json);

    return Sche_Item(
        json['mal_id'],
        json['url'],
        json['title'],
        json['image_url'],
        json['synopsis'],
        json['type'] ?? '',
        json['airing_start'],
        json['episodes'] ?? 0,
        json['members'],
        _make_genres,
        json['explicit_genres'] ?? [],
        _make_themes,
        _make_demographics,
        json['source'],
        _make_producers,
        json['score'],
        json['licensors'] ?? [],
        json['r18'],
        json['kids']);
  }
}

class Gerne_Item {
  Gerne_Item(
    this.malId,
    this.type,
    this.name,
    this.url,
  );

  int malId;
  String type;
  String name;
  String url;

  factory Gerne_Item.fromJson(Map<String, dynamic> json) {
    return Gerne_Item(json['mal_id'], json['type'], json['name'], json['url']);
  }
}

enum Type { ANIME }
