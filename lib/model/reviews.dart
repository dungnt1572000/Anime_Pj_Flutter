class My_Reviews {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  List<Reviews> reviews;

  My_Reviews(
      {required this.requestHash,
      required this.requestCached,
      required this.requestCacheExpiry,
      required this.reviews});

  factory My_Reviews.fromJson(Map<String, dynamic> json) {
    var makereview = json['reviews'] as List;
    List<Reviews> _reviews =
        makereview.map((e) => Reviews.fromJson(e)).toList();

    return My_Reviews(
        requestHash: json['request_hash'],
        requestCached: json['request_cached'],
        requestCacheExpiry: json['request_cache_expiry'],
        reviews: _reviews);
  }
}

class Reviews {
  int malId;
  String url;
  void type;
  int helpfulCount;
  String date;
  Reviewer reviewer;
  String content;

  Reviews(
      {required this.malId,
      required this.url,
      this.type,
      required this.helpfulCount,
      required this.date,
      required this.reviewer,
      required this.content});

  factory Reviews.fromJson(Map<String, dynamic> json) {
    return Reviews(
        malId: json['mal_id'],
        url: json['url'],
        helpfulCount: json['helpful_count'],
        date: json['date'],
        reviewer: Reviewer.fromJson(json['reviewer']),
        content: json['content']);
  }
}

class Reviewer {
  String url;
  String imageUrl;
  String username;
  int chaptersRead;
  Scores scores;

  Reviewer(
      {required this.url,
      required this.imageUrl,
      required this.username,
      required this.chaptersRead,
      required this.scores});

  factory Reviewer.fromJson(Map<String, dynamic> json) {
    return Reviewer(
        url: json['url'],
        imageUrl: json['image_url'],
        username: json['username'],
        chaptersRead: json['chapters_read'],
        scores: Scores.fromJson(json['scores']));
  }
}

class Scores {
  int overall;
  int story;
  int art;
  int character;
  int enjoyment;

  Scores(
      {required this.overall,
      required this.story,
      required this.art,
      required this.character,
      required this.enjoyment});

  factory Scores.fromJson(Map<String, dynamic> json) {
    return Scores(
        overall: json['overall'],
        story: json['story'],
        art: json['art'],
        character: json['character'],
        enjoyment: json['enjoyment']);
  }
}
