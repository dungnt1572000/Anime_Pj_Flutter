class Animes_News {
  Animes_News({
    required this.requestHash,
    required this.requestCached,
    required this.requestCacheExpiry,
    required this.articles,
  });

  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  List<Article> articles;

  factory Animes_News.fromJson(Map<String, dynamic> json) {
    var _articles = json['articles'] as List;
    List<Article> _listarticles =
        _articles.map((e) => Article.fromJson(e)).toList();
    return Animes_News(
        requestHash: json['request_hash'],
        requestCached: json['request_cached'],
        requestCacheExpiry: json['request_cache_expiry'],
        articles: _listarticles);
  }
}

class Article {
  Article({
    required this.url,
    required this.title,
    required this.date,
    required this.authorName,
    required this.authorUrl,
    required this.forumUrl,
    required this.imageUrl,
    required this.comments,
    required this.intro,
  });

  String url;
  String title;
  String date;
  String authorName;
  String authorUrl;
  String forumUrl;
  String imageUrl;
  int comments;
  String intro;


  factory Article.fromJson(Map<String, dynamic> json) {
    if(json['image_url'] == null){
      return Article(
          url: json['url'],
          title: json['title'],
          date: json['date'],
          authorName: json['author_name'],
          authorUrl: json['author_url'],
          forumUrl: json['forum_url'],
          imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Flag_of_None_%28square%29.svg/768px-Flag_of_None_%28square%29.svg.png',
          comments: json['comments'],
          intro: json['intro']);
    }
    else{
      return Article(
          url: json['url'],
          title: json['title'],
          date: json['date'],
          authorName: json['author_name'],
          authorUrl: json['author_url'],
          forumUrl: json['forum_url'],
          imageUrl: json['image_url'],
          comments: json['comments'],
          intro: json['intro']);
    }
  }
}
