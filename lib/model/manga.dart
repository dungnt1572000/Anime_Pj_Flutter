class Manga {

  Manga({
    required this.requestHash,
    required this.requestCached,
    required this.requestCacheExpiry,
    required this.malId,
    required this.url,
    required this.title,
    required this.titleEnglish,
    required this.titleSynonyms,
    required this.titleJapanese,
    required this.status,
    required this.imageUrl,
    required this.type,
    required this.volumes,
    required this.chapters,
    required this.publishing,
    required this.published,
    required this.rank,
    required this.score,
    required this.scoredBy,
    required this.popularity,
    required this.members,
    required this.favorites,
    required this.synopsis,
    required this.background,
    required this.related,
    required this.genres,
    required this.explicitGenres,
    required this.demographics,
    required this.themes,
    required this.authors,
    required this.serializations,
    required this.externalLinks,
  });

  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  int malId;
  String url;
  String title;
  dynamic titleEnglish;
  List<dynamic> titleSynonyms;
  String titleJapanese;
  String status;
  String imageUrl;
  String type;
  int volumes;
  int chapters;
  bool publishing;
  Published published;
  int rank;
  double score;
  int scoredBy;
  int popularity;
  int members;
  int favorites;
  String synopsis;
  String background;
  Related related;
  List<Author> genres;
  List<dynamic> explicitGenres;
  List<Author> demographics;
  List<Author> themes;
  List<Author> authors;
  List<Author> serializations;
  List<ExternalLink> externalLinks;

  factory Manga.fromJson(Map<String, dynamic> json) {
    var authors = json['authors'] as List;
    List<Author> _authors = authors.map((e) => Author.fromJson(e)).toList();
    var genres = json['genres'] as List;
    List<Author> _genres = genres.map((e) => Author.fromJson(e)).toList();
    var demographics = json['demographics'] as List;
    List<Author> _demographics =
        demographics.map((e) => Author.fromJson(e)).toList();

    List<Author> _themes ;
    if(json['themes']==null){
      _themes = [];
    }else{
      var themes = json['themes'] as List;
     _themes = themes.map((e) => Author.fromJson(e)).toList();
    }

    var serializations = json['demographics'] as List;
    List<Author> _serializations =
        serializations.map((e) => Author.fromJson(e)).toList();
    var externallinks = json['external_links'] as List;
    List<ExternalLink> _externalink =
        externallinks.map((e) => ExternalLink.fromJson(e)).toList();
    var titleEng;
    if(json['title_english'] == null){
      titleEng = null;
    }else{
      titleEng = json['title_english'];
    }
    return Manga(
        requestHash: json['request_hash'],
        requestCached: json['request_cached'],
        requestCacheExpiry: json['request_cache_expiry'],
        malId: json['mal_id'],
        url: json['url'],
        title: json['title'],
        titleEnglish: titleEng,
        titleSynonyms: json['title_synonyms'],
        titleJapanese: json['title_japanese'],
        status: json['status'],
        imageUrl: json['image_url'],
        type: json['type'],
        volumes: json['volumes'],
        chapters: json['chapters'],
        publishing: json['publishing'],
        published: Published.fromJson(json['published']),
        rank: json['rank'],
        score: json['score'],
        scoredBy: json['scored_by'],
        popularity: json['popularity'],
        members: json['members'],
        favorites: json['favorites'],
        synopsis: json['synopsis'],
        background: json['background'],
        related: Related.fromJson(json['related']),
        genres: _genres,
        explicitGenres: json['explicit_genres'],
        demographics: _demographics,
        themes: _themes,
        authors: _authors,
        serializations: _serializations,
        externalLinks: _externalink);
  }

}

class Author {
  Author({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  int malId;
  String type;
  String name;
  String url;

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
        malId: json['mal_id'],
        type: json['type'],
        name: json['name'],
        url: json['url']);
  }
}

class ExternalLink {
  ExternalLink({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory ExternalLink.fromJson(Map<String, dynamic> json) {
    return ExternalLink(name: json['name'], url: json['url']);
  }
}

class Published {
  Published({
    required this.from,
    required this.to,
    required this.prop,
    required this.string,
  });

  String from;
  String to;
  Prop prop;
  String string;

  factory Published.fromJson(Map<String, dynamic> json) {
    return Published(
        from: json['from'],
        to: json['to'],
        prop: Prop.fromJson(json['prop']),
        string: json['string']);
  }
}

class Prop {
  Prop({
    required this.from,
    required this.to,
  });

  From from;
  From to;

  factory Prop.fromJson(Map<String, dynamic> json) {
    return Prop(
        from: From.fromJson(json['from']), to: From.fromJson(json['to']));
  }
}

class From {
  From({
    required this.day,
    required this.month,
    required this.year,
  });

  int day;
  int month;
  int year;

  factory From.fromJson(Map<String, dynamic> json) {
    return From(day: json['day'], month: json['month'], year: json['year']);
  }
}

class Related {
  List<List<Author>> myList;
  Related({required this.myList});

  factory Related.fromJson(Map<String, dynamic> json) {
    List<List<Author>> _myList=[];
    json.keys.forEach((element) {
        var myelement = json[element] as List;
        List<Author> _myelement = myelement.map((e) => Author.fromJson(e)).toList();
        _myList.add(_myelement);
    });

    // var side_story = json['Side story'] as List;
    // var adaptation = json['Adaptation'] as List;
    //
    // List<Author> _sideStory =
    //     side_story.map((tagJson) => Author.fromJson(tagJson)).toList();
    // List<Author> _adaptation =
    //     adaptation.map((tagJson) => Author.fromJson(tagJson)).toList();


    return Related(myList: _myList);
  }
}

